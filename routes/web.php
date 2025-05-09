<?php

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\KegiatanController;
use App\Http\Controllers\Admin\KomponenController;
use App\Http\Controllers\Admin\KroController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\ProgramController;
use App\Http\Controllers\Admin\RoController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\UserMenuController;
use App\Http\Controllers\Admin\UsersController;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\Auth\LoginController as Auths;

Route::get('/', function () {
    return view('welcome');
});

// Auth::routes();

// Route::resource('photos', PhotoController::class)->except(['create', 'store', 'update', 'destroy']);
// Route::resource('photos', PhotoController::class)->only(['index', 'show']);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::domain('')->group(function () { // development
    // Route::domain('permohonan.bpfkmakassar.go.id')->group(function () { // production

    // Auth::routes();
    Route::get('/auth/login', [Auths::class, 'index'])->name('admin.login');
    Route::post('/auth/login', [Auths::class, 'login'])->name('login');

    Route::get('/logout', [Auths::class, 'logout'])->middleware('auth');

    // OPTION LIST
    Route::get('/kegiatan/list/{id}',  [KegiatanController::class, 'list'])->name('kegiatan.list');   
    Route::get('/kro/list/{id}',  [KroController::class, 'list'])->name('kro.list');   
    Route::get('/ro/list/{id}',  [RoController::class, 'list'])->name('ro.list');   
    Route::get('/komponen/list/{id}',  [KomponenController::class, 'list'])->name('komponen.list');   

    // ADMIN_ROUTES
    Route::group(['prefix' => 'admin',   'middleware' => ['auth']], function () {

        Route::get('/', [DashboardController::class, 'index'])->name('admin');


        # APPS 

        # MENU MASTER DATA 
        Route::group(['prefix' => '/program'], function () {
            Route::get('/', [ProgramController::class, 'index'])->name('program.index');
            Route::get('/data', [ProgramController::class, 'data'])->name('program.data');
            Route::get('/create', [ProgramController::class, 'create'])->name('program.create');
            Route::post('/store', [ProgramController::class, 'store'])->name('program.store');
            Route::get('/{id}/edit', [ProgramController::class, 'edit'])->name('program.edit');
            Route::put('/{id}', [ProgramController::class, 'update'])->name('program.update');
            Route::delete('/{id}', [ProgramController::class, 'destroy'])->name('program.delete');

        });

        Route::group(['prefix' => '/kegiatan'], function () {
            Route::get('/', [KegiatanController::class, 'index'])->name('kegiatan.index');
            Route::get('/data', [KegiatanController::class, 'data'])->name('kegiatan.data');
            Route::get('/create', [KegiatanController::class, 'create'])->name('kegiatan.create');
            Route::post('/store', [KegiatanController::class, 'store'])->name('kegiatan.store');
            Route::get('/{id}/edit', [KegiatanController::class, 'edit'])->name('kegiatan.edit');
            Route::put('/{id}', [KegiatanController::class, 'update'])->name('kegiatan.update');
            Route::delete('/{id}', [KegiatanController::class, 'destroy'])->name('kegiatan.delete');

        });

        Route::group(['prefix' => '/kro'], function () {
            Route::get('/', [KroController::class, 'index'])->name('kro.index');
            Route::get('/data', [KroController::class, 'data'])->name('kro.data');
            Route::get('/create', [KroController::class, 'create'])->name('kro.create');
            Route::post('/store', [KroController::class, 'store'])->name('kro.store');
            Route::get('/{id}/edit', [KroController::class, 'edit'])->name('kro.edit');
            Route::put('/{id}', [KroController::class, 'update'])->name('kro.update');
            Route::delete('/{id}', [KroController::class, 'destroy'])->name('kro.delete');
        });
        
        Route::group(['prefix' => '/ro'], function () {
            Route::get('/', [RoController::class, 'index'])->name('ro.index');
            Route::get('/data', [RoController::class, 'data'])->name('ro.data');
            Route::get('/create', [RoController::class, 'create'])->name('ro.create');
            Route::post('/store', [RoController::class, 'store'])->name('ro.store');
            Route::get('/{id}/edit', [RoController::class, 'edit'])->name('ro.edit');
            Route::put('/{id}', [RoController::class, 'update'])->name('ro.update');
            Route::delete('/{id}', [RoController::class, 'destroy'])->name('ro.delete');
        });
        
        Route::group(['prefix' => '/komponen'], function () {
            Route::get('/', [KomponenController::class, 'index'])->name('komponen.index');
            Route::get('/data', [KomponenController::class, 'data'])->name('komponen.data');
            Route::get('/create', [KomponenController::class, 'create'])->name('komponen.create');
            Route::post('/store', [KomponenController::class, 'store'])->name('komponen.store');
            Route::get('/{id}/edit', [KomponenController::class, 'edit'])->name('komponen.edit');
            Route::put('/{id}', [KomponenController::class, 'update'])->name('komponen.update');
            Route::delete('/{id}', [KomponenController::class, 'destroy'])->name('komponen.delete');
        });

        # USER SETTING
        Route::group(['prefix' => '/roles'], function () {
            Route::get('/', [RoleController::class, 'index'])->name('roles.index');
            Route::get('/data', [RoleController::class, 'data'])->name('roles.data');
            Route::get('/create', [RoleController::class, 'create'])->name('roles.create');
            Route::post('/store', [RoleController::class, 'store'])->name('roles.store');
            Route::get('/{id}/edit', [RoleController::class, 'edit'])->name('roles.edit');
            Route::put('/{id}', [RoleController::class, 'update'])->name('roles.update');
            Route::delete('/{id}', [RoleController::class, 'destroy'])->name('roles.delete');
        });

        Route::group(['prefix' => '/menus'], function () {
            Route::get('/', [MenuController::class, 'index'])->name('menus.index');
            Route::get('/data', [MenuController::class, 'data'])->name('menus.data');
            Route::get('/create', [MenuController::class, 'create'])->name('menus.create');
            Route::post('/store', [MenuController::class, 'store'])->name('menus.store');
            Route::get('/{id}/edit', [MenuController::class, 'edit'])->name('menus.edit');
            Route::put('/{id}', [MenuController::class, 'update'])->name('menus.update');
            Route::delete('/{id}', [MenuController::class, 'destroy'])->name('menus.delete');
        });

        Route::group(['prefix' => '/user-menus'], function () {
            Route::get('/', [UserMenuController::class, 'index'])->name('user-menus.index');
            Route::get('/data', [UserMenuController::class, 'data'])->name('user-menus.data');
            Route::post('/store', [UserMenuController::class, 'store'])->name('user-menus.store');
            Route::get('/{id}/edit', [UserMenuController::class, 'edit'])->name('user-menus.edit');
            Route::get('/{id}/show', [UserMenuController::class, 'show'])->name('user-menus.show');
            Route::delete('/{id}', [UserMenuController::class, 'destroy'])->name('user-menus.delete');
        });
        Route::get('user-menus/create/{id}', [UserMenuController::class, 'create'])->name('user-menus.create');


        Route::group(['prefix' => '/users'], function () {
            Route::get('/', [UsersController::class, 'index'])->name('users.index');
            Route::get('/data', [UsersController::class, 'data'])->name('users.data');
            Route::get('/create', [UsersController::class, 'create'])->name('users.create');
            Route::post('/store', [UsersController::class, 'store'])->name('users.store');
            Route::get('/{id}/edit', [UsersController::class, 'edit'])->name('users.edit');
            Route::put('/{id}', [UsersController::class, 'update'])->name('users.update');
            Route::delete('/{id}', [UsersController::class, 'destroy'])->name('users.delete');
        });
    });
});
Route::get('/cc', function () {
    Artisan::call('optimize:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    return "Cache is cleared";
});

