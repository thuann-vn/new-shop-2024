<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderResource extends JsonResource
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
            'number' => $this->number,
            'status' => $this->status,
            'total_price' => $this->total_price,
            'subtotal' => $this->subtotal,
            'tax' => $this->tax,
            'discount' => $this->discount,
            'currency' => $this->currency,
            'shipping_price' => $this->shipping_price,
            'shipping_method' => $this->shipping_method,
            'payment_method' => $this->payment_method,
            'payment_status' => $this->payment_status,
            'payment_method_detail' => $this->payment_method_detail,
            'shipping_method_detail' => $this->shipping_method_detail,
            'notes' => $this->notes,
            'address' => $this->address,
            'items' => OrderItemResource::collection($this->items),
        ];
    }
}
