<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\HomeController;
use \App\Http\Controllers\CartController;
use \App\Http\Controllers\ProductController;
use Illuminate\Foundation\Application;
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
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/dashboard', function () {
    return Inertia::render('Account/Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::group(['prefix' => 'products'], function () {
    Route::get('/', function () {
        return Inertia::render('Product/Category');
    })->name('category');

    Route::get('/{slug}', [ProductController::class, 'detail'])->name('products.detail');
});

Route::group(['prefix' => 'cart'], function () {
    Route::post('/add-to-cart', [CartController::class, 'addToCart'])->name('cart.add-to-cart');
    Route::delete('/remove-from-cart', [CartController::class, 'removeFromCart'])->name('cart.remove-from-cart');
});

Route::get('/cart', function () {
    return Inertia::render('Cart');
})->name('cart');

Route::get('/checkout', function () {
    return Inertia::render('Checkout');
})->name('checkout');

require __DIR__.'/auth.php';
