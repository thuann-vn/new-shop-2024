<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('shop_collection_product', function (Blueprint $table) {
            $table->integer('shop_collection_id')->unsigned();
            $table->integer('shop_product_id')->unsigned();
            $table->primary(['shop_collection_id', 'shop_product_id']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shop_collection_product');
    }
};
