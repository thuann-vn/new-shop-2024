<?php

namespace App\Settings;

use App\Settings\SettingCasts\ArrayCast;
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
  public array $shipping_methods;
  public array $payment_methods;

  public static function group(): string
  {
    return 'shop';
  }

  public static function casts(): array
  {
    // Array casts
    return [
        'shipping_methods' => ArrayCast::class,
        'payment_methods' => ArrayCast::class,
    ];
  }
}
