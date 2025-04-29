<?php

namespace Database\Seeders;

use App\Models\Kegiatan;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class KegiatanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $kegiatan = [
            ['kode' => 'SU', 'nama' => 'SuperUser'],
            ['kode' => 'A', 'nama' => 'Admin'],
        ];

        foreach ($kegiatan as $key => $v) {
            Kegiatan::create([
                'kode' => $v['kode'],
                'nama' => $v['nama'],
            ]);
        };
    }
}
