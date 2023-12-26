<?php

use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration
{
    public function up(): void
    {
        $this->migrator->add('shop.shipping_methods', [
            [
                'name' => 'Standard',
                'description' => 'Standard shipping',
                'price' => 0,
                'enabled' => true,
            ],
            [
                'name' => 'Express',
                'description' => 'Express shipping',
                'price' => 10,
                'enabled' => true,
            ],
        ]);
    }
};
