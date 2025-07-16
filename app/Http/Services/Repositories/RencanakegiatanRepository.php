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

	// public function filter(array $criteria)
	// {
	// 	$perPage = $criteria['per_page'] ?? 5;
	// 	$field = $criteria['sort_field'] ?? 'id';
	// 	$sortOrder = $criteria['sort_order'] ?? 'desc';
	// 	$search = $criteria['filter'] ?? '';
	// 	$fieldx = $criteria['fieldx'] ?? '';
	// 	$kabag = $criteria['kabag'] ?? '';
	// 	$kabagx = $criteria['kabagx'] ?? '';
	// 	return $this->model->when($search, function ($query) use ($search, $fieldx) {
    //     $query->whereHas('detailuraian', function($q) use ($search, $fieldx) {
    //         $q->where("$fieldx", '=', "$search");
    //    		 });
   	// 	 })
	// 	->when($kabag && $kabag !== 'all', function ($query) use ($kabag, $kabagx) {
	// 		$query->whereHas('bagsubag', function($q) use ($kabag, $kabagx) {
	// 			$q->where("$kabagx", '=', "$kabag");
	// 		});
	// 	})
	// 		->orderBy($field, $sortOrder)
	// 		->paginate($perPage);
	// }

	public function filter(array $criteria)
{
    $perPage = $criteria['per_page'] ?? 5;
    $field = $criteria['sort_field'] ?? 'id';
    $sortOrder = $criteria['sort_order'] ?? 'desc';
    $bulan = $criteria['filter'] ?? '';
    $bagsubag = $criteria['bagsubag'] ?? '';
    
    $query = $this->model->newQuery();
    
    // Filter berdasarkan bulan
    if (!empty($bulan)) {
        $query->where('bulan', '=', $bulan);
    }
    
    // Filter berdasarkan bagsubag
    if (!empty($bagsubag) && $bagsubag !== 'all') {
        $query->where('bagsubag_id', '=', $bagsubag);
    }
    
    return $query->orderBy($field, $sortOrder)->paginate($perPage);
}

}