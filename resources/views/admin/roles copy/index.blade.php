@extends('admin._layouts.index')

@push('cssScript')
    @include('admin._layouts.partial._css')
@endpush

{{-- @push('Data Master')
    here show
@endpush --}}

@push($title)
    active
@endpush

@section('content')
    <!--begin::Toolbar-->
    <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
        <!--begin::Toolbar container-->
        <div id="kt_app_toolbar_container" class="app-container container-xxl d-flex flex-stack">
            <!--begin::Page title-->
            <div class="page-title d-flex flex-column justify-content-center flex-wrap me-3">
                <!--begin::Title-->
                <h1 class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0">
                    {{ Helper::head($title) }}
                </h1>
                <!--end::Title-->
                <!--begin::Breadcrumb-->
                <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1">
                    <!--begin::Item-->
                    <li class="breadcrumb-item text-muted">
                        <a href="{{ url('admin') }}" class="text-muted text-hover-primary">Dashboard</a>
                    </li>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <li class="breadcrumb-item text-muted">{{ Helper::head($title) }}</li>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-400 w-5px h-2px"></span>
                    </li>
                    <!--end::Item-->
                    <!--begin::Item-->
                    <li class="breadcrumb-item text-muted">Data</li>
                    <!--end::Item-->
                </ul>
                <!--end::Breadcrumb-->
            </div>
            <!--end::Page title-->
        </div>
        <!--end::Toolbar container-->
    </div>
    <!--end::Toolbar-->



    <!--begin::Content-->
    <div id="kt_app_content" class="app-content flex-column-fluid">
        <!--begin::Content container-->
        <div id="kt_app_content_container" class="app-container container-xxl">
            <!--begin::Products-->
            <div class="card card-flush">

                <!--begin::Card header-->
                <div class="card-header align-items-center py-5 gap-2 gap-md-5">
                    <!--begin::Card title-->
                    <div class="card-title">
                        <!--begin::Search-->
                        {{-- <div class="d-flex align-items-center position-relative my-1">
                            <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-4">
                                <span class="path1"></span>
                                <span class="path2"></span>
                            </i>
                            <input type="text" data-kt-ecommerce-product-filter="search"
                                class="form-control form-control-solid w-250px ps-12" placeholder="Search Product" />
                        </div> --}}
                        <div class="d-flex">
                            <input id="input_search" type="text" class="form-control me-3 flex-grow-1 w-250px"
                                placeholder="Search" />

                            <button id="button_search" class="btn btn-secondary fw-bold flex-shrink-0 me-3">Search</button>

                            <button id="button_refresh" class="btn btn-secondary">
                                <span class="btn-label">
                                    <i class="fa fa-sync"></i>
                                </span>
                            </button>

                        </div>
                        <!--end::Search-->
                    </div>
                    <!--end::Card title-->
                    <!--begin::Card toolbar-->
                    <div class="card-toolbar flex-row-fluid justify-content-end gap-5">
                        <div class="w-100 mw-150px">
                            <!--begin::Select2-->
                            <select class="form-select form-select-solid" data-control="select2" data-hide-search="true"
                                data-placeholder="Status" data-kt-ecommerce-product-filter="status">
                                <option></option>
                                <option value="all">All</option>
                                <option value="published">Published</option>
                                <option value="scheduled">Scheduled</option>
                                <option value="inactive">Inactive</option>
                            </select>
                            <!--end::Select2-->
                        </div>
                        <!--begin::Add product-->
                        <a href="apps/ecommerce/catalog/add-product.html" class="btn btn-success">Add Product</a>
                        <!--end::Add product-->
                    </div>
                    <!--end::Card toolbar-->
                </div>
                <!--end::Card header-->

                <!--begin::Card body-->
                <div class="card-body pt-0">
                    <!--begin::Table-->
                    <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_ecommerce_products_table">
                        <thead>
                            <tr class="text-start text-gray-500 fw-bold fs-7 text-uppercase gs-0">
                                <th class="min-w-20px pe-2">
                                    No
                                </th>
                                <th class="min-w-200px">
                                    Nama
                                </th>
                                <th class="text-end min-w-100px">
                                    Level
                                </th>
                                <th class="text-end min-w-70px">
                                    Actions
                                </th>
                            </tr>
                        </thead>

                        <tbody class="fw-semibold text-gray-600 datatables">
                        </tbody>

                    </table>
                    <!--end::Table-->

                    <!--begin::Pagination-->
                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                        <div class="d-flex flex-wrap py-2 mr-3">
                            <div class="text-center pagination">
                                <div id="contentPage"></div>
                            </div>
                        </div>
                        <div class="d-flex align-items-center py-3">
                            <ul class="pagination twbs-pagination">
                            </ul>
                        </div>
                    </div>
                    <!--end::Pagination-->

                </div>



                <!--end::Card body-->
            </div>
            <!--end::Products-->
        </div>
        <!--end::Content container-->
    </div>
    <!--end::Content-->
@endsection

