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
		$search = $criteria['search'] ?? '';
		return $this->model->when($search, function ($query) use ($search) {
			$query->where(function($q) use ($search) {
				$q->whereHas('detailuraian', function($q) use ($search){
					$q->where('nama','like',"%{$search}%");
				});
			} );
		})
			->orderBy($field, $sortOrder)
			->paginate($perPage);
	}

	public function filter(array $criteria)
	{
		$perPage = $criteria['per_page'] ?? 5;
		$field = $criteria['sort_field'] ?? 'id';
		$sortOrder = $criteria['sort_order'] ?? 'desc';
		$search = $criteria['filter'] ?? '';
		$fieldx = $criteria['fieldx'] ?? '';
		return $this->model->when($search, function ($query) use ($search,$fieldx) {
			$query->where(function($q) use ($search,$fieldx) {
				$q->whereHas('detailuraian', function($q) use ($search,$fieldx){
					$q->where("$fieldx",'=',"$search");
				});
			} );
		})
			->orderBy($field, $sortOrder)
			->paginate($perPage);
	}

}