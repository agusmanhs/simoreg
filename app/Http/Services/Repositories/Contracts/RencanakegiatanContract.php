<?php

namespace App\Http\Services\Repositories\Contracts;

use Illuminate\Database\Eloquent\Collection;

interface RencanakegiatanContract
{
	/**
	 * params string $search
	 * @return Collection
	*/

	public function paginated(array $request);
	public function filter(array $request);
}