<?php

namespace App\Settings;

use Spatie\LaravelSettings\Settings;

class ShopSettings extends Settings
{
    public float $shop_tax;
    public float $shop_default_shipping_fee;
    public string $shop_currency;
    public string $shop_currency_symbol;
    public string $shop_currency_symbol_position;
    public string $shop_currency_thousand_separator;
    public string $shop_currency_decimal_separator;
    public int $shop_currency_decimal_number;


    public static function group(): string
    {
        return 'shop';
    }
}
