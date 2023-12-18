<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class ProductVariantAttributeOption extends Model implements HasMedia
{
    use InteractsWithMedia;

    /**
     * @var string
     */
    protected $table = 'shop_product_variant_attribute_options';

    /**
     * @var array<string, string>
     */
    protected $casts = [
    ];
}
