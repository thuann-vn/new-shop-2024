<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;

class WishList extends Model
{

    protected $table = 'shop_wishlist';

    protected $fillable = ['shop_product_id', 'user_id'];

    public function product(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(Product::class, 'shop_product_id');
    }
}
