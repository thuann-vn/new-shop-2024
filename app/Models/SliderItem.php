<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class SliderItem extends Model implements HasMedia
{
    use InteractsWithMedia;

    protected $appends = [
        'image_url',
    ];
    public function getImageUrlAttribute(): string
    {
        return $this->getFirstMediaUrl('slider-image', 'webp');
    }

    public function registerMediaConversions(?Media $media = null): void
    {
        $this
            ->addMediaConversion('webp')
            ->format(Manipulations::FORMAT_WEBP)
            ->nonQueued();
    }

}
