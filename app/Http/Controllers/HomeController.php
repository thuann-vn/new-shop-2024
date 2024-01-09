<?php

namespace App\Http\Controllers;

use App\Models\Blog\Post;
use App\Models\Page;
use App\Models\Shop\Collection;
use Inertia\Inertia;

class HomeController extends Controller
{
    public function index()
    {
        $homeSlider = \App\Models\Slider::with('items')->where('code', 'home-slider')->first();
        $homeSaleSlider1 = \App\Models\Slider::with('items')->where('code', 'home-sale-1')->first();
        $homeSaleSlider2 = \App\Models\Slider::with('items')->where('code', 'home-sale-2')->first();
        $collections = Collection::whereIsVisible(true)->whereHas('products', function ($productsQuery){
            $productsQuery->where('is_visible', true);
        })->get();
        $homePosts = Post::with(['author', 'category', 'tags'])->where('published_at', '<=', date('Y-m-d'))->orderBy('created_at', 'desc')->take(3)->get();
        $featuredCategories = \App\Models\Shop\Category::whereIsVisible(true)->whereIsFeatured(true)->get();
        return Inertia::render('Home', compact('homeSlider', 'collections', 'homeSaleSlider1', 'homeSaleSlider2', 'homePosts', 'featuredCategories'));
    }
}