@push('jsScript')
    @include('admin._layouts.partial._js')
    <script type="text/javascript">
        $(document).ready(function() {
            loadpage(5, '');
            var $pagination = $('.twbs-pagination');
            var defaultOpts = {
                totalPages: 1,
                prev: '&#8672;',
                next: '&#8674;',
                first: '&#8676;',
                last: '&#8677;',
            };
            $pagination.twbsPagination(defaultOpts);

            function loaddata(page, per_page, search) {
                $.ajax({
                    url: '{{ route($title . '.data') }}',
                    data: {
                        "page": page,
                        "per_page": per_page,
                        "search": search,
                    },
                    type: "GET",
                    datatype: "json",
                    success: function(data) {
                        $(".datatables").html(data.html);
                    }
                });
            }

            function loadpage(per_page, search) {
                $.ajax({
                    url: '{{ route($title . '.data') }}',
                    data: {
                        "per_page": per_page,
                        "search": search,
                    },
                    type: "GET",
                    datatype: "json",
                    success: function(response) {
                        if ($pagination.data("twbs-pagination")) {
                            $pagination.twbsPagination('destroy');
                            $(".datatables").html('<tr><td colspan="4">Data not found</td></tr>');
                        }
                        $pagination.twbsPagination($.extend({}, defaultOpts, {
                            startPage: 1,
                            totalPages: response.total_page,
                            visiblePages: 8,
                            prev: '&#8672;',
                            next: '&#8674;',
                            first: '&#8676;',
                            last: '&#8677;',
                            onPageClick: function(event, page) {
                                if (page == 1) {
                                    var to = 1;
                                } else {
                                    var to = page * per_page - (per_page - 1);
                                }
                                if (page == response.total_page) {
                                    var end = response.total_data;
                                } else {
                                    var end = page * per_page;
                                }
                                $('#contentPage').text('Showing ' + to + ' to ' + end +
                                    ' of ' +
                                    response.total_data + ' entries');
                                loaddata(page, per_page, search);
                            }
                        }));
                    }
                });
            }

            $("#button_search, #perPage").on('click change', function(event) {
                let search = $('#input_search').val();
                let per_page = $('#perPage').val();
                loadpage(per_page, search);
            });

            $("#button_refresh").on('click', function(event) {
                $('#input_search').val('');
                loadpage(5, '');
            });


            // // proses save data
            // const submitButton = document.getElementById('kt_modal_new_target_save');
            // submitButton.addEventListener('click', function(e) {
            //     // alert('testing');
            //     // Prevent default button action
            //     e.preventDefault();

            //     // Validate form before submit
            //     if (validator) {
            //         validator.validate().then(function(status) {
            //             console.log('validated!');

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
            //                         $('#kt_modal_new_target_form').trigger("reset");
            //                         $('#kt_modal_new_target').modal('hide');
            //                         loadpage('', 5);
            //                         toastr.success("Successful save data!");
            //                     },
            //                     error: function(data) {
            //                         submitButton.removeAttribute('data-kt-indicator');
            //                         submitButton.disabled = false;
            //                         console.log('Error:', data);
            //                         $('#kt_modal_new_target_form').trigger("reset");
            //                         $('#kt_modal_new_target').modal('hide');
            //                         toastr.error("Failed to save data!");
            //                     }
            //                 });
            //             }
            //         });
            //     }
            // });

            // // proses update data
            // const submitButtonUpdate = document.getElementById('kt_modal_new_target_update');
            // submitButtonUpdate.addEventListener('click', function(e) {
            //     // Prevent default button action
            //     e.preventDefault();

            //     // Validate form before submit
            //     if (validator) {
            //         validator.validate().then(function(status) {
            //             console.log('validated!');

            //             if (status == 'Valid') {
            //                 // Show loading indication
            //                 submitButtonUpdate.setAttribute('data-kt-indicator', 'on');
            //                 submitButtonUpdate.disabled = true;
            //                 let formData = new FormData(kt_modal_new_target_form);
            //                 let id = $('#formId').val();
            //                 $.ajax({
            //                     headers: {
            //                         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr(
            //                             'content')
            //                     },
            //                     data: formData,
            //                     url: '{{ url("admin/$title") }}/' + id,
            //                     type: "POST",
            //                     dataType: 'json',
            //                     processData: false,
            //                     contentType: false,
            //                     success: function(data) {
            //                         submitButtonUpdate.removeAttribute(
            //                             'data-kt-indicator');
            //                         submitButtonUpdate.disabled = false;
            //                         $('#kt_modal_new_target_form').trigger("reset");
            //                         $('#kt_modal_new_target').modal('hide');
            //                         loadpage('', 5);
            //                         toastr.success("Successful update data!");
            //                     },
            //                     error: function(data) {
            //                         submitButtonUpdate.removeAttribute(
            //                             'data-kt-indicator');
            //                         submitButtonUpdate.disabled = false;
            //                         console.log('Error:', data);
            //                         $('#kt_modal_new_target_form').trigger("reset");
            //                         $('#kt_modal_new_target').modal('hide');
            //                         toastr.error("Failed to update data!");
            //                     }
            //                 });
            //             }
            //         });
            //     }
            // });

            // // proses delete data
            // $('body').on('click', '.deleteData', function() {
            //     var id = $(this).data("id");
            //     Swal.fire({
            //         title: "Are you sure to Delete?",
            //         icon: "question",
            //         showCancelButton: true,
            //         confirmButtonText: "Yes, delete it!"
            //     }).then(function(result) {
            //         if (result.value) {
            //             $.ajax({
            //                 headers: {
            //                     'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            //                 },
            //                 type: "DELETE",
            //                 url: '{{ url("admin/$title") }}/' + id,
            //                 success: function(data) {
            //                     loadpage('', 5);
            //                     toastr.success("Successful delete data!");
            //                 },
            //                 error: function(data) {
            //                     toastr.error("Failed delete data!");
            //                 }
            //             });
            //         }
            //     });
            // });


        });
    </script>
@endpush
