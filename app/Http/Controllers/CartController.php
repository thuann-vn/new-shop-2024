<?php


namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderRequest;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Postcode;
use App\Models\Product;
use App\Models\ProductVariation;
use App\Models\Setting;
use App\Models\UserAddress;
use App\Models\UserPoint;
use App\Services\MonoovaService;
use App\Services\ShippingFeeService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use function App\Http\Controllers\Client\getMoneyFromPoints;
use function App\Http\Controllers\Client\renderAddress;

class CartController extends Controller
{
    private ShippingFeeService $shippingFeeService;

    public function __construct(ShippingFeeService $shippingFeeService)
    {
        $this->shippingFeeService = $shippingFeeService;
    }

    public function index()
    {
        $user = auth()->user();
        if (!empty($user)) {
            $userDefaultAddress = $user->addresses()->where('is_default', 1)->first();
        } else {
            $userDefaultAddress = session()->get('guest_address');
        }

        \Cart::setGlobalTax(Setting::get('tax_rate', 10));
        $minOrderFreeShipping = Setting::get('min_order_free_ship', 100);
        $orderFreeShippingAmount = Setting::get('order_free_ship_amount', 20);

        if (!\Cart::count()) {
            return view('pages.client.cart.checkout_empty');
        }

        list($groupByBrand) = $this->getCartGroupedByBrand([], $userDefaultAddress);
        return view('pages.client.cart.index', compact('groupByBrand', 'userDefaultAddress', 'user', 'minOrderFreeShipping', 'orderFreeShippingAmount'));
    }

