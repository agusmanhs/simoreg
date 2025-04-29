<?php

namespace Database\Seeders;

use App\Models\Program;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProgramSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $kegiatan = [
            ['kode' => '060.01.BP', 'nama' => 'Modernisasi Almatsus dan Sarana Prasarana Polri'],
            ['kode' => '060.01.BQ', 'nama' => 'Pemeliharaan Keamanan dan Ketertiban Masyarakat'],
        ];

        foreach ($kegiatan as $key => $v) {
            Program::create([
                'kode' => $v['kode'],
                'nama' => $v['nama'],
            ]);
        };
    }
}
