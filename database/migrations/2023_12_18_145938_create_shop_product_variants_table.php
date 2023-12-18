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
        Schema::create('shop_attributes', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->boolean('is_filterable')->default(false);
            $table->timestamps();
        });

        Schema::create('shop_attribute_options', function (Blueprint $table) {
            $table->id();
            $table->foreignId('shop_attribute_id')->constrained();
            $table->string('value');
            $table->timestamps();
        });

        Schema::create('shop_product_attributes', function (Blueprint $table) {
            $table->foreignId('shop_product_id')->constrained();
            $table->foreignId('shop_attribute_id')->constrained();
        });

        Schema::create('shop_product_variants', function (Blueprint $table) {
            $table->id();
            $table->foreignId('shop_product_id')->constrained();
            $table->decimal('price')->default(0);
            $table->integer('stock')->default(0);
            $table->string('sku')->nullable();
        });

        Schema::create('shop_product_variant_attribute_options', function (Blueprint $table) {
            $table->foreignId('shop_product_variant_id')->constrained();
            $table->foreignId('shop_attribute_id')->constrained();
            $table->foreignId('shop_attribute_option_id')->constrained();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shop_product_variant_attribute_options');
        Schema::dropIfExists('shop_product_variants');
        Schema::dropIfExists('shop_product_attributes');
        Schema::dropIfExists('shop_attribute_options');
        Schema::dropIfExists('shop_attributes');
    }
};
