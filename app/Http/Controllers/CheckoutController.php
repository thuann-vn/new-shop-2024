<?php


namespace App\Http\Controllers;

use App\Models\District;
use App\Models\Province;
use App\Models\Shop\Product;
use App\Services\ShippingFeeService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Inertia\Inertia;

class CheckoutController extends Controller
{
    private ShippingFeeService $shippingFeeService;

    public function __construct(ShippingFeeService $shippingFeeService)
    {
        $this->shippingFeeService = $shippingFeeService;
    }

    public function index(){
      $items = array_values(\Cart::content()->toArray());
      $subtotal = \Cart::subtotal();
      $tax = \Cart::tax();
      $shippingFee = 0;
      $total = \Cart::total();
      return Inertia::render('Checkout/Checkout', compact('items', 'subtotal', 'total', 'tax', 'shippingFee'));
    }

    public function getProvinces(){
      $provinces = Province::orderBy('name', 'asc')->get();
      return response()->json([
        'status' => 'success',
        'data' => $provinces
      ]);
    }

    public function getDistricts(Request $request){
      $province_id = $request->input('province_id');
      $districts = Province::findOrFail($province_id)->districts()->orderBy('display_order', 'asc')->orderBy('name', 'asc')->get();
      return response()->json([
        'status' => 'success',
        'data' => $districts
      ]);
    }

    public function getWards(Request $request){
      $district_id = $request->input('district_id');
      $wards = District::where($district_id)->wards()->orderBy('name', 'asc')->get();
      return response()->json([
        'status' => 'success',
        'data' => $wards
      ]);
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
}
