<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Relations\Pivot;

class ProductAttribute extends Pivot
{
    /**
     * @var string
     */
    protected $table = 'shop_product_attributes';

    public $timestamps = false;
    protected $primaryKey = null;

    public $fillable = [
        'shop_product_id',
        'shop_attribute_id',
    ];

    /**
     * @var array<string, string>
     */
    protected $casts = [
    ];

    public function attribute()
    {
        return $this->belongsTo(Attribute::class, 'shop_attribute_id');
    }
}
