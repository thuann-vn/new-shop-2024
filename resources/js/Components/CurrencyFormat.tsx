import * as React from "react";
import CurrencyFormat from 'react-currency-format';
import {usePage} from "@inertiajs/react";
export default function CustomCurrencyFormat({value} : {value: number}) {
    const {shop} = usePage().props;
    return (
        <CurrencyFormat
            value={value}
            displayType={"text"}
            thousandSeparator={shop.shop_currency_thousand_separator}
            decimalSeparator={shop.shop_currency_decimal_separator}
            prefix={shop.shop_currency_symbol_position == 'left' ? shop.shop_currency_symbol : ''}
            suffix={shop.shop_currency_symbol_position == 'right' ? shop.shop_currency_symbol : ''}
            decimalScale={shop.shop_currency_decimal_digits}
        />
    )
}
