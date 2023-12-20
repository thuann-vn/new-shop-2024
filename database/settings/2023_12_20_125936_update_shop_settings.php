<?php

use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration
{
    public function up(): void
    {
        $this->migrator->add('shop.shop_tax', 0);
        $this->migrator->add('shop.shop_default_shipping_fee', 0);
        $this->migrator->add('shop.shop_currency', 'USD');
        $this->migrator->add('shop.shop_currency_symbol', '$');
        $this->migrator->add('shop.shop_currency_symbol_position', 'left');
        $this->migrator->add('shop.shop_currency_thousand_separator', ',');
        $this->migrator->add('shop.shop_currency_decimal_separator', '.');
        $this->migrator->add('shop.shop_currency_decimal_number', 2);
    }
};
