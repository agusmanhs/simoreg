<?php

namespace App\Http\Services\Repositories\Contracts;

use Illuminate\Database\Eloquent\Collection;

interface RoContract
{
	/**
	 * params string $search
	 * @return Collection
	*/

	public function paginated(array $request);
}