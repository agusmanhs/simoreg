<?php

namespace Database\Seeders;

use App\Models\Menu;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $menu = [
            ['name' => 'APPS', 'icon' => '', 'url' => '#', 'index' => 1, 'main_menu' => 'APPS', 'active' => '1', 'parent' => '0'],
            ['name' => 'DATA MASTER', 'icon' => '', 'url' => '#', 'index' => 2, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '0'],
            ['name' => 'USER', 'icon' => '', 'url' => '#', 'index' => 3, 'main_menu' => 'USER',  'active' => '1', 'parent' => '0'],
            ['name' => 'USER SETTING', 'icon' => '', 'url' => '#', 'index' => 4, 'main_menu' => 'USER SETTING', 'active' => '1', 'parent' => '0'],

            ['name' => 'Permohonan Masuk', 'icon' => 'bi-stack', 'url' => 'permohonan-masuk', 'index' => 1, 'main_menu' => 'APPS', 'active' => '1', 'parent' => '1'],

            ['name' => 'Program', 'icon' => 'bi-stack', 'url' => 'program', 'index' => 0, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '2'],
            ['name' => 'Kegiatan', 'icon' => 'bi-stack', 'url' => 'kegiatan', 'index' => 1, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '2'],
            ['name' => 'K R O', 'icon' => 'bi-stack', 'url' => 'kro', 'index' => 2, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '2'],
            ['name' => 'R O', 'icon' => 'bi-stack', 'url' => 'ro', 'index' => 3, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '2'],
            ['name' => 'Komponen', 'icon' => 'bi-stack', 'url' => 'komponen', 'index' => 4, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '2'],
            ['name' => 'Sub Komponen', 'icon' => 'bi-stack', 'url' => 'sub-komponen', 'index' => 5, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '2'],
            ['name' => 'Kode Akun', 'icon' => 'bi-stack', 'url' => 'kode-akun', 'index' => 6, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '2'],
            ['name' => 'Detail Uraian', 'icon' => 'bi-stack', 'url' => 'uraian-detail', 'index' => 7, 'main_menu' => 'DATA MASTER', 'active' => '1', 'parent' => '2'],

            ['name' => 'User', 'icon' => 'bi-people-fill', 'url' => 'users', 'index' => 0, 'main_menu' => 'USERS', 'active' => '1', 'parent' => '3'],

            ['name' => 'Role', 'icon' => 'bi-gear-wide', 'url' => 'roles', 'index' => 0, 'main_menu' => 'USER SETTING', 'active' => '1', 'parent' => '4'],
            ['name' => 'Menu', 'icon' => 'bi-card-list', 'url' => 'menus', 'index' => 0, 'main_menu' => 'USER SETTING', 'active' => '1', 'parent' => '4'],
            ['name' => 'User Menu', 'icon' => 'bi-gear-fill', 'url' => 'user-menus', 'index' => 0, 'main_menu' => 'USER SETTING', 'active' => '1', 'parent' => '4'],

        ];

        foreach ($menu as $v) {
            Menu::create([
                'main_menu' => 'APPS',
                'sub_parent' => '0',
                'parent' => $v['parent'],
                'name' => $v['name'],
                'icon' => $v['icon'],
                'url' => $v['url'],
                'index' => $v['index'],
                'active' => $v['active'],
            ]);
        }
    }
}
