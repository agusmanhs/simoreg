									<div class="row gx-5 gx-xl-10">
										<!--begin::Col-->
										<div class="col-xxl-6 mb-5 mb-xl-10">
											<!--begin::List widget 12-->
											<div class="card card-flush h-xl-100">
												<!--begin::Header-->
												<div class="card-header pt-7">
													<!--begin::Title-->
													<h3 class="card-title align-items-start flex-column">
														<span class="card-label fw-bold text-gray-800">Anggaran per Bagian</span>
														<span class="text-gray-500 mt-1 fw-semibold fs-6">29.4k visitors</span>
													</h3>
													<!--end::Title-->
												</div>
												<!--end::Header-->
												<!--begin::Body-->
												<div class="card-body d-flex align-items-end">
													<!--begin::Wrapper-->
													<div class="w-100">
														<!--begin::Item-->

                                                        @foreach ($perbagian as $i)                                          
                                                            <div class="d-flex align-items-center">
                                                                <!--begin::Symbol-->
                                                                <div class="symbol symbol-30px me-5">
                                                                    <span class="symbol-label">
                                                                        <i class="ki-duotone ki-rocket fs-3 text-gray-600">
                                                                            <span class="path1"></span>
                                                                            <span class="path2"></span>
                                                                        </i>
                                                                    </span>
                                                                </div>
                                                                <!--end::Symbol-->
                                                                <!--begin::Container-->
                                                                <div class="d-flex align-items-center flex-stack flex-wrap d-grid gap-1 flex-row-fluid">
                                                                    <!--begin::Content-->
                                                                    <div class="me-5">
                                                                        <!--begin::Title-->
                                                                        <a href="#" class="text-gray-800 fw-bold text-hover-primary fs-6">{{ $i->kode }}</a>
                                                                        <!--end::Title-->
                                                                        <!--begin::Desc-->
                                                                        <span class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Direct link clicks</span>
                                                                        <!--end::Desc-->
                                                                    </div>
                                                                    <!--end::Content-->
                                                                    <!--begin::Wrapper-->
                                                                    <div class="d-flex align-items-center">
                                                                        <!--begin::Number-->
                                                                        <span class="text-gray-800 fw-bold fs-4 me-3">{{ number_format($i->nilai) }}</span>
                                                                        <!--end::Number-->
                                                                        <!--begin::Info-->
                                                                        <!--begin::label-->
                                                                        <span class="badge badge-light-success fs-base">
                                                                        {{-- <i class="ki-duotone ki-arrow-up fs-5 text-success ms-n1">
                                                                            <span class="path1"></span>
                                                                            <span class="path2"></span>
                                                                        </i>100.00% --}}
                                                                      </span>
                                                                        <!--end::label-->
                                                                        <!--end::Info-->
                                                                    </div>
                                                                    <!--end::Wrapper-->
                                                                </div>
                                                                <!--end::Container-->
                                                            </div>
                                                            
                                                            <!--end::Item-->
                                                            <!--begin::Separator-->
                                                            <div class="separator separator-dashed my-3"></div>
                                                            <!--end::Separator-->
                                                            @endforeach

													</div>
													<!--end::Wrapper-->
												</div>
												<!--end::Body-->
											</div>
											<!--end::List widget 12-->
										</div>
										<!--end::Col-->
										<!--begin::Col-->
										<div class="col-xxl-6 mb-5 mb-xl-10">
											<!--begin::List widget 12-->
											<div class="card card-flush h-xl-100">
												<!--begin::Header-->
												<div class="card-header pt-7">
													<!--begin::Title-->
													<h3 class="card-title align-items-start flex-column">
														<span class="card-label fw-bold text-gray-800">Realisasi Anggaran per Bagian</span>
														<span class="text-gray-500 mt-1 fw-semibold fs-6">29.4k visitors</span>
													</h3>
													<!--end::Title-->
												</div>
												<!--end::Header-->
												<!--begin::Body-->
												<div class="card-body d-flex align-items-end">
													<!--begin::Wrapper-->
													<div class="w-100">
														<!--begin::Item-->

                                                        @foreach ($perbagianreal as $i)                                          
                                                            <div class="d-flex align-items-center">
                                                                <!--begin::Symbol-->
                                                                <div class="symbol symbol-30px me-5">
                                                                    <span class="symbol-label">
                                                                        <i class="ki-duotone ki-rocket fs-3 text-gray-600">
                                                                            <span class="path1"></span>
                                                                            <span class="path2"></span>
                                                                        </i>
                                                                    </span>
                                                                </div>
                                                                <!--end::Symbol-->
                                                                <!--begin::Container-->
                                                                <div class="d-flex align-items-center flex-stack flex-wrap d-grid gap-1 flex-row-fluid">
                                                                    <!--begin::Content-->
                                                                    <div class="me-5">
                                                                        <!--begin::Title-->
                                                                        <a href="#" class="text-gray-800 fw-bold text-hover-primary fs-6">{{ $i->kode }}</a>
                                                                        <!--end::Title-->
                                                                        <!--begin::Desc-->
                                                                        <span class="text-gray-500 fw-semibold fs-7 d-block text-start ps-0">Direct link clicks</span>
                                                                        <!--end::Desc-->
                                                                    </div>
                                                                    <!--end::Content-->
                                                                    <!--begin::Wrapper-->
                                                                    <div class="d-flex align-items-center">
                                                                        <!--begin::Number-->
                                                                        <span class="text-gray-800 fw-bold fs-4 me-3">{{ number_format($i->nilai) }}</span>
                                                                        <!--end::Number-->
                                                                        <!--begin::Info-->
                                                                        <!--begin::label-->
                                                                        <span class="badge badge-light-success fs-base">
                                                                        {{-- <i class="ki-duotone ki-arrow-up fs-5 text-success ms-n1">
                                                                            <span class="path1"></span>
                                                                            <span class="path2"></span>
                                                                        </i>100.00% --}}
                                                                      </span>
                                                                        <!--end::label-->
                                                                        <!--end::Info-->
                                                                    </div>
                                                                    <!--end::Wrapper-->
                                                                </div>
                                                                <!--end::Container-->
                                                            </div>
                                                            
                                                            <!--end::Item-->
                                                            <!--begin::Separator-->
                                                            <div class="separator separator-dashed my-3"></div>
                                                            <!--end::Separator-->
                                                            @endforeach

													</div>
													<!--end::Wrapper-->
												</div>
												<!--end::Body-->
											</div>
											<!--end::List widget 12-->
										</div>
										<!--end::Col-->
									</div>

@push('chartnya')
	
	
@endpush
