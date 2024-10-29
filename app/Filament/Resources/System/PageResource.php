<?php

namespace App\Filament\Resources\System;

use App\Models\Page;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Form;
use Filament\Resources\Concerns\Translatable;
use Filament\Resources\Resource;
use Filament\Tables;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\CodeField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\ContentBlocksField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\Groups\SEOFields;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\IntroField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\SlugField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Form\Fields\TitleField;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Table\Actions\PublishAction;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Table\Actions\ViewAction;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Table\Columns\PublishedColumn;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Table\Columns\TitleColumn;
use Statikbe\FilamentFlexibleContentBlocks\Filament\Table\Filters\PublishedFilter;

class PageResource extends Resource
{
    use Translatable;

    protected static ?string $model = Page::class;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    protected static ?string $recordRouteKeyName = 'id';

    public static function getNavigationGroup(): string
    {
        return trans('Settings');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Tabs::make('Heading')
                    ->columnSpan(2)
                    ->tabs([
                        Tab::make('General')
                            ->schema([
                                TitleField::create(),
                                CodeField::create(),
                                SlugField::create(false),
                                IntroField::create(),
//                                AuthorField::create(),
                            ]),
                        Tab::make('Content')
                            ->schema([
                                ContentBlocksField::create()
                                    ->cloneable(true)
                                    ->collapsible(true)
                                    ->collapsed(true),
                            ]),
                        Tab::make('SEO')
                            ->schema([
                                \App\Forms\Components\SEOFields::create(1, true),
                            ]),
                    ]),

            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                TitleColumn::create(),
                PublishedColumn::create(),
            ])
            ->filters([
                PublishedFilter::create(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                PublishAction::make(),
                ViewAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => \App\Filament\Resources\System\PageResource\Pages\ListPages::route('/'),
            'create' => \App\Filament\Resources\System\PageResource\Pages\CreatePage::route('/create'),
            'edit' => \App\Filament\Resources\System\PageResource\Pages\EditPage::route('/{record:id}/edit'),
        ];
    }
}
