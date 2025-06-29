<?php

namespace App\Http\Services\Repositories\Contracts;

use Illuminate\Database\Eloquent\Collection;

interface BagsubagContract
{
	/**
	 * params string $search
	 * @return Collection
	*/

	public function paginated(array $request);
}