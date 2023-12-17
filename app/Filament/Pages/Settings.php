<?php

namespace App\Filament\Pages;

use App\Filament\Resources\Shop\ProductResource;
use App\Settings\GeneralSettings;
use AymanAlhattami\FilamentPageWithSidebar\FilamentPageSidebar;
use AymanAlhattami\FilamentPageWithSidebar\PageNavigationItem;
use AymanAlhattami\FilamentPageWithSidebar\Traits\HasPageSidebar;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Pages\SettingsPage;
use Wiebenieuwenhuis\FilamentCodeEditor\Components\CodeEditor;

class Settings extends SettingsPage
{
    use HasPageSidebar;
    protected static ?string $navigationIcon = 'heroicon-o-cog-6-tooth';

    protected static string $settings = GeneralSettings::class;

    public static function sidebar(): FilamentPageSidebar
    {
        return FilamentPageSidebar::make()
            ->setTitle('Application Settings')
            ->setDescription('general, admin, website, sms, payments, notifications, shipping')
            ->setNavigationItems([
                PageNavigationItem::make('General Settings')
                    ->translateLabel()
                    ->url(ProductResource::getUrl())
                    ->icon('heroicon-o-cog-6-tooth')
                    ->isActiveWhen(function () {
                        return request()->routeIs(ProductResource::getRouteBaseName());
                    })
                    ->visible(true),
                PageNavigationItem::make('Admin Panel Settings')
                    ->translateLabel()
                    ->url(ProductResource::getUrl())
                    ->icon('heroicon-o-cog-6-tooth')
                    ->isActiveWhen(function () {
                        return request()->routeIs(ProductResource::getRouteBaseName());
                    })
                    ->visible(true),
                PageNavigationItem::make('Web Settings')
                    ->translateLabel()
                    ->url(ProductResource::getUrl())
                    ->icon('heroicon-o-cog-6-tooth')
                    ->isActiveWhen(function () {
                        return request()->routeIs(ProductResource::getRouteBaseName());
                    })
                    ->visible(true),
                // ...
            ]);
    }


    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('copyright')
                    ->label('Copyright notice')
                    ->required(),
                CodeEditor::make('custom_css'),
                Forms\Components\Repeater::make('links')
                    ->schema([
                        Forms\Components\TextInput::make('label')->required(),
                        Forms\Components\TextInput::make('url')
                            ->url()
                            ->required(),
                    ]),
            ]);
    }
}
