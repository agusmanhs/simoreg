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
        Schema::create('ros', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('kro_id');
            $table->foreign('kro_id')->references('id')->on('kros');
            $table->string('kode', 20);
            $table->string('nama', 150);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ros');
    }
};
