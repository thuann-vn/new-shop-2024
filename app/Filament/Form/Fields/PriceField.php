<?php

namespace App\Filament\Form\Fields;

use App\Models\District;
use App\Models\Province;
use App\Models\Ward;
use Filament\Forms;
use Illuminate\Database\Eloquent\Model;

class PriceField extends Forms\Components\TextInput
{
    protected function setUp(): void
    {
        parent::setUp();

        $this->currencyMask(
            thousandSeparator: getShopSettings('currency_thousand_separator'),
            decimalSeparator: getShopSettings('currency_decimal_separator'),
            precision: getShopSettings('currency_decimal_number'),
        );

        $this->prefix(getShopSettings('currency_symbol'));
        $this->numeric();
    }
}
