<?php

namespace App\Filament\Pages;

use Akaunting\Money\Currency;
use App\Settings\ShopSettings;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Pages\SettingsPage;

class ManageShop extends SettingsPage
{
    protected static ?string $navigationIcon = 'heroicon-o-building-storefront';

    protected static string $settings = ShopSettings::class;

    protected static ?int $navigationSort = 1;

    public function getSubheading(): string
    {
        return __('Manage your shop settings');
    }

    public function getTitle(): string
    {
        return __('Shop Settings');
    }

    public static function getNavigationGroup(): ?string
    {
        return __('Settings');
    }

    public static function getNavigationLabel(): string
    {
        return __('Shop Settings');
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Tabs::make('Tabs')->tabs([
                    Forms\Components\Tabs\Tab::make(__('Shop Settings'))
                        ->icon('heroicon-o-building-storefront')
                        ->schema([
                            Forms\Components\TextInput::make('shop_tax')
                                ->label(__('Tax rate (%)'))
                                ->required(),
                        ]),
                    Forms\Components\Tabs\Tab::make(__('Format'))
                        ->icon('heroicon-o-currency-dollar')
                        ->schema([
                            Forms\Components\Select::make('shop_currency')
                                ->options(function () {
                                    $options = [];
                                    foreach (Currency::getCurrencies() as $key => $currency) {
                                        $options[$key] = $currency['symbol'] . ' - ' . $currency['name'];
                                    }

                                    return $options;
                                })
                                ->live()
                                ->afterStateUpdated(function (Forms\Get $get, Forms\Set $set) {
                                    $currency = $get('shop_currency');
                                    $selectedCurrency = Currency::getCurrencies()[$currency] ?? null;
                                    if (! empty($selectedCurrency)) {
                                        $set('shop_currency_symbol', $selectedCurrency['symbol']);
                                        $set('shop_currency_symbol_position', $selectedCurrency['symbol_first'] ? 'left' : 'right');
                                        $set('shop_currency_thousand_separator', $selectedCurrency['thousands_separator']);
                                        $set('shop_currency_decimal_separator', $selectedCurrency['decimal_mark']);
                                        $set('shop_currency_decimal_number', $selectedCurrency['precision']);
                                    }
                                })
                                ->searchable()
                                ->default('USD')
                                ->label(__('Currency'))
                                ->required(),
                            Forms\Components\TextInput::make('shop_currency_symbol')
                                ->label(__('Currency symbol'))
                                ->required(),
                            Forms\Components\Select::make('shop_currency_symbol_position')
                                ->options([
                                    'left' => __('Left'),
                                    'right' => __('Right'),
                                ])
                                ->label(__('Currency symbol position'))
                                ->required(),
                            Forms\Components\TextInput::make('shop_currency_thousand_separator')
                                ->label(__('Currency thousand separator'))
                                ->required(),
                            Forms\Components\TextInput::make('shop_currency_decimal_separator')
                                ->label(__('Currency decimal separator'))
                                ->required(),
                            Forms\Components\TextInput::make('shop_currency_decimal_number')
                                ->label(__('Currency decimal number'))
                                ->required(),
                        ]),
                    Forms\Components\Tabs\Tab::make(__('Shipping Methods'))
                        ->icon('heroicon-o-truck')
                        ->schema([
                            Forms\Components\Repeater::make('shipping_methods')
                                ->label(__('Shipping methods'))
                                ->hiddenLabel(true)
                                ->addActionLabel(__('Add shipping method'))
                                ->schema([
                                    Forms\Components\TextInput::make('code')
                                        ->label(__('Code'))
                                        ->required(),
                                    Forms\Components\TextInput::make('name')
                                        ->label(__('Name'))
                                        ->required(),
                                    Forms\Components\TextInput::make('price')
                                        ->label(__('Price'))
                                        ->currencyMask(thousandSeparator: ',', decimalSeparator: '.', precision: 2)
                                        ->numeric()
                                        ->required(),
                                    Forms\Components\TextInput::make('description')
                                        ->label(__('Description'))
                                        ->required(),
                                    Forms\Components\Toggle::make('enabled')
                                        ->label(__('Enabled'))
                                        ->required(),
                                ]),
                        ]),
                    Forms\Components\Tabs\Tab::make(__('Payment Methods'))
                        ->icon('heroicon-o-credit-card')
                        ->schema([
                            Forms\Components\Repeater::make('payment_methods')
                                ->label(__('Payment methods'))
                                ->hiddenLabel(true)
                                ->addActionLabel(__('Add payment method'))
                                ->schema([
                                    Forms\Components\FileUpload::make('image')
                                        ->label(__('Image'))
                                        ->previewable()
                                        ->image()
                                        ->imageEditor()
                                        ->avatar()
                                        ->imageEditorAspectRatios([
                                            '1:1',
                                        ])
                                        ->preserveFilenames(),
                                    Forms\Components\TextInput::make('code')
                                        ->label(__('Code'))
                                        ->required(),
                                    Forms\Components\TextInput::make('name')
                                        ->label(__('Name'))
                                        ->required(),
                                    Forms\Components\TextInput::make('description')
                                        ->label(__('Description'))
                                        ->required(),
                                    Forms\Components\Toggle::make('enabled')
                                        ->label(__('Enabled'))
                                        ->required(),
                                ]),
                        ]),
                ]),
            ])->columns(1);
    }
}
