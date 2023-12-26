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
          if(Schema::hasColumn('addresses', 'city')) {
            $table->dropColumn('city');
            $table->dropColumn('state');
          }

          if(!Schema::hasColumn('addresses', 'ward_code')) {
            $table->string('ward_code')->nullable()->after('street');
          }
          if(!Schema::hasColumn('addresses', 'district_code')) {
            $table->string('district_code')->nullable()->after('ward_code');
          }
          if(!Schema::hasColumn('addresses', 'province_code')) {
            $table->string('province_code')->nullable()->after('district_code');
          }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('addresses', function (Blueprint $table) {
            //
          $table->string('city')->nullable()->after('address');
          $table->string('state')->nullable()->after('city');
          $table->dropColumn('ward_code');
          $table->dropColumn('district_code');
          $table->dropColumn('province_code');
        });
    }
};
