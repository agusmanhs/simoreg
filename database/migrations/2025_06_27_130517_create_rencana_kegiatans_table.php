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
        Schema::create('rencana_kegiatans', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('program_id');
            $table->foreign('program_id')->references('id')->on('programs');
            $table->unsignedBigInteger('kegiatan_id');
            $table->foreign('kegiatan_id')->references('id')->on('kegiatans');
            $table->unsignedBigInteger('kro_id');
            $table->foreign('kro_id')->references('id')->on('kros');
            $table->unsignedBigInteger('ro_id');
            $table->foreign('ro_id')->references('id')->on('ros');
            $table->unsignedBigInteger('komponen_id');
            $table->foreign('komponen_id')->references('id')->on('komponens');
            $table->unsignedBigInteger('subkomponen_id');
            $table->foreign('subkomponen_id')->references('id')->on('subkomponens');
            $table->unsignedBigInteger('kodeakun_id');
            $table->foreign('kodeakun_id')->references('id')->on('kodeakuns');
            $table->unsignedBigInteger('detailuraian_id');
            $table->foreign('detailuraian_id')->references('id')->on('detailuraians');
            $table->bigInteger('pagu');
            $table->string('bulan', 100);   
            $table->unsignedBigInteger('bagsubag_id');
            $table->foreign('bagsubag_id')->references('id')->on('bagsubags'); 
            $table->date('tgl_realisasi');
            $table->string('catatan', 255);   
            $table->string('keterangan', 255);   
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rencana_kegiatans');
    }
};
