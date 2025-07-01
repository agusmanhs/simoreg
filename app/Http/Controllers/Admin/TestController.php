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
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TestController extends Controller
{
    protected $title, $repo, $response;

    public function __construct()
    {
        $this->title = 'testing';
    }

    public function index()
    {
        try {
            $title = $this->title;
            $program = Program::get();
            $kegiatan = Kegiatan::get();
            $kro = Kro::get();
            $ro = Ro::get();
            $komponen = Komponen::get();
            $subkomponen = Subkomponen::get();
            $kodeakun = Kodeakun::get();
            $detailuraian = Detailuraian::get();
            $rencana = DB::select('select 
	a.*,
	SUM(CASE WHEN b.bulan = 1 THEN 1 ELSE 0 END) AS januari,
    SUM(CASE WHEN b.bulan = 2 THEN 1 ELSE 0 END) AS februari,
    SUM(CASE WHEN b.bulan = 3 THEN 1 ELSE 0 END) AS maret,
    SUM(CASE WHEN b.bulan = 4 THEN 1 ELSE 0 END) AS april,
    SUM(CASE WHEN b.bulan = 5 THEN 1 ELSE 0 END) AS mei,
    SUM(CASE WHEN b.bulan = 6 THEN 1 ELSE 0 END) AS juni,
    SUM(CASE WHEN b.bulan = 7 THEN 1 ELSE 0 END) AS juli,
    SUM(CASE WHEN b.bulan = 8 THEN 1 ELSE 0 END) AS agustus,
    SUM(CASE WHEN b.bulan = 9 THEN 1 ELSE 0 END) AS september,
    SUM(CASE WHEN b.bulan = 10 THEN 1 ELSE 0 END) AS oktober,
    SUM(CASE WHEN b.bulan = 11 THEN 1 ELSE 0 END) AS november,
    SUM(CASE WHEN b.bulan = 12 THEN 1 ELSE 0 END) AS desember	
from detailuraians as a left join `rencana_kegiatans` as b on b.detailuraian_id = a.id
GROUP BY a.nama,a.id;');
            return view('admin.' . $title . '.index', compact('title','program','kegiatan','kro','ro','komponen','subkomponen','kodeakun','detailuraian','rencana'));
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

}
