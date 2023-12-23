<?php

namespace App\Http\Controllers;

use App\Models\Page;
use App\Models\Shop\Collection;
use App\Settings\GeneralSettings;
use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\SEOTools;
use Inertia\Inertia;
use Illuminate\Support\Facades\Route;

class HomeController extends Controller
{
    public function index(Page $page)
    {
        $generalSettings = app(GeneralSettings::class);
        SEOTools::setTitle($generalSettings->site_name);
        SEOTools::setDescription($generalSettings->site_description);
        //TODO: SEO Image
//        SEOTools::jsonLd()->addImage($page->getSEOImageUrl());
//        SEOTools::opengraph()->addImage($page->getSEOImageUrl());
        SEOMeta::setKeywords($generalSettings->site_keywords);

        $homeSlider = \App\Models\Slider::with('items')->where('code', 'home-slider')->first()->toArray();
        $collections = Collection::whereIsVisible(true)->get()->toArray();
        return Inertia::render('Home', compact('homeSlider', 'collections'));
    }
}
