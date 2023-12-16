<?php

namespace App\Filament\Loggers;

use App\Models\Product;
use App\Filament\Loggers\ProductResource;
use Illuminate\Contracts\Support\Htmlable;
use Noxo\FilamentActivityLog\Loggers\Logger;
use Noxo\FilamentActivityLog\ResourceLogger\Field;
use Noxo\FilamentActivityLog\ResourceLogger\RelationManager;
use Noxo\FilamentActivityLog\ResourceLogger\ResourceLogger;

class ProductLogger extends Logger
{
    public static ?string $model = \App\Models\Shop\Product::class;

    public static function getLabel(): string | Htmlable | null
    {
        return \App\Filament\Resources\Shop\ProductResource::getModelLabel();
    }

    public static function resource(ResourceLogger $logger): ResourceLogger
    {
        return $logger
            ->fields([
                Field::make('name')
                    ->label(__('Name')),

                Field::make('categories.name')
                    ->label(__('Categories'))
                    ->hasMany('categories')
                    ->badge(),

                Field::make('media')
                    ->label(__('Images'))
                    ->media(gallery: true),

                Field::make('price')
                    ->label(__('Price'))
                    ->money('EUR'),

                Field::make('active')
                    ->label(__('Visible'))
                    ->boolean(),
            ])
            ->relationManagers([
                //
            ]);
    }
}
