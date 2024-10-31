<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class Attribute extends Model
{
    use HasTranslations;

    /**
     * @var string
     */
    protected $table = 'shop_attributes';

    /**
     * @var array<string, string>
     */
    protected $casts = [
    ];

    protected $guarded  = [];

    public $translatable = [
        'name'
    ];
}
