<?php

namespace App\Services;

use App\Settings\ShopSettings;

class ShippingFeeService
{
    protected ShopSettings $shopSettings;

    public function __construct(ShopSettings $shopSettings)
    {
        $this->shopSettings = $shopSettings;
    }

    public function calculateShippingFee($shippingMethod)
    {
        //Get shipping fee from settings
        $defaultShippingFee = $this->shopSettings->shop_default_shipping_fee;

        //Get by shipping method
        $shippingMethods = array_values(array_filter($this->shopSettings->shipping_methods, function ($method) use ($shippingMethod) {
            return $method['enabled'] && $method['code'] == $shippingMethod;
        }));

        return $shippingMethods[0]['price'] ?? $defaultShippingFee;
    }
}
