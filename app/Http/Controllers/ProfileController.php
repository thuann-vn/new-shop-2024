<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use App\Models\Shop\Order;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Inertia\Response;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): Response
    {
        return Inertia::render('Account/Profile/Edit', [
            'mustVerifyEmail' => $request->user() instanceof MustVerifyEmail,
            'status' => session('status'),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validate([
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }

    public function orders(Request $request){
        $orders = Order::with(['items', 'items.product', 'address', 'customer'])->where('shop_customer_id', $request->user()->id)->orderBy('id', 'desc')->paginate(20);

        return Inertia::render('Account/Orders', [
            'orders' => $orders
        ]);
    }

    public function orderDetail(Request $request, $id){
        $order = Order::with(['items', 'items.product', 'address', 'customer'])->where('shop_customer_id', $request->user()->id)->where('id', $id)->first();
        if(!$order){
            return redirect()->route('profile.orders');
        }
        return Inertia::render('Account/OrderDetail', [
            'order' => $order
        ]);
    }
}
