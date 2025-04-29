<?php

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\KegiatanController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\ProgramController;
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


    // ADMIN_ROUTES
    Route::group(['prefix' => 'admin',   'middleware' => ['web']], function () {

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
