<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class ProductAttribute extends Model implements HasMedia
{
    use InteractsWithMedia;

    /**
     * @var string
     */
    protected $table = 'shop_product_attributes';

    /**
     * @var array<string, string>
     */
    protected $casts = [
    ];
}
