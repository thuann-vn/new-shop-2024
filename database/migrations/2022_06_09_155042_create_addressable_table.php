<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class() extends Migration
{
    public function up()
    {
        Schema::create('addresses', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable()->after('id');
            $table->string('phone')->nullable()->after('name');
            $table->string('email')->nullable()->after('phone');
            $table->string('street')->nullable();
            $table->string('ward')->nullable()->after('state');
            $table->string('district')->nullable()->after('ward');
            $table->string('province')->nullable()->after('district');
            $table->string('country')->nullable();
            $table->string('zip')->nullable();
            $table->timestamps();
        });

        Schema::create('addressables', function (Blueprint $table) {
            $table->foreignId('address_id');
            $table->morphs('addressable');
        });
    }

    public function down()
    {
        Schema::dropIfExists('addresses');
        Schema::dropIfExists('addressables');
    }
};
