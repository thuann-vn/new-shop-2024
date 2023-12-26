<?php

namespace App\Filament\Pages;

use Akaunting\Money\Currency;
use App\Settings\ShopSettings;
use Filament\Forms\Form;
use Filament\Pages\SettingsPage;
use Illuminate\Support\Facades\Log;
use Wiebenieuwenhuis\FilamentCodeEditor\Components\CodeEditor;
use Filament\Forms;

class ManageShop extends SettingsPage
{
  protected static ?string $navigationIcon = 'heroicon-o-building-storefront';

  protected static string $settings = ShopSettings::class;
  protected static ?string $navigationGroup = 'Settings';
  protected static ?int $navigationSort = 1;

  public function form(Form $form): Form
  {
    return $form
        ->schema([
            Forms\Components\Tabs::make('Tabs')->tabs([
                Forms\Components\Tabs\Tab::make('Shop Settings')
                    ->icon('heroicon-o-building-storefront')
                    ->schema([
                      //Shop tax &
                        Forms\Components\TextInput::make('shop_tax')
                            ->label('Tax rate (%)')
                            ->required(),
                      //Shop default shipping fee
                        Forms\Components\TextInput::make('shop_default_shipping_fee')
                            ->label('Default shipping fee')
                            ->required(),
                    ]),
                Forms\Components\Tabs\Tab::make('Format')
                    ->icon('heroicon-o-currency-dollar')
                    ->schema([
                      //Shop currency
                        Forms\Components\Select::make('shop_currency')
                            ->options(function (){
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
                              if(!empty($selectedCurrency)){
                                $set('shop_currency_symbol', $selectedCurrency['symbol']);
                                $set('shop_currency_symbol_position', $selectedCurrency['symbol_first'] ? 'left' : 'right');
                                $set('shop_currency_thousand_separator', $selectedCurrency['thousands_separator']);
                                $set('shop_currency_decimal_separator', $selectedCurrency['decimal_mark']);
                                $set('shop_currency_decimal_number', $selectedCurrency['precision']);
                              }
                            })
                            ->searchable()
                            ->default('USD')
                            ->label('Currency')
                            ->required(),
                      //Shop currency symbol
                        Forms\Components\TextInput::make('shop_currency_symbol')
                            ->label('Currency symbol')
                            ->required(),
                      //Shop currency symbol position
                        Forms\Components\Select::make('shop_currency_symbol_position')
                            ->options([
                                'left' => 'Left',
                                'right' => 'Right',
                            ])
                            ->label('Currency symbol position')
                            ->required(),
                      //Shop currency thousand separator
                        Forms\Components\TextInput::make('shop_currency_thousand_separator')
                            ->label('Currency thousand separator')
                            ->required(),
                      //Shop currency decimal separator
                        Forms\Components\TextInput::make('shop_currency_decimal_separator')
                            ->label('Currency decimal separator')
                            ->required(),
                      //Shop currency decimal number
                        Forms\Components\TextInput::make('shop_currency_decimal_number')
                            ->label('Currency decimal number')
                            ->required(),
                    ]),
                Forms\Components\Tabs\Tab::make('Shipping Methods')
                    ->icon('heroicon-o-truck')
                    ->schema([
                      //Shipping method
                        Forms\Components\Repeater::make('shipping_methods')
                            ->label('Shipping methods')
                            ->hiddenLabel(true)
                            ->addActionLabel('Add shipping method')
                            ->schema([
                                Forms\Components\TextInput::make('code')
                                    ->label('Code')
                                    ->required(),
                                Forms\Components\TextInput::make('name')
                                    ->label('Name')
                                    ->required(),
                                Forms\Components\TextInput::make('price')
                                    ->label('Price')
                                    ->currencyMask(thousandSeparator: ',', decimalSeparator: '.', precision: 2)
                                    ->numeric()
                                    ->required(),
                                Forms\Components\TextInput::make('description')
                                    ->label('Description')
                                    ->required(),
                                Forms\Components\Toggle::make('enabled')
                                    ->label('Enabled')
                                    ->required(),
                            ]),
                    ]),
                Forms\Components\Tabs\Tab::make('Payment Methods')
                    ->icon('heroicon-o-credit-card')
                    ->schema([
                      //Payment method
                        Forms\Components\Repeater::make('payment_methods')
                            ->label('Payment methods')
                            ->hiddenLabel(true)
                            ->addActionLabel('Add payment method')
                            ->schema([
                                Forms\Components\FileUpload::make('image')
                                    ->label('Image')
                                    ->required()
                                    ->previewable()
                                    ->image()
                                    ->imageEditor()
                                    ->avatar()
                                    ->imageEditorAspectRatios([
                                        '1:1',
                                    ])
                                    ->preserveFilenames(),
                                Forms\Components\TextInput::make('code')
                                    ->label('Code')
                                    ->required(),
                                Forms\Components\TextInput::make('name')
                                    ->label('Name')
                                    ->required(),
                                Forms\Components\TextInput::make('description')
                                    ->label('Description')
                                    ->required(),
                                Forms\Components\Toggle::make('enabled')
                                    ->label('Enabled')
                                    ->required(),
                            ]),
                    ]),
            ])
        ])->columns(1);
  }
}
