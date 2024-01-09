<?php

namespace App\Models\Shop;

use App\Models\Slider;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Collection extends Model
{
    public $table = 'shop_collections';

    /**
     * @var array<string, string>
     */
    protected $casts = [
        'is_visible' => 'boolean',
    ];

    protected $appends = [
        'home_products',
    ];

    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'shop_collection_product', 'shop_collection_id', 'shop_product_id');
    }

    public function getHomeProductsAttribute($limit = 10)
    {
        return $this->products->take($limit);
    }

    public function slider()
    {
        return $this->belongsTo(Slider::class);
    }
}