    public function addToCart(Request $request)
    {
        $qty = $request->input('quantity', 1);
        $product = Product::findOrFail($request->id);

        //Check if product is in stock
        if ($product->stock < $qty) {
            return response()->json([
                'status' => 'error',
                'message' => 'Product is out of stock!'
            ]);
        }

        //Check if product have any variation
        if ($product->has_variation) {
            $variation_id = $request->variation_id;
            if (empty($variation_id)) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Please select variation!'
                ]);
            }
            $variation = $product->variations()->where('id', $variation_id)->first();
            $product->price = $variation->price;
            \Cart::add($product, $qty, [
                'image' => $product->image,
                'type' => 'product',
                'brand_name' => !empty($product->brand) ? $product->brand->name : '',
                'variation' => $variation,
                'variation_description' => $variation->description
            ]);
        } else {
            \Cart::add($product, $qty, [
                'image' => $product->image,
                'type' => 'product',
                'brand_name' => !empty($product->brand) ? $product->brand->name : '',
            ]);
        }

        return response()->json([
            'view' => view('partials.cart.cart-content')->render(),
            'count' => \Cart::count()
        ]);
    }

    public function removeFromCart(Request $request)
    {
        $rowId = $request->id;
        foreach (explode(',', $rowId) as $id) {
            \Cart::remove($id);
        }
        return response()->json([
            'count' => \Cart::count(),
            'view' => view('partials.cart.cart-content')->render()
        ]);
    }

    public function updateCart(Request $request)
    {
        $rowId = $request->rowId;
        $qty = $request->input('qty', 1);
        \Cart::update($rowId, $qty);
        return response()->json([
            'view' => view('partials.cart.cart-content')->render(),
            'count' => \Cart::count()
        ]);
    }

    public function getCartSummary(Request $request)
    {
        $selectedItems = $request->input('selected', []);
        if (empty($selectedItems)) {
            return view('partials.cart.cart-summary', [
                'subTotal' => 0,
                'shippingFee' => 0,
                'tax' => 0,
                'total' => 0
            ])->render();
        }

        list(, $subTotal, $shippingFee, $tax, $total) = $this->getCartGroupedByBrand($selectedItems);
        return view('partials.cart.cart-summary', compact('subTotal', 'shippingFee', 'tax', 'total'))->render();
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function checkout(Request $request)
    {
        $user = auth()->user();
        if (!empty($user)) {
            $userDefaultAddress = $user->addresses()->where('is_default', 1)->first();
        } else {
            $userDefaultAddress = session()->get('guest_address');
        }

        \Cart::setGlobalTax(Setting::get('tax_rate', 10));
        $shippingFee = Setting::get('shipping_fee', 20);
        $minOrderFreeShipping = Setting::get('min_order_free_ship', 100);
        $orderFreeShippingAmount = Setting::get('order_free_ship_amount', 20);

        $selectedItems = $request->selected;
        $cartContent = \Cart::content();
        if (!empty($selectedItems)) {
            session()->put('selected_items', $selectedItems);
            $cartContent = $cartContent->whereIn('rowId', array_keys($selectedItems));
        }
        if (!$cartContent->count()) {
            return view('pages.client.cart.checkout_empty');
        }

        //Group cart by brands
        list($groupByBrand, $subTotal, $shippingFee, $tax, $total, $countItems) = $this->getCartGroupedByBrand($selectedItems, $userDefaultAddress);

        return view('pages.client.cart.checkout', compact('userDefaultAddress', 'user', 'shippingFee', 'subTotal', 'tax', 'total', 'cartContent', 'groupByBrand', 'countItems', 'minOrderFreeShipping', 'orderFreeShippingAmount'));
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCheckoutSummary(Request $request)
    {
        //Get address
        if (auth()->check()) {
            $address = auth()->user()->addresses()->where('id', $request->address_id)->first();
        } else {
            $address = session()->get('guest_address');
        }

        //Get cart summary again
        $cartContent = \Cart::content();
        $selectedItems = session()->get('selected_items', []);
        list($groupByBrand, $subTotal, $shippingFee, $tax, $total, $countItems) = $this->getCartGroupedByBrand($selectedItems, $address);

        //Check if use point
        $pointValue = 0;
        $maxPointCanUse = 0;
        $usePoint = $request->input('use_point', false);
        if (filter_var($usePoint, FILTER_VALIDATE_BOOLEAN)) {
            $maxPointCanUse = min(auth()->user()->points, getPointsFromMoney($total));
            $pointValue = getMoneyFromPoints($maxPointCanUse);
            $total -= $pointValue;
            if ($total < 0) {
                $total = 0;
            }
        }

        return response()->json([
            'status' => true,
            'summary' => view('partials.checkout.checkout-summary', compact('subTotal', 'shippingFee', 'tax', 'total', 'cartContent', 'maxPointCanUse', 'pointValue', 'usePoint', 'countItems'))->render(),
            'items' => view('partials.checkout.checkout-items', compact('groupByBrand'))->render()
        ]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function checkoutSingle(Request $request)
    {
        $user = auth()->user();
        try {
            if (!empty($user)) {
                //Erase old cart
                \Cart::erase((string)$user->id);

                //Save current cart
                \Cart::store((string)$user->id);
            } else {
                $guestId = Str::uuid();
                session()->put('guest_id', $guestId);
                \Cart::erase($guestId);
                \Cart::store($guestId);
            }

            //Clear cart
            \Cart::destroy();
        } catch (\Exception $e) {
            \Log::error('Save cart error: ' . $e->getMessage());
        }

        //Add new cart
        $product = Product::findOrFail($request->product_id);
        $qty = $request->input('quantity', 1);

        //Check if product have any variation
        if ($product->has_variation) {
            $variation_id = $request->variation_id;
            if (empty($variation_id)) {
                throw new \Exception("Please select variation!");
            }
            $variation = $product->variations()->where('id', $variation_id)->first();
            $product->price = $variation->price;
            \Cart::add($product, $qty, [
                'image' => $product->image,
                'type' => 'product',
                'brand_name' => !empty($product->supplier) ? $product->supplier->name : '',
                'variation_id' => $variation_id,
                'variation' => $variation,
                'variation_description' => $variation->description
            ]);
        } else {
            \Cart::add($product, $qty, [
                'image' => $product->image,
                'type' => 'product',
                'brand_name' => !empty($product->supplier) ? $product->supplier->name : '',
            ]);
        }
        session()->remove('selected_items');
        session()->put('selected_items', [
            \Cart::content()->first()->rowId => 1
        ]);
        return redirect()->route('client.checkout');
    }

    /**
     * @param Request $request
     * @return string
     */
    public function changePaymentMethod(Request $request)
    {
        $paymentMethod = $request->payment_method;
        session()->put('payment_method', $paymentMethod);
        return view('partials.checkout.selected_payment_method', compact('paymentMethod'))->render();
    }

    /**
     * @param OrderRequest $request
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            if (!\Cart::count()) {
                throw new \Exception("There is no products in cart!");
            }

            //Validate input
            $validateRules = [
                'address_id' => 'required',
                'payment_method' => 'required',
            ];
            $validator = Validator::make($request->all(), $validateRules, [
                'address_id.required' => 'Please select shipping address',
                'payment_method.required' => 'Please select payment method'
            ]);
            if ($validator->fails()) {
                return response()->json([
                    'status' => 'error',
                    'message' => $validator->errors()->first()
                ]);
            }

            $params = $request->all();
            $address_id = $params['address_id'];

            //Check user address
            if (auth()->check()) {
                $address = auth()->user()->addresses()->where('id', $address_id)->first();
                if (!$address) {
                    throw new \Exception("Address not found!");
                }
            } else {
                $guestAddress = session()->get('guest_address');
                if (!$guestAddress) {
                    throw new \Exception("Address not found!");
                }
                //Save address to database
                $address = new UserAddress();
                $address->fill($guestAddress->toArray());
                $address->save();
                $address_id = $address->id;
            }

            //Payment method
            $paymentMethod = $request->input('payment_method', '');
            if (!$paymentMethod) {
                throw new \Exception("Please select payment method!");
            } else if ($paymentMethod == Order::PAYMENT_TYPE_LETTER_OF_CREDIT && !auth()->check()) {
                if (!auth()->check()) {
                    throw new \Exception("Please login to use this payment method!");
                } else if (!auth()->user()->accept_letter_of_credit) {
                    throw new \Exception("You have not permission to use this payment method!");
                }
            }

            //Group cart by brands
            $selectedItems = session()->get('selected_items');
            list($groupByBrand, $subtotal, $shippingFee, $tax, $total) = $this->getCartGroupedByBrand($selectedItems, $address);
            if (empty($groupByBrand) || $total <= 0) {
                throw new \Exception("There is no products in cart!");
            }

            //Check if use points
            $usePoint = $request->input('use_point', false);
            $usePoint = filter_var($usePoint, FILTER_VALIDATE_BOOLEAN);
            $pointValue = 0;
            $maxPointCanUse = 0;
            if ($usePoint) {
                $maxPointCanUse = min(auth()->user()->points, getPointsFromMoney($total));
                $pointValue = getMoneyFromPoints($maxPointCanUse);
                $total -= $pointValue;
                if ($total < 0) {
                    $total = 0;
                }
            }

            //Payment status
            $paymentStatus = Order::PAYMENT_STATUS_PENDING;
            if ($total <= 0) {
                $paymentStatus = Order::PAYMENT_STATUS_PAID;
            } else if ($paymentMethod == Order::PAYMENT_TYPE_LETTER_OF_CREDIT) {
                $paymentStatus = Order::PAYMENT_STATUS_WAITING;
            }

            if (count($groupByBrand) >= 2) {
                //Create a parent order
                $parentOrder = new Order([
                    'address_id' => $address_id,
                    'name' => auth()->user() ? auth()->user()->full_name : $address->name,
                    'phone' => $address->phone,
                    'address' => $address->full_address,
                    'address_line_1' => $address->address_line_1,
                    'address_line_2' => $address->address_line_2,
                    'city_code' => $address->city_code,
                    'city' => $address->city,
                    'suburb' => $address->suburb,
                    'suburb_code' => $address->suburb_code,
                    'zipcode' => $address->zipcode,
                    'lat' => $address->lat,
                    'lng' => $address->lng,
                    'email' => $address->email,
                    'subtotal' => $subtotal,
                    'shipping_fee' => $shippingFee,
                    'tax' => $tax,
                    'points_amount' => $maxPointCanUse,
                    'points_value' => $pointValue,
                    'total' => $total,
                    'status' => Order::STATUS_PENDING,
                    'payment_status' => $paymentStatus,
                    'user_id' => auth()->user() ? auth()->user()->id : null,
                    'child_order_count' => count($groupByBrand),
                    'payment_type' => $paymentMethod,
                    'use_points' => $usePoint,
                    'estimated_delivery_at' => now()->addDays(Setting::get('estimated_delivery_days', 15))
                ]);

                $parentOrder->save();
            }
            $remainPoints = $maxPointCanUse;
            foreach ($groupByBrand as $group) {
                if ($usePoint) {
                    $maxPointCanUse = min($remainPoints, getPointsFromMoney($group['subtotal']));
                    $pointValue = getMoneyFromPoints($maxPointCanUse);
                    $remainPoints -= $maxPointCanUse;
                }
                $order = new Order([
                    'address_id' => $address_id,
                    'name' => auth()->user() ? auth()->user()->full_name : $address->name,
                    'phone' => $address->phone,
                    'address' => $address->full_address,
                    'address_line_1' => $address->address_line_1,
                    'address_line_2' => $address->address_line_2,
                    'city_code' => $address->city_code,
                    'city' => $address->city,
                    'suburb' => $address->suburb,
                    'suburb_code' => $address->suburb_code,
                    'zipcode' => $address->zipcode,
                    'lat' => $address->lat,
                    'lng' => $address->lng,
                    'email' => $address->email,
                    'subtotal' => $group['subtotal'],
                    'shipping_fee' => $group['shipping_fee'],
                    'tax' => $group['tax'],
                    'total' => $group['subtotal'] + $group['shipping_fee'] + $group['tax'],
                    'points_amount' => $maxPointCanUse,
                    'points_value' => $pointValue,
                    'payment_status' => $paymentStatus,
                    'supplier_id' => $group['supplier_id'],
                    'user_id' => auth()->user() ? auth()->user()->id : null,
                    'parent_id' => isset($parentOrder) ? $parentOrder->id : null,
                    'payment_type' => $paymentMethod,
                    'status' => Order::STATUS_PENDING,
                    'estimated_delivery_at' => Carbon::parse(!empty($group['items'][0]->model->sale_end_at) ? $group['items'][0]->model->sale_end_at : time())->addDays(Setting::get('estimated_delivery_days', 15)),
                ]);

                //Check if user is referred by someone
                if (session()->has('referral_user_id')) {
                    $order->referral_user_id = session()->get('referral_user_id', null);
                }

                $order->save();

                foreach ($group['items'] as $item) {
                    $detail = new OrderDetail([
                        'order_id' => $order->id,
                        'product_id' => $item->id,
                        'qty' => $item->qty,
                        'price' => $item->price,
                        'total' => $item->qty * $item->price,
                        'variation_id' => !empty($item->options['variation_id']) ? $item->options['variation_id'] : null,
                        'variation_description' => !empty($item->options['variation_description']) ? $item->options['variation_description'] : null,
                    ]);
                    $detail->save();

                    //Update product stock
                    if (!empty($item->options['variation_id'])) {
                        $productVariant = ProductVariation::findOrFail($item->options['variation_id']);
                        $productVariant->decreaseStock($item->qty, [
                            'description' => 'Order ' . $order->id,
                            'reference' => $detail,
                        ]);
                    } else {
                        $product = Product::findOrFail($item->id);
                        $product->decreaseStock($item->qty, [
                            'description' => 'Order ' . $order->id,
                            'reference' => $detail,
                        ]);
                    }
                }

                //If use point, create point history
                if ($usePoint) {
                    $pointHistory = new UserPoint([
                        'user_id' => auth()->user()->id,
                        'type' => UserPoint::TYPE_ORDER,
                        'amount' => -$maxPointCanUse,
                        'current_point' => auth()->user()->points,
                        'order_id' => $order->id
                    ]);
                    $pointHistory->save();

                    $user = auth()->user();
                    $user->points = $user->points - $maxPointCanUse;
                    $user->points_used += $maxPointCanUse;
                    $user->save();
                }
            }

            //Commit database
            DB::commit();

            //Destroy cart
            \Cart::destroy();

            //Restore if there is any cart stored
            try {
                if (auth()->check())
                    \Cart::restore((string)auth()->user()->id);
            } catch (\Exception $e) {
                \Log::error('Restore cart error: ' . $e->getMessage());
            }

            //Set as session
            $createdOrderId = !empty($parentOrder) ? $parentOrder->id : $order->id;
            session()->put('created_order_id', $createdOrderId);

            if ($request->ajax()) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Order created successfully!',
                    'id' => $createdOrderId,
                    'is_completed' => $total <= 0 || $paymentMethod == Order::PAYMENT_TYPE_LETTER_OF_CREDIT,
                    'redirect' => route('client.view-order', ['id' => $createdOrderId])
                ]);
            }
            return redirect()->route('client.view-order', ['id' => $createdOrderId]);
        } catch (\Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }

    public function setAddress(Request $request)
    {
        $validateRules = [
            'email' => 'required|min:5|max:255',
            'phone' => 'required|min:9|max:12',
            'address_line_1' => 'required|min:5|max:255',
            'country' => 'required|max:255',
            'city' => 'required|max:255',
            'suburb' => 'required|max:255',
            'zipcode' => 'required|max:255',
        ];
        $validator = Validator::make($request->all(), $validateRules);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors(), 'status' => false], 422);
        }

        $address = new UserAddress($request->all());
        $postCode = Postcode::findOrFail($request->suburb);
        $address->suburb_code = $request->suburb;
        $address->suburb = $postCode->suburb;
        $address->city_code = $postCode->state;
        $address->city = $postCode->state_name;
        $address->text = renderAddress($address);

        if (auth()->user()) {
            $address->user_id = auth()->user()->id;
            $address->name = auth()->user()->full_name;
            $address->phone = auth()->user()->phone;
        } else {
            $address->first_name = $request->first_name;
            $address->last_name = $request->last_name;
            $address->name = $request->first_name . ' ' . $request->last_name;
            $address->phone = $request->phone;
        }
        \Session::put('guest_address', $address);


        //Get cart summary again
        $selectedItems = session()->get('selected_items');
        $cartContent = \Cart::content();
        if (!empty($selectedItems)) {
            session()->put('selected_items', $selectedItems);
            $cartContent = $cartContent->whereIn('rowId', array_keys($selectedItems));
        }

        list($groupByBrand, $subTotal, $shippingFee, $tax, $total, $countItems) = $this->getCartGroupedByBrand($selectedItems, $address);
        $minOrderFreeShipping = Setting::get('min_order_free_ship', 100);
        $orderFreeShippingAmount = Setting::get('order_free_ship_amount', 20);

        return response()->json([
            'status' => true,
            'message' => 'Address created successfully',
            'data' => $address,
            'summary' => view('partials.checkout.checkout-summary', compact('countItems', 'subTotal', 'shippingFee', 'tax', 'total', 'cartContent'))->render(),
            'items' => view('partials.checkout.checkout-items', compact('groupByBrand', 'minOrderFreeShipping', 'orderFreeShippingAmount'))->render()
        ]);
    }

    /**
     * Get cart grouped by brand
     * @param $selectedItems
     * @return array
     */
    private function getCartGroupedByBrand($selectedItems = [], UserAddress $shippingAddress = null)
    {
        $defaultShippingFee = Setting::get('shipping_fee', 20);
        $cartContent = \Cart::content();
        $minOrderFreeShipping = Setting::get('min_order_free_ship', 100);
        $orderFreeShippingAmount = Setting::get('order_free_ship_amount', 20);
        if (!empty($selectedItems)) {
            session()->put('selected_items', $selectedItems);
            $cartContent = $cartContent->whereIn('rowId', array_keys($selectedItems));
        }

        //Group cart by brands
        $groupByBrand = [];
        $subTotal = 0;
        $shippingFee = 0;
        $countItems = 0;
        foreach ($cartContent as $item) {
            $brandName = !empty($item->model->supplier) ? $item->model->supplier->name : 'Other';
            if (!isset($groupByBrand[$brandName])) {
                $groupByBrand[$brandName] = [
                    'items' => [],
                    'shipping_fee' => $defaultShippingFee,
                    'subtotal' => 0,
                    'tax' => 0,
                    'supplier_id' => !empty($item->model->supplier) ? $item->model->supplier->id : null,
                ];
            }
            $groupByBrand[$brandName]['items'][] = $item;
            $groupByBrand[$brandName]['subtotal'] += ($item->price * $item->qty);
            $groupByBrand[$brandName]['tax'] += $item->price * $item->qty * Setting::get('tax_rate', 10) / 100;
            $subTotal += $item->price * $item->qty;
            $countItems += $item->qty;
        }
        $tax = $subTotal * Setting::get('tax_rate', 10) / 100;

        //Get total shipping fee
        foreach ($groupByBrand as $brandName => $group) {
            //Calculate shipping fee
            $orderShippingFee = !empty($shippingAddress) ? $this->shippingFeeService->calculateShippingFee(
                $shippingAddress, $group['items']
            ) : $defaultShippingFee;

            if ($groupByBrand[$brandName]['subtotal'] >= $minOrderFreeShipping) {
                if ($orderFreeShippingAmount > $groupByBrand[$brandName]['shipping_fee']) {
                    $orderShippingFee = 0;
                } else {
                    $orderShippingFee = $orderFreeShippingAmount - $orderShippingFee;
                }
                $groupByBrand[$brandName]['shipping_fee_discount_applied'] = true;
            }

            $shippingFee += $orderShippingFee;
            $groupByBrand[$brandName]['shipping_fee'] = $orderShippingFee;
        }
        return [$groupByBrand, $subTotal, $shippingFee, $tax, $subTotal + $shippingFee + $tax, $countItems];
    }

    public function createdOrderDetail()
    {
        $order_id = session()->get('created_order_id');
        $order = Order::findOrFail($order_id);
        if (count($order->childOrders)) {
            $orders = $order->childOrders;
        } else {
            $orders = [$order];
        }
        return view('partials.order.order-detail-popup', compact('orders', 'order'))->render();
    }
}
