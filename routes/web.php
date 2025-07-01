<?php

use App\Http\Controllers\Admin\BagsubagController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\DetailkegiatanController;
use App\Http\Controllers\Admin\DetailuraianController;
use App\Http\Controllers\Admin\KegiatanController;
use App\Http\Controllers\Admin\KodeakunController;
use App\Http\Controllers\Admin\KomponenController;
use App\Http\Controllers\Admin\KroController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\ProgramController;
use App\Http\Controllers\Admin\RencanakegiatanController;
use App\Http\Controllers\Admin\RoController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\SubkomponenController;
use App\Http\Controllers\Admin\TestController;
use App\Http\Controllers\Admin\UserMenuController;
use App\Http\Controllers\Admin\UsersController;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\Auth\LoginController as Auths;
use App\Models\Subkomponen;

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
    Route::get('/sub-komponen/list/{id}',  [SubkomponenController::class, 'list'])->name('subkomponen.list');   
    Route::get('/kode-akun/list/{id}',  [KodeakunController::class, 'list'])->name('kodeakun.list');   
    Route::get('/detail-uraian/list/{id}',  [DetailuraianController::class, 'list'])->name('detailuraian.list');   

    // ADMIN_ROUTES
    Route::group(['prefix' => 'admin',   'middleware' => ['auth']], function () {

        Route::get('/', [DashboardController::class, 'index'])->name('admin');


        # APPS 
        Route::group(['prefix' => '/rencana-kegiatan'], function () {
            Route::get('/', [RencanakegiatanController::class, 'index'])->name('rencanakegiatan.index');
            Route::get('/data', [RencanakegiatanController::class, 'data'])->name('rencanakegiatan.data');
            Route::get('/create', [RencanakegiatanController::class, 'create'])->name('rencanakegiatan.create');
            Route::post('/store', [RencanakegiatanController::class, 'store'])->name('rencanakegiatan.store');
            Route::get('/{id}/edit', [RencanakegiatanController::class, 'edit'])->name('rencanakegiatan.edit');
            Route::put('/{id}', [RencanakegiatanController::class, 'update'])->name('rencanakegiatan.update');
            Route::delete('/{id}', [RencanakegiatanController::class, 'destroy'])->name('rencanakegiatan.delete');
        });

        Route::group(['prefix' => '/detail-kegiatan'], function () {
            Route::get('/', [DetailkegiatanController::class, 'index'])->name('detailkegiatan.index');
            Route::get('/data', [DetailkegiatanController::class, 'data'])->name('detailkegiatan.data');
            Route::get('/create', [DetailkegiatanController::class, 'create'])->name('detailkegiatan.create');
            Route::post('/store', [DetailkegiatanController::class, 'store'])->name('detailkegiatan.store');
            Route::get('/{id}/edit', [DetailkegiatanController::class, 'edit'])->name('detailkegiatan.edit');
            Route::put('/{id}', [DetailkegiatanController::class, 'update'])->name('detailkegiatan.update');
            Route::delete('/{id}', [DetailkegiatanController::class, 'destroy'])->name('detailkegiatan.delete');
            
            Route::get('/export', [DetailkegiatanController::class, 'export'])->name('detailkegiatan.export');
        });

        Route::group(['prefix' => '/testing'], function () {
            Route::get('/', [TestController::class, 'index'])->name('testing.index');
            Route::get('/data', [TestController::class, 'data'])->name('testing.data');
            Route::get('/create', [TestController::class, 'create'])->name('testing.create');
            Route::post('/store', [TestController::class, 'store'])->name('testing.store');
            Route::get('/{id}/edit', [TestController::class, 'edit'])->name('testing.edit');
            Route::put('/{id}', [TestController::class, 'update'])->name('testing.update');
            Route::delete('/{id}', [TestController::class, 'destroy'])->name('testing.delete');
        });



        # MENU MASTER DATA 
        Route::group(['prefix' => '/bagsubag'], function () {
            Route::get('/', [BagsubagController::class, 'index'])->name('bagsubag.index');
            Route::get('/data', [BagsubagController::class, 'data'])->name('bagsubag.data');
            Route::get('/create', [BagsubagController::class, 'create'])->name('bagsubag.create');
            Route::post('/store', [BagsubagController::class, 'store'])->name('bagsubag.store');
            Route::get('/{id}/edit', [BagsubagController::class, 'edit'])->name('bagsubag.edit');
            Route::put('/{id}', [BagsubagController::class, 'update'])->name('bagsubag.update');
            Route::delete('/{id}', [BagsubagController::class, 'destroy'])->name('bagsubag.delete');

        });
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
        
        Route::group(['prefix' => '/sub-komponen'], function () {
            Route::get('/', [SubkomponenController::class, 'index'])->name('subkomponen.index');
            Route::get('/data', [SubkomponenController::class, 'data'])->name('subkomponen.data');
            Route::get('/create', [SubkomponenController::class, 'create'])->name('subkomponen.create');
            Route::post('/store', [SubkomponenController::class, 'store'])->name('subkomponen.store');
            Route::get('/{id}/edit', [SubkomponenController::class, 'edit'])->name('subkomponen.edit');
            Route::put('/{id}', [SubkomponenController::class, 'update'])->name('subkomponen.update');
            Route::delete('/{id}', [SubkomponenController::class, 'destroy'])->name('subkomponen.delete');
        });
        
        Route::group(['prefix' => '/kode-akun'], function () {
            Route::get('/', [KodeakunController::class, 'index'])->name('kodeakun.index');
            Route::get('/data', [KodeakunController::class, 'data'])->name('kodeakun.data');
            Route::get('/create', [KodeakunController::class, 'create'])->name('kodeakun.create');
            Route::post('/store', [KodeakunController::class, 'store'])->name('kodeakun.store');
            Route::get('/{id}/edit', [KodeakunController::class, 'edit'])->name('kodeakun.edit');
            Route::put('/{id}', [KodeakunController::class, 'update'])->name('kodeakun.update');
            Route::delete('/{id}', [KodeakunController::class, 'destroy'])->name('kodeakun.delete');
        });

        Route::group(['prefix' => '/detail-uraian'], function () {
            Route::get('/', [DetailuraianController::class, 'index'])->name('detailuraian.index');
            Route::get('/data', [DetailuraianController::class, 'data'])->name('detailuraian.data');
            Route::get('/create', [DetailuraianController::class, 'create'])->name('detailuraian.create');
            Route::post('/store', [DetailuraianController::class, 'store'])->name('detailuraian.store');
            Route::get('/{id}/edit', [DetailuraianController::class, 'edit'])->name('detailuraian.edit');
            Route::put('/{id}', [DetailuraianController::class, 'update'])->name('detailuraian.update');
            Route::delete('/{id}', [DetailuraianController::class, 'destroy'])->name('detailuraian.delete');
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

