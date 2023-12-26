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
        Schema::table('addresses', function (Blueprint $table) {
            //
          $table->string('name')->nullable()->after('id');
          $table->string('phone')->nullable()->after('name');
          $table->string('email')->nullable()->after('phone');
          $table->string('ward')->nullable()->after('state');
          $table->string('district')->nullable()->after('ward');
          $table->string('province')->nullable()->after('district');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('addresses', function (Blueprint $table) {
            //
          $table->dropColumn('name');
          $table->dropColumn('phone');
          $table->dropColumn('ward');
          $table->dropColumn('district');
          $table->dropColumn('province');
        });
    }
};
