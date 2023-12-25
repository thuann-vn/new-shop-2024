<?php


namespace App\Http\Controllers;

use App\Models\Shop\Product;
use App\Services\ShippingFeeService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class CartController extends Controller
{
    private ShippingFeeService $shippingFeeService;

    public function __construct(ShippingFeeService $shippingFeeService)
    {
        $this->shippingFeeService = $shippingFeeService;
    }

    public function addToCart(Request $request)
    {
        $qty = $request->input('quantity', 1);
        $product = Product::findOrFail($request->id);

        //Check if product is in stock
        if ($product->qty < $qty) {
            return response()->json([
                'status' => 'error',
                'message' => 'Product is out of stock!'
            ]);
        }

        //Check if product have any variation
        if ($product->has_variants) {
            $variant_id = $request->variant_id;
            if (empty($variant_id)) {
                $variant_id = $product->variants()->first()->id;
            }
            $variant = $product->variants()->where('id', $variant_id)->first();
            $product->price = $variant->price;
            \Cart::add($product, $qty, [
                'image' => $product->featured_image_url,
                'href' => route('products.detail', ['slug' => $product->slug]),
                'type' => 'variant',
                'variant' => $variant,
                'variant_description' => $variant->description
            ]);
        } else {
            \Cart::add($product, $qty, [
                'image' => $product->featured_image_url,
                'href' => route('products.detail', ['slug' => $product->slug]),
            ]);
        }

        return response()->json([
            'status' => 'success',
        ]);
    }

    public function removeFromCart(Request $request)
    {
        $rowId = $request->id;
        foreach (explode(',', $rowId) as $id) {
            \Cart::remove($id);
        }
        return response()->json([
            'status' => 'success',
        ]);
    }

    public function updateCart(Request $request)
    {
        $rowId = $request->rowId;
        $qty = $request->input('qty', 1);
        \Cart::update($rowId, $qty);
        return response()->json([
            'status' => 'success',
        ]);
    }
}
