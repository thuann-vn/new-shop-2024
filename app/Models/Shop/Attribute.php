<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Attribute extends Model
{

    /**
     * @var string
     */
    protected $table = 'shop_attributes';

    /**
     * @var array<string, string>
     */
    protected $casts = [
    ];
}
