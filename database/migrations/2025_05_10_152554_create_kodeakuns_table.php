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
        Schema::create('kodeakuns', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('subkomponen_id');
            $table->foreign('subkomponen_id')->references('id')->on('subkomponens');
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
        Schema::dropIfExists('kodeakuns');
    }
};
