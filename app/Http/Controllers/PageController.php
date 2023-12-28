<?php

namespace App\Http\Controllers;

use App\Models\Page;
use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\SEOTools;
use Illuminate\Http\Response;
use Inertia\Inertia;

class PageController extends Controller
{
    public function show(Page $page)
    {
        if (! $page->isPublished()) {
            return abort(Response::HTTP_NOT_FOUND);
        }

        SEOTools::setTitle($page->getSEOTitle());
        SEOTools::setDescription($page->getSEODescription());
        SEOTools::jsonLd()->addImage($page->getSEOImageUrl());
        SEOTools::opengraph()->addImage($page->getSEOImageUrl());
        SEOMeta::setKeywords($page->seo_keywords);

        $pageTitle = $page->title;
        $content = view('pages.index', [
            'page' => $page,
        ])->render();
      return Inertia::render('Page/Show', compact('content', 'pageTitle'));
    }
}
