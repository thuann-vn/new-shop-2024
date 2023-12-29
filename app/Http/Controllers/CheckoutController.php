<?php


namespace App\Http\Controllers;

use App\Enums\OrderStatus;
use App\Models\District;
use App\Models\Province;
use App\Models\Shop\Order;
use App\Models\Shop\Product;
use App\Models\Ward;
use App\Services\ShippingFeeService;
use App\Settings\ShopSettings;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class CheckoutController extends Controller
{
  private ShippingFeeService $shippingFeeService;
  private ShopSettings $shopSettings;

  public function __construct(ShippingFeeService $shippingFeeService, ShopSettings $shopSettings)
  {
    $this->shippingFeeService = $shippingFeeService;
    $this->shopSettings = $shopSettings;
  }

  public function index()
  {
    \Cart::setGlobalTax($this->shopSettings->shop_tax);
    $items = array_values(\Cart::content()->toArray());
    $subtotal = \Cart::subtotalFloat();
    $tax = \Cart::taxFloat();
    $shippingFee = 0;
    $total = \Cart::totalFloat();
    $shippingMethods = array_filter($this->shopSettings->shipping_methods, function ($method) {
      return $method['enabled'];
    });
    $paymentMethods = array_filter($this->shopSettings->payment_methods, function ($method) {
      return $method['enabled'];
    });
    return Inertia::render('Checkout/Checkout', compact('items', 'subtotal', 'total', 'tax', 'shippingFee', 'shippingMethods', 'paymentMethods'));
  }

  /**
   * @param OrderRequest $request
   * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
   * @throws \Exception
   */
  public function placeOrder(Request $request)
  {
    try {
      DB::beginTransaction();
      if (!\Cart::count()) {
        throw new \Exception("There is no products in cart!");
      }

      //Validate input
      $validateRules = [
          'shipping_method' => 'required',
          'payment_method' => 'required',
          'full_name' => 'required',
          'phone' => 'required',
          'email' => 'required|email',
          'address' => 'required',
          'province_code' => 'required',
          'district_code' => 'required',
          'ward_code' => 'required',
      ];

      $validator = Validator::make($request->all(), $validateRules, [
          'shipping_method.required' => 'Please select shipping method',
          'payment_method.required' => 'Please select payment method'
      ]);

      if ($validator->fails()) {
        return response()->json([
            'status' => 'error',
            'message' => array_values($validator->errors()->toArray())
        ], 422);
      }

      $params = $request->all();

      //Get shipping fee
      $shippingPrice = $this->shippingFeeService->calculateShippingFee($params['province_code'], $params['district_code'], $params['shipping_method']);

      //Create order first
      $order = Order::create([
          'number' => Carbon::now()->format('YmdHis'),
          'shipping_price' => $shippingPrice,
          'shipping_method' => $params['shipping_method'],
          'currency' => $this->shopSettings->shop_currency,
          'tax' => \Cart::taxFloat(),
          'total_price' => \Cart::totalFloat(),
          'payment_method' => $params['payment_method'],
          'status' => OrderStatus::New,
          'shop_customer_id' => auth()->check() ? auth()->user()->id : null
      ]);

      //Create detail
      $index = 0;
      foreach (\Cart::content() as $item) {
        $order->items()->create([
            'shop_product_id' => $item->id,
            'qty' => $item->qty,
            'unit_price' => $item->price,
            'sort' => $index,
        ]);
        $index++;
      }

      //Create address
      $order->address()->create([
          'name' => $params['full_name'],
          'phone' => $params['phone'],
          'email' => $params['email'],
          'street' => $params['address'],
          'district_code' => $params['district_code'],
          'province_code' => $params['province_code'],
          'ward_code' => $params['ward_code'],
          'district' => District::findOrFail($params['district_code'])->full_name,
          'province' => Province::findOrFail($params['province_code'])->full_name,
          'ward' => Ward::findOrFail($params['ward_code'])->full_name
      ]);

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
      session()->put('created_order_id', $order->id);

      return response()->json([
          'status' => 'success',
          'message' => 'Order created successfully!',
          'id' => $order->id
      ]);
    } catch (\Exception $e) {
      DB::rollBack();
      throw $e;
    }
  }

  public function orderSummary()
  {
    $order = Order::findOrFail(session()->get('created_order_id'));
    $order->items->load('product');
    $order->load('address');
    return Inertia::render('Checkout/OrderSummary', compact('order'));
  }

  public function getProvinces()
  {
    $provinces = Province::orderBy('full_name', 'asc')->get();
    return response()->json([
        'status' => 'success',
        'data' => $provinces
    ]);
  }

  public function getDistricts(Request $request)
  {
    $province_id = $request->input('province_id');
    $districts = Province::findOrFail($province_id)->districts()->orderBy('display_order', 'asc')->orderBy('full_name', 'asc')->get();
    return response()->json([
        'status' => 'success',
        'data' => $districts
    ]);
  }

  public function getWards(Request $request)
  {
    $district_id = $request->input('district_id');
    $wards = District::findOrFail($district_id)->wards()->orderBy('full_name', 'asc')->get();
    return response()->json([
        'status' => 'success',
        'data' => $wards
    ]);
  }
}
