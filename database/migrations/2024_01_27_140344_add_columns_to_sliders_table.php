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
        Schema::table('sliders', function (Blueprint $table) {
            //
            $table->enum('display_type', ['slider', 'grid'])->default('slider')->after('name');
        });
        Schema::table('slider_items', function (Blueprint $table) {
            //
            $table->boolean('is_image_only')->default(false)->after('is_alt_style');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('sliders', function (Blueprint $table) {
            //
            $table->dropColumn('display_type');
        });
        Schema::table('slider_items', function (Blueprint $table) {
            //
            $table->dropColumn('is_image_only');
        });
    }
};
