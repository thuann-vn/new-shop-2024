<?php

namespace App\Providers;

use Artesaos\SEOTools\Facades\SEOMeta;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Model::unguard();

        if (app()->environment('production')) {
            URL::forceScheme('https');
        }

        SEOMeta::setTitleDefault(getGeneralSettings('site_name'));
    }
}
