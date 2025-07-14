<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{

    public function index()
    {
        $perbagian = DB::select('select bagsubags.kode, sum(detailuraians.pagu) as nilai
from bagsubags 
left join detailuraians on bagsubags.id = detailuraians.`bagsubag_id`
group by bagsubags.kode;') ;
        
    $chartperbagian = DB::select('select bagsubags.kode as nama, count(`rencana_kegiatans`.id) as nilai
from bagsubags 
left join `rencana_kegiatans` on bagsubags.id = `rencana_kegiatans`.`bagsubag_id`
group by bagsubags.kode') ;

        $warna = "--bs-warning";
        // $coloumnsetting = '{fill: am5.color(KTUtil.getCssVariableValue("--bs-danger")),}';
        // $chartperbulan = DB::select('select bulan as country, count(bulan) as visits, :columnSettings as columnSettings   from `rencana_kegiatans` group by bulan',['columnSettings' => $coloumnsetting]);
        $chartperbulan = DB::select('SELECT 
    CASE 
        WHEN bulan = 1 THEN "Januari"
        WHEN bulan = 2 THEN "Februari" 
        WHEN bulan = 3 THEN "Maret"
        WHEN bulan = 4 THEN "April"
        WHEN bulan = 5 THEN "Mei"
        WHEN bulan = 6 THEN "Juni"
        WHEN bulan = 7 THEN "Juli"
        WHEN bulan = 8 THEN "Agustus"
        WHEN bulan = 9 THEN "September"
        WHEN bulan = 10 THEN "Oktober"
        WHEN bulan = 11 THEN "November"
        WHEN bulan = 12 THEN "Desember"
        ELSE "Tidak Valid"
    END AS country,
    COUNT(bulan) AS visits,
        :warna as warna
FROM `rencana_kegiatans` 
GROUP BY bulan
ORDER BY convert(bulan, signed)',['warna' => $warna]);

// foreach ($chartperbulan as $item) {
//     $item->columnSettings = [
//         'fill' => 'am5.color(KTUtil.getCssVariableValue("--bs-primary"))'
//     ];
// }

        // dd($chartperbulan);
        // $chartperbulan = (json_encode($chartperbulan));
        $chartperbagian = (json_encode($chartperbagian));
        return view('admin.dashboard', compact('perbagian','chartperbulan','chartperbagian'));
    }
}
