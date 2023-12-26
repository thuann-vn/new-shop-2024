<?php

namespace App\Http\Controllers;

use App\Models\Shop\Category;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller
{
  public function index(Request $request)
  {
    $slug = $request->slug;
    $category = null;
    if(!empty($slug)){
      $category = Category::where('slug', $slug)->first();
    }
    $products = \App\Models\Shop\Product::with(['brand']);
    $allCategories = Category::whereIsVisible(true)->whereParentId(null)->get();

    if(!empty($category)){
      $products = $products->whereHas('categories', function ($query) use ($category){
        $query->where('shop_category_id', $category->id);
      });
    }

    //Get all ids
    $productIds = $products->pluck('id')->toArray();

    //Collections
    $collections = \App\Models\Shop\Collection::whereIsVisible(true)->whereHas('products', function ($query) use ($productIds){
      $query->whereIn('shop_product_id', $productIds);
    })->get(['id', 'name']);

    //Brands
    $brandIds = $products->pluck('shop_brand_id')->toArray();
    $brands = \App\Models\Shop\Brand::whereIsVisible(true)->whereIn('id', $brandIds)->get(['id', 'name']);

    //Generate filters
    $filters = [];

    $selectedCollections = $request->get('collection', '');
    if(!empty($selectedCollections)){
      $selectedCollections = explode(',', $selectedCollections);
      $products = $products->whereHas('collections', function ($query) use ($selectedCollections){
        $query->whereIn('shop_collection_id', $selectedCollections);
      });
    }else{
      $selectedCollections = [];
    }
    $filters[] = [
        'id' => 'collection',
        'name' => 'Collections',
        'open' => count($selectedCollections) > 0, //This will make the filter open by default
        'options' => array_map(function ($collection) use ($selectedCollections) {
            return [
              'value' => $collection['id'],
              'label' => $collection['name'],
              'checked' => in_array($collection['id'], $selectedCollections)
            ];
        }, $collections->toArray()),
    ];

    $selectedBrands = $request->get('brand', '');
    if(!empty($selectedBrands)){
      $selectedBrands = explode(',', $selectedBrands);
      $products = $products->whereIn('shop_brand_id', $selectedBrands);
    }else{
      $selectedBrands = [];
    }
    $filters[] = [
        'id' => 'brand',
        'name' => 'Brands',
        'open' => count($selectedBrands) > 0, //This will make the filter open by default
        'options' => array_map(function ($brand) use ($selectedBrands) {
            return [
              'value' => $brand['id'],
              'label' => $brand['name'],
              'checked' => in_array($brand['id'], $selectedBrands)
            ];
        }, $brands->toArray()),
    ];

    $products = $products->paginate(1)->appends($request->all());
    return Inertia::render('Product/Category', compact('products', 'category', 'allCategories', 'collections', 'filters'));
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
