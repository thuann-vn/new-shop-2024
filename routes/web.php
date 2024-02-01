<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\HomeController;
use \App\Http\Controllers\CartController;
use \App\Http\Controllers\ProductController;
use \App\Http\Controllers\CheckoutController;
use \App\Http\Controllers\BlogController;
use \App\Http\Controllers\PageController;
use \App\Http\Controllers\ContactController;
use \App\Http\Controllers\NewsLetterController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::middleware('auth')->prefix('account')->group(function () {
    Route::get('/dashboard', function () {
        return Inertia::render('Account/Dashboard');
    })->middleware(['auth', 'verified'])->name('dashboard');

    Route::get('/orders', [ProfileController::class, 'orders'])->name('profile.orders');
    Route::get('/orders/{id}', [ProfileController::class, 'orderDetail'])->name('profile.order-detail');

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    //Add wishlist
    Route::get('/wishlist', [ProfileController::class, 'wishlist'])->name('profile.wishlist');
    Route::post('/add-wishlist', [ProfileController::class, 'addWishlist'])->name('profile.add-wishlist');
    Route::delete('/remove-wishlist', [ProfileController::class, 'removeWishlist'])->name('profile.remove-wishlist');
});

Route::group(['prefix' => 'shop'], function () {
    Route::get('/product/available-variants', [ProductController::class, 'getAvailableProductVariants'])->name('products.available-variants');
    Route::get('/search', [ProductController::class, 'search'])->name('products.search');

    Route::get('/', [ProductController::class, 'index'])->name('shop.index');
    Route::get('/{slug}', [ProductController::class, 'index'])->name('shop.category');
    Route::get('/collection/{slug}', [ProductController::class, 'index'])->name('shop.collection');
    Route::get('/product/{slug}', [ProductController::class, 'detail'])->name('products.detail');
});

Route::group(['prefix' => 'cart'], function () {
    Route::post('/add-to-cart', [CartController::class, 'addToCart'])->name('cart.add-to-cart');
    Route::delete('/remove-from-cart', [CartController::class, 'removeFromCart'])->name('cart.remove-from-cart');
    Route::put('/update-cart-item', [CartController::class, 'updateCart'])->name('cart.update-cart-item');
});

Route::group(['prefix' => 'checkout'], function () {
    Route::get('/', [CheckoutController::class, 'index'])->name('checkout');
    Route::post('/place-order', [CheckoutController::class, 'placeOrder'])->name('checkout.place-order');
    Route::get('/summary', [CheckoutController::class, 'orderSummary'])->name('checkout.order-summary');
});


Route::group(['prefix' => 'blog'], function () {
    Route::get('/', [BlogController::class, 'index'])->name('blog');
    Route::get('/category/{category}', [BlogController::class, 'index'])->name('blog.category');
    Route::get('/tag/{tag}', [BlogController::class, 'index'])->name('blog.tag');
    Route::get('/{slug}', [BlogController::class, 'show'])->name('blog.detail');
});

Route::group(['prefix' => 'contact'], function () {
    Route::post('/', [ContactController::class, 'submitContact'])->name('contact.submit');
});

Route::group(['prefix' => 'newsletter'], function () {
    Route::post('/', [NewsLetterController::class, 'subscribe'])->name('newsletter.subscribe');
});

// PAGES
Route::get('/', [PageController::class, 'homePage'])->name('home');
Route::get('/{page}', [PageController::class, 'show'])->name('page.detail');

// AUTH PAGES
require __DIR__ . '/auth.php';
