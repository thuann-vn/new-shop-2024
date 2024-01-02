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
        Schema::table('shop_product_variants', function (Blueprint $table) {
            //
          $table->decimal('old_price', 10, 2)->nullable()->after('price');
          $table->boolean('is_visible')->default(true)->after('barcode');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('shop_product_variants', function (Blueprint $table) {
            //
          $table->dropColumn('old_price');
          $table->dropColumn('is_visible');
        });
    }
};
