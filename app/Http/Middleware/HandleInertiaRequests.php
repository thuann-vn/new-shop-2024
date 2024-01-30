<?php

namespace App\Http\Middleware;

use App\Settings\GeneralSettings;
use App\Settings\ShopSettings;
use Illuminate\Http\Request;
use Inertia\Middleware;
use RyanChandler\FilamentNavigation\Models\Navigation;
use Tightenco\Ziggy\Ziggy;
use Gloudemans\Shoppingcart\Facades\Cart;
class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request): string|null
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @return array<string, mixed>
     */
    public function share(Request $request): array
    {
        $generalSettings = $this->getGeneralSettings();
        $shopSettings = $this->getShopSettings();

        //Main navigation
        $navigation = Navigation::whereHandle('main')->first();
        $navigation->items = array_values($navigation->items);

        //Category navigation
        $categoryNavigation = Navigation::whereHandle('category')->first();
        if(!empty($categoryNavigation)){
            $categoryNavigation->items = !empty($categoryNavigation->items) ? array_values($categoryNavigation->items) : [];
        }

        //Footer navigation
        $footerLinks = Navigation::whereHandle('footer-links')->first();
        if(!empty($footerLinks)){
            $footerLinks->items = array_values($footerLinks->items);
            $footerLinks = $footerLinks->toArray();
        }

        return [
            ...parent::share($request),
            'flash' => [
                'success' => fn () => $request->session()->get('success'),
                'error' => fn () => $request->session()->get('error'),
            ],
            'general_settings' => $generalSettings,
            'shop' => $shopSettings,
            'auth' => [
                'user' => $request->user(),
            ],
            'ziggy' => fn () => [
                ...(new Ziggy)->toArray(),
                'location' => $request->url(),
            ],
            'cart' => [
                'items' => fn() => Cart::content(),
                'total' => fn() => Cart::subtotalFloat(),
                'count' => fn() => Cart::count(),
            ],
            'navigation' => $navigation->toArray(),
            'category_navigation' => !empty($categoryNavigation) ? $categoryNavigation->toArray() : [],
            'footer_links' => $footerLinks,
            'wishlist' => fn() => $request->user() ? $request->user()->wishlist()->pluck('shop_product_id')->toArray() : [],
        ];
    }

    public function getGeneralSettings(){
        $generalSettings = app(GeneralSettings::class);
        $settingArr = $generalSettings->toArray();
        $settingArr['site_logo'] = !empty($generalSettings->site_logo) ? asset('storage/' . $generalSettings->site_logo) : null;
        $settingArr['site_favicon'] = !empty($generalSettings->site_favicon) ? asset('storage/' .$generalSettings->site_favicon) : null;
        return$settingArr ;
    }

    public function getShopSettings(){
        $shopSettings = app(ShopSettings::class);
        return $shopSettings->toArray();
    }
}
