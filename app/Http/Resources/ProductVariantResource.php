<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductVariantResource extends JsonResource
{
    public function __construct($resource) { self::withoutWrapping(); parent::__construct($resource); }
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'price' => $this->price,
            'is_visible' => $this->is_visible,
            'old_price' => $this->old_price,
            'sku' => $this->sku,
            'media' => $this->getMedia('product-variant-images')->toArray(),
        ];
    }
}
