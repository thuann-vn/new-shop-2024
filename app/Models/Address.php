<?php

namespace App\Models;

use App\Models\Shop\Brand;
use App\Models\Shop\Customer;
use App\Models\Shop\Order;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;

    protected $table = 'addresses';

    public function getFullAddressAttribute(): string
    {
        return "{$this->address}, {$this->ward}, {$this->district}, {$this->province}";
    }

    public function customers(): \Illuminate\Database\Eloquent\Relations\MorphToMany
    {
        return $this->morphedByMany(Customer::class, 'addressable');
    }

    public function brands(): \Illuminate\Database\Eloquent\Relations\MorphToMany
    {
        return $this->morphedByMany(Brand::class, 'addressable');
    }

    public function orders(): \Illuminate\Database\Eloquent\Relations\MorphToMany
    {
        return $this->morphedByMany(Order::class, 'addressable');
    }
}
