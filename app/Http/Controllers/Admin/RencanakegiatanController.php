<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Services\Repositories\Contracts\RencanakegiatanContract;
use App\Models\RencanaKegiatan;
use Illuminate\Http\Request;

class RencanakegiatanController extends Controller
{
    protected $title, $repo, $response;

    public function __construct(RencanakegiatanContract $repo)
    {
        $this->title = 'rencanakegiatan';
        $this->repo = $repo;
    }

    public function index()
    {
        try {
            $title = $this->title;
            return view('admin.' . $title . '.index', compact('title'));
        } catch (\Exception $e) {
            return view('errors.message', ['message' => $e->getMessage()]);
        }
    }

    public function data(Request $request)
    {
        try {
            // dd($request->all());
            $title = $this->title;
            $hasFilter = !empty($request->bulan) || (!empty($request->kabag) && $request->kabag !== 'all');
        
            if(!$hasFilter){
                $data = $this->repo->paginated($request->all());
            }else{
                // $data = $this->repo->filter([
                //     'filter'=>$request->bulan,
                //     'fieldx'=>'bulan',
                //     'kabag' => $request->kabag,
                //     'kabagx' => 'bagsubag_id',
                //     'per_page' => $request->per_page ?? 5
                // ]);
                $data = $this->repo->filter([
                'filter' => $request->bulan,        // untuk bulan
                'bagsubag' => $request->kabag,   // untuk bagsubag_id
                'per_page' => $request->per_page ?? 5
            ]);

            }

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
            $action = $request->input('action');

            if(isset($req['tgl_realisasi'])){        
                if ($action === 'update') {
                    $data = $this->repo->update($req, $request->id);
                    return redirect()->back()->with('success' , 'success');
                }elseif($action === 'set_null'){
                    $data = $this->repo->update([
                        'tgl_realisasi' => null,
                        'biaya' => null,
                        'catatan' => null,
                    ], $request->id);
                    return redirect()->back()->with('success' , 'success');
                }
            }else{
                $data = $this->repo->update($req, $request->id);
            }
            // dd($data);
            return response()->json(['data' => $data, 'success' => true]);
        } catch (\Exception $e) {
            dd($e);
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

    public function list($id)
    {
        $data = Subkomponen::where('komponen_id', $id)->get();
        return $data;
    }  
}
