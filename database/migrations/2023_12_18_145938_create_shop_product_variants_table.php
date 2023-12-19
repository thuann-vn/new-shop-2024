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
        if(!Schema::hasTable('shop_attributes')) {
            Schema::create('shop_attributes', function (Blueprint $table) {
                $table->id();
                $table->string('name');
                $table->boolean('is_filterable')->default(false);
                $table->timestamps();
            });
        }

        if(!Schema::hasTable('shop_attribute_options')) {
            Schema::create('shop_attribute_options', function (Blueprint $table) {
                $table->id();
                $table->integer('shop_attribute_id');
                $table->string('value');
                $table->timestamps();
            });
        }


        if(!Schema::hasTable('shop_product_attributes')) {
            Schema::create('shop_product_attributes', function (Blueprint $table) {
                $table->integer('shop_product_id');
                $table->integer('shop_attribute_id');
            });
        }


        if(!Schema::hasTable('shop_product_variants')) {
            Schema::create('shop_product_variants', function (Blueprint $table) {
                $table->id();
                $table->text('name');
                $table->integer('shop_product_id');
                $table->string('code');
                $table->decimal('price')->default(0);
                $table->integer('qty')->default(0);
                $table->string('sku')->nullable();
                $table->string('barcode')->nullable();
                $table->timestamps();
            });

        }


        if(!Schema::hasTable('shop_product_variant_attribute_options')) {
            Schema::create('shop_product_variant_attribute_options', function (Blueprint $table) {
                $table->integer('shop_product_variant_id');
                $table->integer('shop_attribute_id');
                $table->integer('shop_attribute_option_id');
            });
        }
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
