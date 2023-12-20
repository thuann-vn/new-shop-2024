<?php

namespace App\Settings;

use Spatie\LaravelSettings\Settings;

class GeneralSettings extends Settings
{
    public string $site_name;

    public bool $site_active;
    public ?string $site_logo;
    public ?string $site_favicon;
    public ?string $site_description;
    public ?string $site_keywords;
    public ?string $site_author;
    public ?string $site_phone;
    public ?string $site_email;
    public ?string $site_address;
    public ?string $site_facebook;
    public ?string $site_twitter;
    public ?string $site_instagram;
    public ?string $site_youtube;
    public ?string $site_linkedin;
    public ?string $site_google;

    public static function group(): string
    {
        return 'general';
    }
}
