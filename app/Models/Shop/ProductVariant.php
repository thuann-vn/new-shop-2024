<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class ProductVariant extends Model implements HasMedia
{
    use InteractsWithMedia;

    /**
     * @var string
     */
    protected $table = 'shop_product_variants';
    public $timestamps = false;

    /**
     * @var array<string, string>
     */
    protected $casts = [
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'shop_product_id');
    }

    public function attributeOptions()
    {
        return $this->hasMany(ProductVariantAttributeOption::class, 'shop_product_variant_id');
    }
}
