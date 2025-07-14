<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Detailuraian;
use App\Models\Kegiatan;
use App\Models\Kodeakun;
use App\Models\Komponen;
use App\Models\Kro;
use App\Models\Program;
use App\Models\RencanaKegiatan;
use App\Models\Ro;
use App\Models\Subkomponen;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DetailkegiatanController extends Controller
{
    protected $title, $repo, $response;

    public function __construct()
    {
        $this->title = 'detail-kegiatan';
    }

    public function index()
    {
        try {
            $title = $this->title;
            $data = DB::table('detailuraians as a')
                ->leftJoin('rencana_kegiatans as b', 'b.detailuraian_id', '=', 'a.id')
                ->leftJoin('bagsubags as c', 'c.id', '=', 'a.bagsubag_id')
                ->select(['a.nama', 'a.id', 'a.kode', 'a.pagu', 'c.kode as bag',
                    DB::raw('a.pagu - COALESCE(SUM(b.biaya), 0) as sisa'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 1 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS januari'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 2 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS februari'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 3 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS maret'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 4 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS april'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 5 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS mei'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 6 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS juni'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 7 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS juli'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 8 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS agustus'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 9 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS september'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 10 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS oktober'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 11 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS november'),
                    DB::raw('CASE WHEN MAX(CASE WHEN b.bulan = 12 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS desember'),
                    // ... dst untuk bulan lainnya
                    DB::raw('COUNT(b.id) AS jumkeg')])
                ->groupBy('a.nama', 'a.id', 'a.kode', 'a.pagu', 'c.kode')
                ->get();
            // $data = RencanaKegiatan::get();
            return view('admin.detailkegiatan.index', compact('title','data'));
        } catch (\Exception $e) {
            return view('errors.message', ['message' => $e->getMessage()]);
        }
    }

    public function data(Request $request)
    {
        try {
            $title = $this->title;
            $data = $this->repo->paginated($request->all());
            $perPage = $request->per_page == '' ? 5 : $request->per_page;
            $view = view('admin.' . $title . '.data', compact('data', 'title'))->with('i', ($request->input('page', 1) -
                1) * $perPage)->render();
            return response()->json([
                "total_page" => $data->lastpage(),
                "total_data" => $data->total(),
                "html"       => $view,
            ]);
        } catch (\Exception $e) {
            return view('errors.message', ['message' => $e->getMessage()]);
        }
    }

    public function create()
    {
        try {
            $title = $this->title;
            return view('admin.' . $title . '.form', compact('title'));
        } catch (\Exception $e) {
            return view('errors.message', ['message' => $e->getMessage()]);
        }
    }

    public function store(Request $request)
    {
        try {
            $req = $request->all();
            $data = $this->repo->store($req);
            return response()->json(['data' => $data, 'success' => true]);
        } catch (\Exception $e) {
            return view('errors.message', ['message' => $e->getMessage()]);
        }
    }

    public function edit($id)
    {
        try {
            $title = $this->title;
            $data = $this->repo->find($id);
            return view('admin.' . $title . '.form', compact('title', 'data'));
        } catch (\Exception $e) {
            return view('errors.message', ['message' => $e->getMessage()]);
        }
    }

    public function update(Request $request)
    {
        try {
            $req = $request->all();
            $data = $this->repo->update($req, $request->id);
            return response()->json(['data' => $data, 'success' => true]);
        } catch (\Exception $e) {
            return view('errors.message', ['message' => $e->getMessage()]);
        }
    }

    public function destroy($id)
    {
        try {
            $data = $this->repo->delete($id);
            return response()->json($data);
        } catch (\Exception $e) {
            return view('errors.message', ['message' => $e->getMessage()]);
        }
    }

    public function export()
    {
        $title = $this->title;
        DB::statement("SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))");
            $program = Program::selectRaw('programs.id, programs.kode, programs.nama, COALESCE(SUM(detailuraians.pagu), 0) as total')
                        ->leftJoin('kegiatans', 'programs.id', '=', 'kegiatans.program_id')
                        ->leftJoin('kros', 'kegiatans.id', '=', 'kros.kegiatan_id')
                        ->leftJoin('ros', 'kros.id', '=', 'ros.kro_id')
                        ->leftJoin('komponens', 'ros.id', '=', 'komponens.ro_id')
                        ->leftJoin('subkomponens', 'komponens.id', '=', 'subkomponens.komponen_id')
                        ->leftJoin('kodeakuns', 'subkomponens.id', '=', 'kodeakuns.subkomponen_id')
                        ->leftJoin('detailuraians', 'kodeakuns.id', '=', 'detailuraians.kodeakun_id')
                        ->groupBy('programs.id', 'programs.nama', 'programs.kode')
                        ->get();
            $programlain = Program::get();
            $kegiatan = Kegiatan::get();
//             $kro = DB::select('select kros.*, SUM(detailuraians.pagu) as total from kros
// left join ros on kros.id = ros.`kro_id`
// left join komponens on ros.id = komponens.`ro_id`
// left join subkomponens on komponens.id = subkomponens.`komponen_id`
// left join kodeakuns on subkomponens.id = kodeakuns.`subkomponen_id`
// left join detailuraians on kodeakuns.`id` = `detailuraians`.`kodeakun_id` group by kros.id');
            // $kro = Kro::get();
            $kro = Kro::selectRaw('kros.id, kros.kode, kros.nama, kros.kegiatan_id, COALESCE(SUM(detailuraians.pagu), 0) as total')
                        ->leftJoin('ros', 'kros.id', '=', 'ros.kro_id')
                        ->leftJoin('komponens', 'ros.id', '=', 'komponens.ro_id')
                        ->leftJoin('subkomponens', 'komponens.id', '=', 'subkomponens.komponen_id')
                        ->leftJoin('kodeakuns', 'subkomponens.id', '=', 'kodeakuns.subkomponen_id')
                        ->leftJoin('detailuraians', 'kodeakuns.id', '=', 'detailuraians.kodeakun_id')
                        ->groupBy('kros.id', 'kros.nama', 'kros.kode', 'kros.kegiatan_id')
                        ->get();
            $ro = Ro::selectRaw('ros.id, ros.kode, ros.nama, ros.kro_id, COALESCE(SUM(detailuraians.pagu), 0) as total')
                        ->leftJoin('komponens', 'ros.id', '=', 'komponens.ro_id')
                        ->leftJoin('subkomponens', 'komponens.id', '=', 'subkomponens.komponen_id')
                        ->leftJoin('kodeakuns', 'subkomponens.id', '=', 'kodeakuns.subkomponen_id')
                        ->leftJoin('detailuraians', 'kodeakuns.id', '=', 'detailuraians.kodeakun_id')
                        ->groupBy('ros.id', 'ros.kode', 'ros.nama', 'ros.kro_id')
                        ->get();
            $komponen = Komponen::get();
            $subkomponen = Subkomponen::selectRaw('subkomponens.id, subkomponens.kode, subkomponens.nama, subkomponens.komponen_id,   COALESCE(SUM(detailuraians.pagu), 0) as total')
                        ->leftJoin('kodeakuns', 'subkomponens.id', '=', 'kodeakuns.subkomponen_id')
                        ->leftJoin('detailuraians', 'kodeakuns.id', '=', 'detailuraians.kodeakun_id')
                        ->groupBy('subkomponens.id', 'subkomponens.kode', 'subkomponens.nama', 'subkomponens.komponen_id')
                        ->get();
            $kodeakun = Kodeakun::get();
            $detailuraian = Detailuraian::get();
            $rencana = DB::table('detailuraians as a')
    ->leftJoin('bagsubags as c', 'c.id', '=', 'a.bagsubag_id')
    ->leftJoin(DB::raw('(
        SELECT detailuraian_id,
               COUNT(id) as jumkeg,
               MAX(CASE WHEN bulan = 1 THEN 1 ELSE 0 END) as jan,
               MAX(CASE WHEN bulan = 2 THEN 1 ELSE 0 END) as feb,
               MAX(CASE WHEN bulan = 3 THEN 1 ELSE 0 END) as mar,
               MAX(CASE WHEN bulan = 4 THEN 1 ELSE 0 END) as apr,
               MAX(CASE WHEN bulan = 5 THEN 1 ELSE 0 END) as mei,
               MAX(CASE WHEN bulan = 6 THEN 1 ELSE 0 END) as jun,
               MAX(CASE WHEN bulan = 7 THEN 1 ELSE 0 END) as jul,
               MAX(CASE WHEN bulan = 8 THEN 1 ELSE 0 END) as agu,
               MAX(CASE WHEN bulan = 9 THEN 1 ELSE 0 END) as sep,
               MAX(CASE WHEN bulan = 10 THEN 1 ELSE 0 END) as okt,
               MAX(CASE WHEN bulan = 11 THEN 1 ELSE 0 END) as nov,
               MAX(CASE WHEN bulan = 12 THEN 1 ELSE 0 END) as des
        FROM rencana_kegiatans 
        GROUP BY detailuraian_id
    ) as monthly'), 'a.id', '=', 'monthly.detailuraian_id')
    ->select([
        'a.*',
        'c.kode as bag',
        DB::raw('COALESCE(monthly.jumkeg, 0) as jumkeg'),
        DB::raw('CASE WHEN monthly.jan = 1 THEN "X" ELSE "" END as januari'),
        DB::raw('CASE WHEN monthly.feb = 1 THEN "X" ELSE "" END as februari'),
        DB::raw('CASE WHEN monthly.mar = 1 THEN "X" ELSE "" END as maret'),
        DB::raw('CASE WHEN monthly.apr = 1 THEN "X" ELSE "" END as april'),
        DB::raw('CASE WHEN monthly.mei = 1 THEN "X" ELSE "" END as mei'),
        DB::raw('CASE WHEN monthly.jun = 1 THEN "X" ELSE "" END as juni'),
        DB::raw('CASE WHEN monthly.jul = 1 THEN "X" ELSE "" END as juli'),
        DB::raw('CASE WHEN monthly.agu = 1 THEN "X" ELSE "" END as agustus'),
        DB::raw('CASE WHEN monthly.sep = 1 THEN "X" ELSE "" END as september'),
        DB::raw('CASE WHEN monthly.okt = 1 THEN "X" ELSE "" END as oktober'),
        DB::raw('CASE WHEN monthly.nov = 1 THEN "X" ELSE "" END as november'),
        DB::raw('CASE WHEN monthly.des = 1 THEN "X" ELSE "" END as desember')
    ])
    ->get();
        $rencanalain = DB::select('select 
	a.*,c.kode as bag,
	CASE WHEN MAX(CASE WHEN b.bulan = 1 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS januari,
        CASE WHEN MAX(CASE WHEN b.bulan = 2 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS februari,
        CASE WHEN MAX(CASE WHEN b.bulan = 3 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS maret,
        CASE WHEN MAX(CASE WHEN b.bulan = 4 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS april,
        CASE WHEN MAX(CASE WHEN b.bulan = 5 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS mei,
        CASE WHEN MAX(CASE WHEN b.bulan = 6 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS juni,
        CASE WHEN MAX(CASE WHEN b.bulan = 7 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS juli,
        CASE WHEN MAX(CASE WHEN b.bulan = 8 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS agustus,
        CASE WHEN MAX(CASE WHEN b.bulan = 9 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS september,
        CASE WHEN MAX(CASE WHEN b.bulan = 10 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS oktober,
        CASE WHEN MAX(CASE WHEN b.bulan = 11 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS november,
        CASE WHEN MAX(CASE WHEN b.bulan = 12 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS desember,
        COUNT(b.id) AS jumkeg	
from detailuraians as a left join `rencana_kegiatans` as b on b.detailuraian_id = a.id
left join `bagsubags` as c on c.id = a.bagsubag_id
GROUP BY a.nama,a.id;');

        $pdf = Pdf::loadView('admin.detailkegiatan.pdf', compact('program','kegiatan','kro','ro','komponen','subkomponen','kodeakun','detailuraian','rencana'))->setPaper('F4', 'landscape');
        return $pdf->stream('rencana.pdf');
    }

        public function exportbagian()
    {
        $title = $this->title;
            $program = Program::get();
            $kegiatan = Kegiatan::get();
//             $kro = DB::select('select kros.*, SUM(detailuraians.pagu) as total from kros
// left join ros on kros.id = ros.`kro_id`
// left join komponens on ros.id = komponens.`ro_id`
// left join subkomponens on komponens.id = subkomponens.`komponen_id`
// left join kodeakuns on subkomponens.id = kodeakuns.`subkomponen_id`
// left join detailuraians on kodeakuns.`id` = `detailuraians`.`kodeakun_id` group by kros.id');
            // $kro = Kro::get();
            $kro = Kro::selectRaw('kros.*, COALESCE(SUM(detailuraians.pagu), 0) as total')
                        ->leftJoin('ros', 'kros.id', '=', 'ros.kro_id')
                        ->leftJoin('komponens', 'ros.id', '=', 'komponens.ro_id')
                        ->leftJoin('subkomponens', 'komponens.id', '=', 'subkomponens.komponen_id')
                        ->leftJoin('kodeakuns', 'subkomponens.id', '=', 'kodeakuns.subkomponen_id')
                        ->leftJoin('detailuraians', 'kodeakuns.id', '=', 'detailuraians.kodeakun_id')
                        ->groupBy('kros.id', 'kros.nama')
                        ->get();
                        // dd($kro);
            $ro = Ro::selectRaw('ros.*, COALESCE(SUM(detailuraians.pagu), 0) as total')
                        ->leftJoin('komponens', 'ros.id', '=', 'komponens.ro_id')
                        ->leftJoin('subkomponens', 'komponens.id', '=', 'subkomponens.komponen_id')
                        ->leftJoin('kodeakuns', 'subkomponens.id', '=', 'kodeakuns.subkomponen_id')
                        ->leftJoin('detailuraians', 'kodeakuns.id', '=', 'detailuraians.kodeakun_id')
                        ->groupBy('ros.id', 'ros.nama')
                        ->get();
            $komponen = Komponen::get();
            $subkomponen = Subkomponen::selectRaw('subkomponens.*, COALESCE(SUM(detailuraians.pagu), 0) as total')
                        ->leftJoin('kodeakuns', 'subkomponens.id', '=', 'kodeakuns.subkomponen_id')
                        ->leftJoin('detailuraians', 'kodeakuns.id', '=', 'detailuraians.kodeakun_id')
                        ->groupBy('subkomponens.id', 'subkomponens.nama')
                        ->get();
            $kodeakun = Kodeakun::get();
            $detailuraian = Detailuraian::get();
        $rencana = DB::select('select 
	a.*,c.kode as bag,
	CASE WHEN MAX(CASE WHEN b.bulan = 1 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS januari,
        CASE WHEN MAX(CASE WHEN b.bulan = 2 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS februari,
        CASE WHEN MAX(CASE WHEN b.bulan = 3 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS maret,
        CASE WHEN MAX(CASE WHEN b.bulan = 4 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS april,
        CASE WHEN MAX(CASE WHEN b.bulan = 5 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS mei,
        CASE WHEN MAX(CASE WHEN b.bulan = 6 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS juni,
        CASE WHEN MAX(CASE WHEN b.bulan = 7 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS juli,
        CASE WHEN MAX(CASE WHEN b.bulan = 8 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS agustus,
        CASE WHEN MAX(CASE WHEN b.bulan = 9 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS september,
        CASE WHEN MAX(CASE WHEN b.bulan = 10 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS oktober,
        CASE WHEN MAX(CASE WHEN b.bulan = 11 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS november,
        CASE WHEN MAX(CASE WHEN b.bulan = 12 THEN 1 ELSE 0 END) = 1 THEN "X" ELSE "" END AS desember,
        COUNT(b.id) AS jumkeg	
from detailuraians as a left join `rencana_kegiatans` as b on b.detailuraian_id = a.id
left join `bagsubags` as c on c.id = a.bagsubag_id
GROUP BY a.nama,a.id;');

        

        $pdf = Pdf::loadView('admin.detailkegiatan.pdfbagian', compact('program','kegiatan','kro','ro','komponen','subkomponen','kodeakun','detailuraian','rencana'))->setPaper('F4', 'landscape');
        // dd("DCC");
        return $pdf->stream('rencanaperbagian.pdf');
    }
}
