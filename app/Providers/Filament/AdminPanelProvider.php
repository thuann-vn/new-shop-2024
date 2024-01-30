<?php

namespace App\Providers\Filament;

use App\Filament\Pages\Auth\Login;
use App\Filament\Pages\Dashboard;
use App\Filament\Resources\Blog\PostResource;
use App\Filament\Resources\Shop\ProductResource;
use App\Http\Middleware\Authenticate;
use App\Models\Page;
use App\Models\Shop\Category;
use App\Models\Shop\Collection;
use Awcodes\FilamentQuickCreate\QuickCreatePlugin;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\SpatieLaravelTranslatablePlugin;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\AuthenticateSession;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Phpsa\FilamentAuthentication\FilamentAuthentication;
use Phpsa\FilamentAuthentication\Widgets\LatestUsersWidget;
use RyanChandler\FilamentNavigation\Filament\Resources\NavigationResource;
use RyanChandler\FilamentNavigation\FilamentNavigation;
use Tapp\FilamentAuthenticationLog\FilamentAuthenticationLogPlugin;

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('admin')
            ->login(Login::class)
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->pages([
                Dashboard::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([
                Widgets\AccountWidget::class,
                //                Widgets\FilamentInfoWidget::class,
                //                LatestUsersWidget::make(['limit' => 5, 'paginate' => true])
            ])
            ->navigationGroups([
                'Shop',
                'Blog',
                'Settings',
            ])
            ->databaseNotifications()
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ])->plugins([
                FilamentAuthenticationLogPlugin::make(),
                \Statikbe\FilamentTranslationManager\FilamentChainedTranslationManagerPlugin::make(),
                SpatieLaravelTranslatablePlugin::make()->defaultLocales(['en', 'vi']),
                new \RickDBCN\FilamentEmail\FilamentEmail(),
                QuickCreatePlugin::make()->includes([
                    ProductResource::class,
                    PostResource::class,
                ]),
                \FilipFonal\FilamentLogManager\FilamentLogManager::make(),
                FilamentNavigation::make()->withExtraFields([
                    TextInput::make('classes'),
                    FileUpload::make('icon')->image()->imageEditor()->avatar(),
                ])->itemType('Internal Link', [
                    TextInput::make('url')->placeholder('/slug')->required(),
                ])->itemType('Page', [
                    Select::make('url')
                        ->options(function () {
                            $allPages = Page::orderBy('title')->get();
                            $options = [];
                            foreach ($allPages as $page) {
                                $options[$page->getViewUrl()] = $page->title;
                            }

                            return $options;
                        })
                        ->required(),
                ])->itemType('Category', [
                    Select::make('url')
                        ->options(function () {
                            $categories = Category::orderBy('name')->get();
                            $options = [];
                            foreach ($categories as $category) {
                                $options[$category->getViewUrl()] = $category->name;
                            }

                            return $options;
                        })
                        ->required(),
                ])->itemType('Collection', [
                    Select::make('url')
                        ->options(function () {
                            $collections = Collection::orderBy('name')->get();
                            $options = [];
                            foreach ($collections as $collection) {
                                $options[$collection->getViewUrl()] = $collection->name;
                            }

                            return $options;
                        })
                        ->required(),
                ])->itemType('Route', [
                    Select::make('url')
                        ->options(function () {
                            $routes = collect(app('router')
                                ->getRoutes()
                                ->getRoutesByName())
                                ->reject(function ($route) {
                                    $routeName = $route->getName();
                                    $method = @$route->methods()[0];

                                    return
                                        $method != 'GET'
                                        || (\Str::is('debugbar.*', $routeName)
                                            || \Str::is('filament.*', $routeName)
                                            || \Str::is('sanctum.*', $routeName)
                                            || \Str::is('livewire.*', $routeName)
                                            || \Str::is('filament-authentication.*', $routeName)
                                            || \Str::is('ignition.*', $routeName));
                                })
                                ->mapWithKeys(function ($route, $name) {
                                    return [$name => $name];
                                })->toArray();

                            return $routes;
                        })
                        ->required(),
                ]),
            ])->resources(
                FilamentAuthentication::resources()
            );
    }
}

NavigationResource::navigationGroup('Settings');
NavigationResource::navigationIcon('heroicon-o-queue-list');
NavigationResource::navigationSort(3);
