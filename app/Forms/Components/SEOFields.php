<?php
namespace App\Forms\Components;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Textarea;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\SEODescriptionField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\SEOImageField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\SEOKeywordsField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\SEOTitleField;

class SEOFields
{
    public static function create(int $columns = 1, bool $translatableImage = false): Grid
    {
        return Grid::make($columns)
            ->schema([
                SEOTitleField::create(),
                Textarea::make('seo_description')
                    ->label('SEO Description'),
                SEOKeywordsField::create(),
                SEOImageField::create($translatableImage),
            ]);
    }
}
