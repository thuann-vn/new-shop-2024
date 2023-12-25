<?php

namespace App\Http\Controllers;

use App\Models\Page;
use App\Models\Shop\Collection;
use App\Settings\GeneralSettings;
use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\SEOTools;
use Inertia\Inertia;

class ProductController extends Controller
{
  public function index(Page $page)
  {
    $homeSlider = \App\Models\Slider::with('items')->where('code', 'home-slider')->first()->toArray();
    $collections = Collection::whereIsVisible(true)->whereHas('products', function ($productsQuery) {
      $productsQuery->whereIsVisible(true);
    })->get();
    return Inertia::render('Home', compact('homeSlider', 'collections'));
  }

  public function detail($slug)
  {
    $product = \App\Models\Shop\Product::with(['brand'])->where('slug', $slug)->firstOrFail();
    $images = $product->media()->get();

    //Related products
    $relatedProducts = \App\Models\Shop\Product::where('shop_brand_id', $product->shop_brand_id)->where('id', '!=', $product->id)->limit(4)->get();
    return Inertia::render('Product/Detail', compact('product', 'images', 'relatedProducts'));
  }
}
