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
                                                                        <i class="ki-duotone ki-arrow-up fs-5 text-success ms-n1">
                                                                            <span class="path1"></span>
                                                                            <span class="path2"></span>
                                                                        </i>2.6%</span>
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
										<div class="col-xl-6 mb-5 mb-xl-10">
											<!--begin::Chart widget 15-->
											<div class="card card-flush h-xl-100">
												<!--begin::Header-->
												<div class="card-header pt-7">
													<!--begin::Title-->
													<h3 class="card-title align-items-start flex-column">
														<span class="card-label fw-bold text-gray-900">Realisasi Anggaran per Bagian</span>
														<span class="text-gray-500 pt-2 fw-semibold fs-6">Statistics by Mounths</span>
													</h3>
													<!--end::Title-->
												</div>
												<!--end::Header-->
												<!--begin::Body-->
												<div class="card-body pt-5">
													<!--begin::Chart container-->
													<div id="chart_per_bulan" class="min-h-auto ps-4 pe-6 mb-3 h-300px"></div>
													<!--end::Chart container-->
												</div>
												<!--end::Body-->
											</div>
											<!--end::Chart widget 15-->
										</div>
										<!--end::Col-->
									</div>

@push('chartnya')
	
	<script>
		const rawdata = {!! json_encode($chartperbulan, JSON_UNESCAPED_SLASHES) !!};
		const datachart = rawdata.map(item => ({
			country : item.country,
			visits : item.visits,
			visit : 50,
			columnSettings : {
				fill : am5.color(
					KTUtil.getCssVariableValue(item.warna)
				)
			} 
		})

		);
		console.log(datachart)
    
	var KTChartsPerBulan = {
                init: function () {
    !(function () {
      if ("undefined" != typeof am5) {
        var e = document.getElementById("chart_per_bulan");
        if (e) {
          var t,
            a = function () {
              (t = am5.Root.new(e)).setThemes([am5themes_Animated.new(t)]);
              var a = t.container.children.push(
                  am5xy.XYChart.new(t, {
                    panX: !1,
                    panY: !1,
                    layout: t.verticalLayout,
                  })
                ),
                l =
                  (a.get("colors"),
                  datachart),
                r = a.xAxes.push(
                  am5xy.CategoryAxis.new(t, {
                    categoryField: "country",
                    renderer: am5xy.AxisRendererX.new(t, {
                      minGridDistance: 30,
                    }),
                    bullet: function (e, t, a) {
                      return am5xy.AxisBullet.new(e, {
                        location: 0.5,
                        sprite: am5.Picture.new(e, {
                          width: 24,
                          height: 24,
                          centerY: am5.p50,
                          centerX: am5.p50,
                          src: a.dataContext.icon,
                        }),
                      });
                    },
                  })
                );
              r
                .get("renderer")
                .labels.template.setAll({
                  paddingTop: 20,
                  fontWeight: "400",
                  fontSize: 10,
                  fill: am5.color(KTUtil.getCssVariableValue("--bs-gray-500")),
                }),
                r
                  .get("renderer")
                  .grid.template.setAll({ disabled: !0, strokeOpacity: 0 }),
                r.data.setAll(l);
              var o = a.yAxes.push(
                am5xy.ValueAxis.new(t, {
                  renderer: am5xy.AxisRendererY.new(t, {}),
                })
              );
              o
                .get("renderer")
                .grid.template.setAll({
                  stroke: am5.color(
                    KTUtil.getCssVariableValue("--bs-gray-300")
                  ),
                  strokeWidth: 1,
                  strokeOpacity: 1,
                  strokeDasharray: [3],
                }),
                o
                  .get("renderer")
                  .labels.template.setAll({
                    fontWeight: "400",
                    fontSize: 10,
                    fill: am5.color(
                      KTUtil.getCssVariableValue("--bs-gray-500")
                    ),
                  });
              var i = a.series.push(
                am5xy.ColumnSeries.new(t,{
                  xAxis: r,
                  yAxis: o,
                  valueYField: "visits",
                  categoryXField: "country",
                })
              );
              i.columns.template.setAll({
                tooltipText: "{categoryX}: {valueY}",
                tooltipY: 0,
                strokeOpacity: 0,
                templateField: "columnSettings",
              }),
                i.columns.template.setAll({
                  strokeOpacity: 0,
                  cornerRadiusBR: 0,
                  cornerRadiusTR: 6,
                  cornerRadiusBL: 0,
                  cornerRadiusTL: 6,
                }),
                i.data.setAll(l),
                i.appear(),
                a.appear(1e3, 100);
            };
          am5.ready(function () {
            a();
          }),
            KTThemeMode.on("kt.thememode.change", function () {
              t.dispose(), a();
            });
        }
      }
    })();
  },
};
"undefined" != typeof module && (module.exports = KTChartsPerBulan),
  KTUtil.onDOMContentLoaded(function () {
    KTChartsPerBulan.init();
  });
        </script>
@endpush
