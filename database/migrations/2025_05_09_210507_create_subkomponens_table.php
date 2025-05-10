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
        Schema::create('subkomponens', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('komponen_id');
            $table->foreign('komponen_id')->references('id')->on('komponens');
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
        Schema::dropIfExists('subkomponens');
    }
};
