<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    public function __construct($resource)
    {
        self::withoutWrapping();
        parent::__construct($resource);
    }

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
            'slug' => $this->slug,
            'description' => $this->description,
            'is_visible' => $this->is_visible,
            'featured' => $this->featured,
            'old_price' => $this->old_price,
            'seo_title' => $this->seo_title,
            'seo_description' => $this->seo_description,
            'sku' => $this->sku,
            'barcode' => $this->barcode,
            'featured_image_url' => $this->featured_image_url,
            'specifications' => $this->specifications,
            'has_variants' => $this->has_variants,
            'qty' => $this->qty,
        ];
    }
}
