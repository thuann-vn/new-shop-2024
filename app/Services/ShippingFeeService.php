<?php

namespace App\Services;

use App\Models\Address;
use App\Models\Postcode;
use App\Models\Setting;
use App\Models\ShippingFeeSetting;
use App\Models\UserAddress;
use App\Settings\GeneralSettings;
use App\Settings\ShopSettings;
use Illuminate\Support\Facades\Log;

class ShippingFeeService
{
    protected ShopSettings $shopSettings;
    public function __construct(ShopSettings $shopSettings)
    {
        $this->shopSettings = $shopSettings;
    }
    public function calculateShippingFee($provinceCode, $districtCode, $shippingMethod)
    {
        //Get shipping fee from settings
        $defaultShippingFee = $this->shopSettings->shop_default_shipping_fee;

        //Get by shipping method
        $shippingMethods = array_filter($this->shopSettings->shipping_methods, function ($method) {
          return $method['enabled'];
        });
        $shippingMethod = array_filter($shippingMethods, function ($method) use ($shippingMethod) {
          return $method['code'] == $shippingMethod;
        });

        return $shippingMethod['price'] ?? $defaultShippingFee;
    }
}
