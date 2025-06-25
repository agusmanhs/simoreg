<?php

namespace App\Providers;

use App\Http\Services\Repositories\BaseRepository;
use App\Http\Services\Repositories\Contracts\BaseContract;
use App\Http\Services\Repositories\Contracts\DetailuraianContract;
use App\Http\Services\Repositories\Contracts\KegiatanContract;
use App\Http\Services\Repositories\Contracts\KodeakunContract;
use App\Http\Services\Repositories\Contracts\KomponenContract;
use App\Http\Services\Repositories\Contracts\KroContract;
use App\Http\Services\Repositories\Contracts\MenuContract;
use App\Http\Services\Repositories\Contracts\ProgramContract;
use App\Http\Services\Repositories\Contracts\RoContract;
use App\Http\Services\Repositories\Contracts\RoleContract;
use App\Http\Services\Repositories\Contracts\SubkomponenContract;
use App\Http\Services\Repositories\Contracts\UserMenuContract;
use App\Http\Services\Repositories\Contracts\UsersContract;
use App\Http\Services\Repositories\DetailuraianRepository;
use App\Http\Services\Repositories\KegiatanRepository;
use App\Http\Services\Repositories\KodeakunRepository;
use App\Http\Services\Repositories\KomponenRepository;
use App\Http\Services\Repositories\KroRepository;
use App\Http\Services\Repositories\MenuRepository;
use App\Http\Services\Repositories\ProgramRepository;
use App\Http\Services\Repositories\RoleRepository;
use App\Http\Services\Repositories\RoRepository;
use App\Http\Services\Repositories\SubkomponenRepository;
use App\Http\Services\Repositories\UserMenuRepository;
use App\Http\Services\Repositories\UsersRepository;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        $this->app->bind(BaseContract::class, BaseRepository::class);

        $this->app->bind(MenuContract::class, MenuRepository::class);
        $this->app->bind(RoleContract::class, RoleRepository::class);
        $this->app->bind(UserMenuContract::class, UserMenuRepository::class);
        $this->app->bind(UsersContract::class, UsersRepository::class);
        
        $this->app->bind(ProgramContract::class, ProgramRepository::class);
        $this->app->bind(KegiatanContract::class, KegiatanRepository::class);
        $this->app->bind(KroContract::class, KroRepository::class);
        $this->app->bind(RoContract::class, RoRepository::class);
        $this->app->bind(KomponenContract::class, KomponenRepository::class);
        $this->app->bind(SubkomponenContract::class, SubkomponenRepository::class);
        $this->app->bind(KodeakunContract::class, KodeakunRepository::class);
        $this->app->bind(DetailuraianContract::class, DetailuraianRepository::class);
    }
}
