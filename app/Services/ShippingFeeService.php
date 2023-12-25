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
    public function calculateShippingFee(Address $address, $cartContents)
    {
        //Get shipping fee from settings
        $shippingFee = $this->shopSettings->shop_default_shipping_fee;

        //Check if shipping fee by suburb
        $shippingFeeSetting = ShippingFeeSetting::where('ssc_code', $address->state)->first();
        if (!empty($shippingFeeSetting)) {
            return $shippingFeeSetting->amount;
        }

        //Get by state code
        $shippingFeeSetting = ShippingFeeSetting::where('state_code', $address->city)->first();
        if (!empty($shippingFeeSetting)) {
            return $shippingFeeSetting->amount;
        }
        return $shippingFee;
    }
}
