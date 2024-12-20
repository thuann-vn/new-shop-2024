<?php

namespace App\Http\Middleware;

use App\Models\Navigation;
use App\Settings\GeneralSettings;
use App\Settings\ShopSettings;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Inertia\Middleware;
use Tightenco\Ziggy\Ziggy;

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
    public function version(Request $request): ?string
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
                'items' => fn () => Cart::content(),
                'total' => fn () => Cart::subtotalFloat(),
                'count' => fn () => Cart::count(),
            ],
            'navigation' => $this->getNavigationItems('main'),
            'category_navigation' => $this->getNavigationItems('category'),
            'footer_links' => $this->getNavigationItems('footer-links'),
            'locale' => app()->getLocale(),
            'wishlist' => fn () => $request->user() ? $request->user()->wishlist()->pluck('shop_product_id')->toArray() : [],
        ];
    }

    private function getNavigationItems($name)
    {
        $navigation = Navigation::whereHandle($name)->first();
        if (! empty($navigation)) {
            return $navigation->translate('items', app()->getLocale());
        }
        return [];
    }

    public function getGeneralSettings()
    {
        $generalSettings = app(GeneralSettings::class);
        $settingArr = $generalSettings->toArray();
        $settingArr['site_logo'] = ! empty($generalSettings->site_logo) ? asset('storage/' . $generalSettings->site_logo) : null;
        $settingArr['site_favicon'] = ! empty($generalSettings->site_favicon) ? asset('storage/' . $generalSettings->site_favicon) : null;

        return $settingArr;
    }

    public function getShopSettings()
    {
        $shopSettings = app(ShopSettings::class);

        return $shopSettings->toArray();
    }
}
