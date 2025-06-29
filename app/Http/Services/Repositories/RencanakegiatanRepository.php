<?php

namespace App\Http\Services\Repositories;

use App\Http\Services\Repositories\BaseRepository;
use App\Http\Services\Repositories\Contracts\RencanakegiatanContract;
use App\Models\Rencanakegiatan;

class RencanakegiatanRepository extends BaseRepository implements RencanakegiatanContract
{
	/**
	 * @var
	 */
	protected $model;

	public function __construct(Rencanakegiatan $model)
	{
		$this->model = $model;
	}

	public function paginated(array $criteria)
	{
		$perPage = $criteria['per_page'] ?? 5;
		$field = $criteria['sort_field'] ?? 'id';
		$sortOrder = $criteria['sort_order'] ?? 'desc';
		return $this->model->orderBy($field, $sortOrder)->paginate($perPage);
	}

}