<?php

namespace App\Http\Controllers;

use App\Models\Page;
use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\SEOTools;
use Illuminate\Http\Response;
use Inertia\Inertia;
use Statikbe\FilamentFlexibleContentBlocks\ContentBlocks\AbstractContentBlock;
use Statikbe\FilamentFlexibleContentBlocks\Models\Contracts\HasContentBlocks;

class PageController extends Controller
{
    public function homePage()
    {
        return $this->show(Page::whereCode('home')->first());
    }

    public function show(Page $page)
    {
        if (! $page->isPublished()) {
            return abort(Response::HTTP_NOT_FOUND);
        }

        $blocks = $this->createBlocks($page);
        $pageTitle = $page->title;

        SEOTools::setTitle($page->getSEOTitle() ?? getGeneralSettings('site_name'));
        SEOTools::setDescription($page->getSEODescription());
        SEOMeta::setTitle($page->getSEOTitle() ?? getGeneralSettings('site_name'));
        SEOMeta::setKeywords($page->seo_keywords);
        SEOTools::addImages($page->getSEOImageUrl());

        return Inertia::render('Page/Show', compact('page', 'blocks', 'pageTitle'));
    }

    /**
     * Transforms the JSON block data into content block components that can be rendered.
     *
     * @return array<AbstractContentBlock>
     */
    private function createBlocks(HasContentBlocks $page): array
    {
        $blockClasses = $page::registerContentBlocks();
        $blockClassIndex = collect($blockClasses)->mapWithKeys(fn ($item, $key) => [$item::getName() => $item]);
        $blocks = [];

        foreach ($page->content_blocks as $blockData) {
            if ($blockClassIndex->has($blockData['type'])) {
                $blockClass = $blockClassIndex->get($blockData['type']);
                $block = new $blockClass($page, $blockData['data']);
                $block->name = $block->getName();
                unset($block->record);
                $blocks[] = $block;
            }
        }

        return $blocks;
    }
}
