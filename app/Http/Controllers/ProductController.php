<?php

namespace App\Http\Controllers;

use App\Models\Shop\Category;
use App\Models\Shop\ProductVariant;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductController extends Controller
{
  public function index(Request $request)
  {
    $slug = $request->slug;
    $category = null;
    if (!empty($slug)) {
      $category = Category::where('slug', $slug)->first();
    }
    $products = \App\Models\Shop\Product::with(['brand']);
    $allCategories = Category::whereIsVisible(true)->whereParentId(null)->get();

    if (!empty($category)) {
      $products = $products->whereHas('categories', function ($query) use ($category) {
        $query->where('shop_category_id', $category->id);
      });
    }

    //Get all ids
    $productIds = $products->pluck('id')->toArray();

    //Collections
    $collections = \App\Models\Shop\Collection::whereIsVisible(true)->whereHas('products', function ($query) use ($productIds) {
      $query->whereIn('shop_product_id', $productIds);
    })->get(['id', 'name']);

    //Brands
    $brandIds = $products->pluck('shop_brand_id')->toArray();
    $brands = \App\Models\Shop\Brand::whereIsVisible(true)->whereIn('id', $brandIds)->get(['id', 'name']);

    //Generate filters
    $filters = [];

    $selectedCollections = $request->get('collection', '');
    if (!empty($selectedCollections)) {
      $selectedCollections = explode(',', $selectedCollections);
      $products = $products->whereHas('collections', function ($query) use ($selectedCollections) {
        $query->whereIn('shop_collection_id', $selectedCollections);
      });
    } else {
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
    if (!empty($selectedBrands)) {
      $selectedBrands = explode(',', $selectedBrands);
      $products = $products->whereIn('shop_brand_id', $selectedBrands);
    } else {
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

    //Sort
    $sort = $request->get('sort', 'newest');
    if (!empty($sort)) {
      switch ($sort) {
        case 'price_asc':
          $products = $products->orderBy('price', 'asc');
          break;
        case 'price_desc':
          $products = $products->orderBy('price', 'desc');
          break;
        case 'name_asc':
          $products = $products->orderBy('name', 'asc');
          break;
        case 'name_desc':
          $products = $products->orderBy('name', 'desc');
          break;
        default:
          $products = $products->orderBy('created_at', 'desc');
          break;
      }
    }

    $products = $products->paginate(12)->appends($request->all());
    return Inertia::render('Product/Category', compact('products', 'category', 'allCategories', 'collections', 'filters', 'sort'));
  }

  public function detail($slug)
  {
    $product = \App\Models\Shop\Product::with(['brand', 'productAttributes', 'variants', 'variants.attributeOptions'])->where('slug', $slug)->firstOrFail();
    $firstCategory = $product->categories()->first();
    $images = $product->media()->get();

    //Get product attributes
    $productAttributes = $product->productAttributes()->get();
    $productVariants = $product->variants()->get();
    $productOptions = [];
    foreach ($productVariants as $key => $productVariant) {
      foreach ($productVariant->attributeOptions as $attributeOption) {
        $productOptions[$attributeOption->shop_attribute_id][$attributeOption->shop_attribute_option_id] = [
            'name' => $attributeOption->option->value,
            'in_stock' => $productVariant->qty
        ];
      }
    }

    //Related products
    $relatedProducts = \App\Models\Shop\Product::where('shop_brand_id', $product->shop_brand_id)->where('id', '!=', $product->id)->limit(4)->get();
    return Inertia::render('Product/Detail', compact('product', 'images', 'relatedProducts', 'firstCategory', 'productAttributes', 'productVariants', 'productOptions'));
  }

  /**
   * Get available option when user select attribute option
   * Eg: User select color: red
   * Then we will get all available options for size attribute that have red color
   * @param Request $request
   * @return \Illuminate\Http\JsonResponse
   */
  public function getAvailableProductVariants(Request $request)
  {
    $productId = $request->product_id;
    $selectedOptions = array_map('intval', $request->selected_options);
    $attributeId = $request->attribute_id;
    $product = \App\Models\Shop\Product::with(['variants', 'variants.attributeOptions'])->whereId($productId)->firstOrFail();
    $productVariants = $product->variants()->get();
    $productOptions = [];
    foreach ($productVariants as $key => $productVariant) {
      $isAvailable = false;
      foreach ($productVariant->attributeOptions as $attributeOption) {
        if (in_array($attributeOption->shop_attribute_option_id, $selectedOptions)) {
          $isAvailable = true;
          break;
        }
      }
      if ($isAvailable) {
        foreach ($productVariant->attributeOptions as $attributeOption) {
          if ($attributeOption->shop_attribute_id != $attributeId) {
            $productOptions[$attributeOption->shop_attribute_id][$attributeOption->shop_attribute_option_id] = [
                'name' => $attributeOption->option->value,
                'in_stock' => $productVariant->qty
            ];
          }
        }
      }
    }

    //Get selected variant if all options are selected
    $selectedVariant = null;
    if(count($selectedOptions) == count($product->productAttributes)){
      foreach ($productVariants as $key => $productVariant) {
        $isAvailable = true;
        foreach ($productVariant->attributeOptions as $attributeOption) {
          if (!in_array($attributeOption->shop_attribute_option_id, $selectedOptions)) {
            $isAvailable = false;
            break;
          }
        }
        if ($isAvailable) {
          $selectedVariant = $productVariant;
          break;
        }
      }
    }

    return response()->json([
        'product_options' => $productOptions,
        'selected_variant' => $selectedVariant
    ]);
  }
}
