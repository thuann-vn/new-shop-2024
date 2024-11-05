<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

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

    public function product(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Product::class, 'shop_product_id');
    }

    public function attributeOptions(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(ProductVariantAttributeOption::class, 'shop_product_variant_id');
    }
    public function getFeaturedImageUrlAttribute(): string
    {
        return $this->getFirstMediaUrl('product-variant-images', 'preview');
    }

    public function registerMediaConversions(?Media $media = null): void
    {
        $this
            ->addMediaConversion('preview')
            ->fit(Manipulations::FIT_CROP, 300, 300)
            ->format(Manipulations::FORMAT_WEBP)
            ->nonQueued();
    }
}
