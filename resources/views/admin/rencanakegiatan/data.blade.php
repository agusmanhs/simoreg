
@foreach ($data as $key => $v)
    <tr class="text-start text-gray-600 fs-7">
        <td>
            <span class="fw-semibold">
                {{ ++$i }}
            </span>
        </td>
        <td class="pe-0">
            <span class="fw-semibold">
                {{ $v->detailuraian->nama }}
            </span>
        </td>
        <td class="pe-0">
            <span class="fw-semibold">
                Rp. {{ number_format($v->detailuraian->pagu) }}
            </span>
        </td>
        <td>
            <span class="fw-semibold">
                {{ Helper::getBulan($v->bulan) }}
            </span>
        </td>
        <td>
            <span class="fw-semibold">
                {{ $v->bagsubag->kode }}
            </span>
        </td>
        <td>
            <span class="fw-semibold btn me-3" data-bs-toggle="modal" data-bs-target="#update_realisasi{{ $v->id }}" >
                @if ($v->tgl_realisasi)
                    <div class="badge badge-light-success">{{ $v->tgl_realisasi }}</div>
                @else
                    <div class="badge badge-light-danger">Belum Terealisasi</div>
                @endif
            </span>
<!--begin::Modal - Adjust Balance-->
									<div class="modal fade" id="update_realisasi{{ $v->id }}" tabindex="-1" aria-hidden="true">
										<!--begin::Modal dialog-->
										<div class="modal-dialog modal-dialog-centered mw-650px">
											<!--begin::Modal content-->
											<div class="modal-content">
												<!--begin::Modal header-->
												<div class="modal-header">
													<!--begin::Modal title-->
													<h2 class="fw-bold">Input Pelaksaan Kegiatan {{ $v->id }}</h2>
													<!--end::Modal title-->
													<!--begin::Close-->
													<div id="kt_customers_export_close" class="btn btn-icon btn-sm btn-active-icon-primary">
														<i class="ki-duotone ki-cross fs-1">
															<span class="path1"></span>
															<span class="path2"></span>
														</i>
													</div>
													<!--end::Close-->
												</div>
												<!--end::Modal header-->
												<!--begin::Modal body-->
												<div class="modal-body scroll-y mx-5 mx-xl-15 my-7">
													<!--begin::Form-->
													<form id="kt_modal_new_target_form" class="form" action="{{ route('rencanakegiatan.update', $v->id) }}" method="POST"> 
                                                        @csrf
                                                        @method('PUT')
														<!--begin::Input group-->
                                                        <input type="hidden" value="{{ $v->id }}" name="id" id="formId">
														<div class="fv-row mb-10">
															<label for="" class="form-label">Tanggal Pelaksanaan</label>
                                                            <input class="form-control tgl_realisasi" placeholder="Pick a date" id="tgl_realisasi" name="tgl_realisasi" value="{{ $v->tgl_realisasi ?? '' }}"/>
														</div>
														<div class="fv-row mb-10">
															<label class="form-label">Biaya Kegiatan</label>
                                                            <input type="text" class="form-control" placeholder="Biaya Kegiatan" name="biaya" id="biaya" maxlength="20" value="{{ $v->biaya ?? '' }}" />
														</div>
														<!--end::Input group-->
														<!--begin::Input group-->
														<div class="fv-row mb-10">
															<label for="" class="form-label">Catatan</label>
                                                            <textarea class="form-control" data-kt-autosize="true" id="catatan" name="catatan">{{ $v->catatan ?? '' }}</textarea>
														</div>
														<!--end::Input group-->
														<!--begin::Actions-->
														<div class="text-center">
															<button type="reset" id="kt_customers_export_cancel" class="btn btn-light me-3">Discard</button>
															<button type="submit" id="kt_modal_new_target_update" class="btn btn-primary">
																<span class="indicator-label">Submit</span>
																<span class="indicator-progress">Please wait... 
																<span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
															</button>
														</div>
														<!--end::Actions-->
													</form>
													<!--end::Form-->
												</div>
												<!--end::Modal body-->
											</div>
											<!--end::Modal content-->
										</div>
										<!--end::Modal dialog-->
									</div>
									<!--end::Modal - New Card-->
            
        </td>

        <td class="text-end">
            {!! Helper::btnAction($v->id, 'rencana-kegiatan') !!}
            {{-- <a href="#" class="btn btn-sm btn-light btn-flex btn-center btn-active-light-primary"
                data-kt-menu-trigger="click" data-kt-menu-placement="bottom-end">Actions
                <i class="ki-duotone ki-down fs-5 ms-1"></i></a>
            <!--begin::Menu-->
            <div class="menu menu-sub menu-sub-dropdown menu-column menu-rounded menu-gray-600 menu-state-bg-light-primary fw-semibold fs-7 w-125px py-4"
                data-kt-menu="true">
                <!--begin::Menu item-->
                <div class="menu-item px-3">
                    <a href="1/edit" class="menu-link px-3">Edit</a>
                </div>
                <!--end::Menu item-->
                <!--begin::Menu item-->
                <div class="menu-item px-3">
                    <a href="#" class="menu-link px-3" data-kt-ecommerce-product-filter="delete_row">Delete</a>
                </div>
                <!--end::Menu item-->
            </div> --}}
            <!--end::Menu-->
        </td>
        
    </tr>

    

@endforeach

    <script>
        $(".tgl_realisasi").flatpickr();
    </script>