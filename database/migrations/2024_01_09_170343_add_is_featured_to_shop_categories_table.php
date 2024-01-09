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
        Schema::table('shop_categories', function (Blueprint $table) {
            //
          $table->text('image')->nullable()->after('description');
          $table->boolean('is_featured')->default(false)->after('is_visible');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('shop_categories', function (Blueprint $table) {
            //
          $table->dropColumn('is_featured');
          $table->dropColumn('image');
        });
    }
};
