<?php

namespace App\Models\Shop;

use App\Models\Slider;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Spatie\Translatable\HasTranslations;

class Collection extends Model
{
    use HasTranslations;

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

    public $translatable = [
        'name',
        'slug',
        'description',
    ];

    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'shop_collection_product', 'shop_collection_id', 'shop_product_id');
    }

    public function getHomeProductsAttribute($limit = 10)
    {
        return $this->products->take($limit);
    }

    public function slider(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Slider::class);
    }

    public function getViewUrl(): string
    {
        return route('shop.collection', ['slug' => $this->slug], false);
    }
}
