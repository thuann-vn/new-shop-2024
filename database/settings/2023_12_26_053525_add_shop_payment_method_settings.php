<?php

use Spatie\LaravelSettings\Migrations\SettingsMigration;

return new class extends SettingsMigration {
  public function up(): void
  {
    $this->migrator->add('shop.payment_methods', [
        [
            'code' => 'cod', // 'cod' stands for 'cash on delivery'
            'name' => 'Cash on delivery',
            'description' => 'Pay with cash upon delivery.',
            'price' => 0,
            'enabled' => true,
        ],
        [
            'code' => 'paypal',
            'name' => 'Paypal',
            'description' => 'Paypal payment',
            'price' => 0,
            'enabled' => true,
        ],
        [
            'code' => 'credit_card',
            'name' => 'Credit Card',
            'description' => 'Credit Card payment',
            'price' => 0,
            'enabled' => true,
        ],
    ]);
  }
};
