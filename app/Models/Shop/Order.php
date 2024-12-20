<?php

namespace App\Models\Shop;

use App\Enums\OrderStatus;
use App\Models\Address;
use App\Settings\ShopSettings;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphOne;
use Illuminate\Database\Eloquent\Relations\MorphToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use HasFactory;
    use SoftDeletes;

    /**
     * @var string
     */
    protected $table = 'shop_orders';

    /**
     * @var array<int, string>
     */
    protected $fillable = [
        'number',
        'total_price',
        'status',
        'currency',
        'shipping_price',
        'shipping_method',
        'notes',
        'subtotal'
    ];

    protected $casts = [
        'status' => OrderStatus::class,
    ];

    protected $appends = ['shipping_method_detail', 'payment_method_detail'];

    public function address(): MorphToMany
    {
      return $this->morphToMany(Address::class, 'addressable', 'addressables');
    }

    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class, 'shop_customer_id');
    }

    public function items(): HasMany
    {
        return $this->hasMany(OrderItem::class, 'shop_order_id');
    }

    public function payments(): HasMany
    {
        return $this->hasMany(Payment::class);
    }

    public function getShippingMethodDetailAttribute(){
      $shippingMethod = $this->shipping_method;
      $shippingMethods = app(ShopSettings::class)->shipping_methods;
      foreach($shippingMethods as $method){
        if(@$method['code'] == $shippingMethod){
          return $method;
        }
      }
      return null;
    }

    public function getPaymentMethodDetailAttribute(){
      $paymentMethod = $this->payment_method;
      $paymentMethods = app(ShopSettings::class)->payment_methods;
      foreach($paymentMethods as $method){
        if(@$method['code'] == $paymentMethod){
          return $method;
        }
      }
      return null;
    }
}
