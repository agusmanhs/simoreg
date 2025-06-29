@extends('admin._layouts.index')

{{-- @push('Data Master')
    here show
@endpush --}}

@push($title)
    active
@endpush

@section('content')
    <!--begin::Toolbar-->
    @component('admin._card.breadcrumb')
        @slot('header')
            {{ $title }}
        @endslot
        @slot('page')
            Form
        @endslot
    @endcomponent
    <!--end::Toolbar-->

    <!--begin::Content-->
    <div id="kt_app_content" class="app-content flex-column-fluid">
        <!--begin::Content container-->
        <div id="kt_app_content_container" class="app-container container-xxl">

            <!--begin::Tables Widget 10-->
            <div class="card mb-5 mb-xl-8">

                <!--begin::Header-->
                <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                    <h3 class="card-title align-items-start flex-column">
                        <span class="card-label fw-bold fs-3 mb-1">Form {{ isset($data->id) ? 'Edit' : 'Input' }}</span>
                    </h3>
                </div>
                <!--end::Header-->

                <!--begin::Body-->
                <div class="card-body pt-3">

                    <div class="row mt-5">
                        <!--begin:Form-->
                        <form id="kt_modal_new_target_form" class="form" action="#">
                            <input name="_method" type="hidden" id="methodId"
                                value="{{ isset($data->id) ? 'PUT' : 'POST' }}">
                            <input type="hidden" name="id" id="formId" value="{{ $data->id ?? null }}">
                            @csrf

                            <!--begin::Input group-->
                            <div class="row g-9 mb-8">
                                <div class="col-md-12 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Nama Program</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a Program" name="program_id" id="program_id">
                                        <option value="">Select Program...</option>
                                        @foreach (Helper::getData('programs')->all() as $v)
                                            <option
                                                {{ isset($data->program_id) && $data->program_id == $v->id ? 'selected' : '' }}
                                                value="{{ $v->id }}">{{ $v->kode }} || {{ $v->nama }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-12 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Nama Kegiatan</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a Kegiatan" name="kegiatan_id" id="kegiatan_id">
                                        <option value="">Select Kegiatan...</option>
                                        {{-- @foreach (Helper::getData('kegiatans')->all() as $v)
                                            <option
                                                {{ isset($data->kegiatan_id) && $data->kegiatan_id == $v->id ? 'selected' : '' }}
                                                value="{{ $v->id }}">{{ $v->kode }} || {{ $v->nama }}
                                            </option>
                                        @endforeach --}}
                                    </select>
                                </div>
                                <div class="col-md-12 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Nama KRO</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a KRO" name="kro_id" id="kro_id">
                                        <option value="">Select KRO...</option>

                                    </select>
                                </div>
                                <div class="col-md-12 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Nama RO</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a RO" name="ro_id" id="ro_id">
                                        <option value="">Select RO...</option>

                                    </select>
                                </div>
                                <div class="col-md-12 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Nama Komponen</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a Komponen" name="komponen_id" id="komponen_id">
                                        <option value="">Select Komponen...</option>

                                    </select>
                                </div>
                                <div class="col-md-12 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Nama Sub Komponen</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a Sub Komponen" name="subkomponen_id" id="subkomponen_id">
                                        <option value="">Select Sub Komponen...</option>

                                    </select>
                                </div>
                                <div class="col-md-12 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Nama Kode Akun</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a Kode Akun" name="kodeakun_id" id="kodeakun_id">
                                        <option value="">Select Kode Akun...</option>

                                    </select>
                                </div>
                                <div class="col-md-12 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Nama Detail Uraian</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a Kode Akun" name="detailuraian_id" id="detailuraian_id">
                                        <option value="">Select Detail Uraian...</option>

                                    </select>
                                </div>

                                <div class="col-md-4 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Pagu</label>
                                    <input type="text" class="form-control" placeholder="Pagu" name="pagu"
                                        id="pagu" maxlength="20" value="{{ $data->pagu ?? '' }}" />
                                </div>
                                <div class="col-md-4 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Bulan Pelaksanaan</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select Bulan" name="bulan" id="bulan">
                                        <option value="{{ $data->bulan ?? '' }}">{{ $data->bulan ?? 'Select Bulan...' }}
                                        </option>
                                        <option value="1">Januari</option>
                                        <option value="2">Februari</option>
                                        <option value="3">Maret</option>
                                        <option value="4">April</option>
                                        <option value="5">Mei</option>
                                        <option value="6">Juni</option>
                                        <option value="7">Juli</option>
                                        <option value="8">Agustus</option>
                                        <option value="9">September</option>
                                        <option value="10">Oktober</option>
                                        <option value="11">November</option>
                                        <option value="12">Desember</option>
                                    </select>
                                </div>
                                <div class="col-md-4 fv-row">
                                    <label class="fs-6 fw-semibold mb-2">Pelaksana Kegiatan</label>
                                    <select class="form-select" data-control="select2" data-hide-search="true"
                                        data-placeholder="Select a Program" name="bagsubag_id" id="bagsubag_id">
                                        <option value="">Select Program...</option>
                                        @foreach (Helper::getData('bagsubags')->all() as $v)
                                            <option
                                                {{ isset($data->bagsubag_id) && $data->bagsubag_id == $v->id ? 'selected' : '' }}
                                                value="{{ $v->id }}">{{ $v->kode }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <!--end::Input group-->

                            <!--begin::Actions-->
                            <div class="d-flex justify-content-end">
                                <a href="{{ route($title . '.index') }}">
                                    <button type="button" id="kt_modal_new_target_cancel" class="btn btn-secondary me-3"
                                        data-bs-dismiss="modal">Batal</button>
                                </a>
                                @if (isset($data->id))
                                    <button type="submit" id="kt_modal_new_target_update" class="btn btn-primary">
                                        <span class="indicator-label">Update</span>
                                        <span class="indicator-progress">Please wait...
                                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                    </button>
                                @else
                                    <button type="submit" id="kt_modal_new_target_save" class="btn btn-primary">
                                        <span class="indicator-label">Simpan</span>
                                        <span class="indicator-progress">Please wait...
                                            <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>
                                    </button>
                                @endif
                            </div>
                            <!--end::Actions-->

                        </form>
                        <!--end:Form-->
                    </div>

                </div>
                <!--begin::Body-->
            </div>
            <!--end::Tables Widget 10-->

        </div>
        <!--end::Content container-->
    </div>
    <!--end::Content-->
@endsection

@push('jsScriptForm')
    <script type="text/javascript">
        // Define form element
        const form = document.getElementById('kt_modal_new_target_form');

        // Init form validation rules. For more info check the FormValidation plugin's official documentation:https://formvalidation.io/
        var validator = FormValidation.formValidation(
            form, {
                fields: {
                    'name': {
                        validators: {
                            notEmpty: {
                                message: 'Nama is required'
                            }
                        }
                    },
                    'code': {
                        validators: {
                            notEmpty: {
                                message: 'Kode is required'
                            }
                        }
                    },
                },

                plugins: {
                    trigger: new FormValidation.plugins.Trigger(),
                    bootstrap: new FormValidation.plugins.Bootstrap5({
                        rowSelector: '.fv-row',
                        eleInvalidClass: '',
                        eleValidClass: ''
                    })
                },

            }
        );

        $('#program_id').change(function() {
            var id_program = $(this).val();
            console.log(id_program);
            if (id_program) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('/kegiatan/list') }}/" + id_program,
                    success: function(result) {
                        $('#kegiatan_id').html('<option value="">-- Unit Kerja --</option>');
                        $.each(result, function(key, value) {
                            $("#kegiatan_id").append('<option value="' + value.id + '">' + value
                                .kode + ' || ' + value
                                .nama + '</option>');
                        });
                    }
                });
            } else {
                $("#kegiatan_id").empty();
            }
        });

        $('#kegiatan_id').change(function() {
            var id_kegiatan = $(this).val();
            console.log(id_kegiatan);
            if (id_kegiatan) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('/kro/list') }}/" + id_kegiatan,
                    success: function(result) {
                        $('#kro_id').html('<option value="">-- Unit Kerja --</option>');
                        $.each(result, function(key, value) {
                            $("#kro_id").append('<option value="' + value.id + '">' + value
                                .kode + ' || ' + value
                                .nama + '</option>');
                        });
                    }
                });
            } else {
                $("#kro_id").empty();
            }
        });

        $('#kro_id').change(function() {
            var id_kro = $(this).val();
            console.log(id_kro);
            if (id_kro) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('/ro/list') }}/" + id_kro,
                    success: function(result) {
                        $('#ro_id').html('<option value="">-- Unit Kerja --</option>');
                        $.each(result, function(key, value) {
                            $("#ro_id").append('<option value="' + value.id + '">' + value
                                .kode + ' || ' + value
                                .nama + '</option>');
                        });
                    }
                });
            } else {
                $("#ro_id").empty();
            }
        });

        $('#ro_id').change(function() {
            var id_ro = $(this).val();
            console.log(id_ro);
            if (id_ro) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('/komponen/list') }}/" + id_ro,
                    success: function(result) {
                        $('#komponen_id').html('<option value="">-- Unit Kerja --</option>');
                        $.each(result, function(key, value) {
                            $("#komponen_id").append('<option value="' + value.id + '">' + value
                                .kode + ' || ' + value
                                .nama + '</option>');
                        });
                    }
                });
            } else {
                $("#komponen_id").empty();
            }
        });

        $('#komponen_id').change(function() {
            var id_ro = $(this).val();
            console.log(id_ro);
            if (id_ro) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('sub-komponen/list') }}/" + id_ro,
                    success: function(result) {
                        $('#subkomponen_id').html('<option value="">-- Unit Kerja --</option>');
                        $.each(result, function(key, value) {
                            $("#subkomponen_id").append('<option value="' + value.id + '">' +
                                value
                                .kode + ' || ' + value
                                .nama + '</option>');
                        });
                    }
                });
            } else {
                $("#subkomponen_id").empty();
            }
        });

        $('#subkomponen_id').change(function() {
            var id_ro = $(this).val();
            console.log(id_ro);
            if (id_ro) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('kode-akun/list') }}/" + id_ro,
                    success: function(result) {
                        $('#kodeakun_id').html('<option value="">-- Unit Kerja --</option>');
                        $.each(result, function(key, value) {
                            $("#kodeakun_id").append('<option value="' + value.id + '">' +
                                value
                                .kode + ' || ' + value
                                .nama + '</option>');
                        });
                    }
                });
            } else {
                $("#kodeakun_id").empty();
            }
        });

        $('#kodeakun_id').change(function() {
            var id_ro = $(this).val();
            console.log(id_ro);
            if (id_ro) {
                $.ajax({
                    type: "GET",
                    url: "{{ url('detail-uraian/list') }}/" + id_ro,
                    success: function(result) {
                        $('#detailuraian_id').html('<option value="">-- Unit Kerja --</option>');
                        $.each(result, function(key, value) {
                            $("#detailuraian_id").append('<option value="' + value.id + '">' +
                                value
                                .nama + '</option>');
                        });
                    }
                });
            } else {
                $("#kodeakun_id").empty();
            }
        });


        // // proses save data
        // const submitButton = document.getElementById('kt_modal_new_target_save');
        // submitButton.addEventListener('click', function(e) {
        //     // Prevent default button action
        //     e.preventDefault();

        //     // Validate form before submit
        //     if (validator) {
        //         validator.validate().then(function(status) {
        //             if (status == 'Valid') {
        //                 // Show loading indication
        //                 submitButton.setAttribute('data-kt-indicator', 'on');
        //                 submitButton.disabled = true;
        //                 let formData = new FormData(kt_modal_new_target_form);

        //                 $.ajax({
        //                     headers: {
        //                         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr(
        //                             'content')
        //                     },
        //                     data: formData,
        //                     url: "{{ route($title . '.store') }}",
        //                     type: "POST",
        //                     dataType: 'json',
        //                     processData: false,
        //                     contentType: false,
        //                     success: function(data) {
        //                         submitButton.removeAttribute('data-kt-indicator');
        //                         submitButton.disabled = false;
        //                         toastr.success("Successful save data!");
        //                         setTimeout(() => {
        //                             window.location.replace(
        //                                 "{{ route($title . '.index') }}"
        //                             );
        //                         }, 750);
        //                     },
        //                     error: function(data) {
        //                         submitButton.removeAttribute('data-kt-indicator');
        //                         submitButton.disabled = false;
        //                         console.log('Error:', data);
        //                         toastr.error("Failed to save data!");
        //                     }
        //                 });
        //             }
        //         });
        //     }
        // });
    </script>

    @if (isset($data->id))
        @include('admin._card._updateAjax')
    @else
        @include('admin._card._createAjax')
    @endif

@endpush
