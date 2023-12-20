<?php

use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration
{
    public function up(): void
    {
        $this->migrator->add('general.site_logo', '');
        $this->migrator->add('general.site_favicon', '');
        $this->migrator->add('general.site_description', '');
        $this->migrator->add('general.site_keywords', '');
        $this->migrator->add('general.site_author', '');
        $this->migrator->add('general.site_phone', '');
        $this->migrator->add('general.site_email', '');
        $this->migrator->add('general.site_address', '');
        $this->migrator->add('general.site_facebook', '');
        $this->migrator->add('general.site_twitter', '');
        $this->migrator->add('general.site_instagram', '');
        $this->migrator->add('general.site_youtube', '');
        $this->migrator->add('general.site_linkedin', '');
        $this->migrator->add('general.site_google', '');
    }
};
