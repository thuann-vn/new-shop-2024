<?php

use App\Models\Language;
use App\Models\User;
use App\Settings\GeneralSettings;
use App\Settings\ShopSettings;
use Illuminate\Support\Facades\Cache;

function getAvailableLanguages(): array
{
    return Language::whereIsVisible(true)->orderBy('id')->get()->pluck('code')->toArray();
}

function getGeneralSettings($key)
{
    $generalSettings = app(GeneralSettings::class);
    $value = $generalSettings->$key;
    switch ($key) {
        case 'site_favicon':
        case 'site_logo':
            return $value ? asset('storage/' . $value) : null;
        default:
            return $value;
    }
}

function isTransferPayment($code): bool
{
    return ! in_array($code, ['momo', 'alepay', 'stripe']);
}
function isMobile()
{
    $agent = new Jenssegers\Agent\Agent();

    return $agent->isMobile();
}

function getAllGeneralSettings()
{
    $locale = app()->getLocale();
    $settingArr = Cache::remember('general_settings', 24 * 60 * 60, function () {
        $generalSettings = app(GeneralSettings::class);

        return $generalSettings->toArray();
    });
    $settingArr['site_logo'] = ! empty($settingArr['site_logo'][$locale]) ? asset('storage/' . $settingArr['site_logo'][$locale]) : null;
    $settingArr['site_favicon'] = ! empty($settingArr['site_favicon'][$locale]) ? asset('storage/' . $settingArr['site_favicon'][$locale]) : null;

    return $settingArr;
}

function getShopSettings($key = null)
{
    if ($key) {
        $key = 'shop_' . $key;

        return app(ShopSettings::class)->$key;
    }

    return Cache::remember('shop_settings', 24 * 60 * 60, function () {
        return app(ShopSettings::class)->toArray();
    });
}

function getCurrency()
{
    return getShopSettings('currency');
}

function t($key, $replace = [], $locale = null): \Illuminate\Foundation\Application | array | string | \Illuminate\Contracts\Translation\Translator | \Illuminate\Contracts\Foundation\Application | null
{
    return __($key, $replace, $locale);
}

function paymentMethodName($code)
{
    $paymentMethods = getShopSettings()['payment_methods'];
    $paymentMethods = array_combine(array_column($paymentMethods, 'code'), $paymentMethods);

    return $paymentMethods[$code]['name'];
}

function getVietNamBanks()
{
    return [
        'vcb' => 'Vietcombank',
        'tcb' => 'Techcombank',
        'bidv' => 'BIDV',
        'vtb' => 'Vietinbank',
        'acb' => 'ACB',
        'mb' => 'MB',
        'vpb' => 'VPBank',
        'agb' => 'Agribank',
        'shb' => 'SHB',
        'hdb' => 'HDBank',
        'nab' => 'NAB',
        'vib' => 'VIB',
        'seab' => 'SeABank',
        'bacab' => 'BacABank',
        'oceanb' => 'OceanBank',
        'pgb' => 'PGBank',
        'lvpb' => 'LienVietPostBank',
        'tpb' => 'TPBank',
        'abb' => 'ABBank',
        'ocb' => 'OCB',
        'bvb' => 'BaoVietBank',
    ];
}

function getBankName($code)
{
    $banks = getVietNamBanks();

    return $banks[$code] ?? '';
}

function getSuperAdmins()
{
    return User::role('super_admin')->get();
}

function getAllAdminEmails(): array
{
    $superAdmins = getSuperAdmins()->pluck('email')->toArray();

    return $superAdmins;
}

//return the first value in array that is not null
function firstNotEmpty(...$values)
{
    foreach ($values as $value) {
        if (! empty($value)) {
            return $value;
        }
    }

    return '';
}
