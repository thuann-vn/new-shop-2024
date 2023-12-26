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
        Schema::table('shop_orders', function (Blueprint $table) {
          //
          $table->string('payment_method')->nullable()->after('status');
          $table->string('payment_status')->nullable()->after('payment_method');
          $table->decimal('tax')->nullable()->after('subtotal');
          $table->decimal('discount')->nullable()->after('tax');
          $table->decimal('discount_percent')->nullable()->after('discount');
        });

        Schema::table('shop_order_items', function (Blueprint $table) {
            $table->integer('shop_variant_id')->nullable()->after('shop_product_id');
            $table->integer('shop_variant_name')->nullable()->after('shop_variant_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('shop_orders', function (Blueprint $table) {
            //
          $table->dropColumn('payment_method');
          $table->dropColumn('payment_status');
          $table->dropColumn('tax');
          $table->dropColumn('discount');
          $table->dropColumn('discount_percent');
        });

        Schema::table('shopp_order_items', function (Blueprint $table) {
            $table->dropColumn('shop_variant_id');
            $table->dropColumn('shop_variant_name');
        });
    }
};
