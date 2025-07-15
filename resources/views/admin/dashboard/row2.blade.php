									<!--begin::Row-->
									<div class="row gx-5 gx-xl-10">
										<!--begin::Col-->
										<div class="col-xxl-6 mb-5 mb-xl-10">
											<!--begin::Chart widget 27-->
											<div class="card card-flush h-xl-100">
												<!--begin::Header-->
												<div class="card-header pt-7">
													<!--begin::Title-->
													<h3 class="card-title align-items-start flex-column">
														<span class="card-label fw-bold text-gray-900">Target Kegiatan per Bagian</span>
														<span class="text-gray-500 pt-2 fw-semibold fs-6">Statistics by Bagians</span>
													</h3>
													<!--end::Title-->
												</div>
												<!--end::Header-->
												<!--begin::Body-->
												<div class="card-body pt-0 pb-1">
													<div id="chart_per_bagian" class="min-h-auto"></div>
												</div>
												<!--end::Body-->
											</div>
											<!--end::Chart widget 27-->
										</div>
										<!--end::Col-->
										<!--begin::Col-->
										<div class="col-xl-6 mb-5 mb-xl-10">
											<!--begin::Table widget 10-->
											<div class="card card-flush h-xl-100">
												<!--begin::Header-->
												<div class="card-header pt-5">
													<!--begin::Title-->
													<h3 class="card-title align-items-start flex-column">
														<span class="card-label fw-bold text-gray-800">Target dan Realisasi Kegiatan perbulan</span>
														<span class="text-gray-500 pt-1 fw-semibold fs-6">Counted in Millions</span>
													</h3>
													<!--end::Title-->
													<!--begin::Toolbar-->
													<div class="card-toolbar">
														<a href="#" class="btn btn-sm btn-light">PDF Report</a>
													</div>
													<!--end::Toolbar-->
												</div>
												<!--end::Header-->
												<!--begin::Body-->
												<div class="card-body pt-0 pb-1">
													<div id="kt_amcharts_1" style="height: 400px;"></div>
												</div>
												<!--end::Body-->
											</div>
											<!--end::Table Widget 10-->
										</div>
										<!--end::Col-->
									</div>
									<!--end::Row-->

                  {{-- {{ json_encode($chartperbagian) }} --}}
                  @php
                      $data = json_decode($chartperbagian, true);
                      $bagian = array_column($data, 'nama');
                      $nilai = array_column($data, 'nilai');
                  @endphp
                  

@push('chartnya')
 
<script>

const data = @json($nilai);
const categories = @json($bagian);

var KTChartsPerbagian = (function () {
  var e = { self: null, rendered: !1 },
    t = function (e) {
      var t = document.getElementById("chart_per_bagian");
      if (t) {
        var a = KTUtil.getCssVariableValue("--bs-gray-800"),
          l = KTUtil.getCssVariableValue("--bs-border-dashed-color"),
          r = {
            series: [
              { name: "Jumlah Kegiatan", data: data },
            ],
            chart: {
              fontFamily: "inherit",
              type: "bar",
              height: 350,
              toolbar: { show: !1 },
            },
            plotOptions: {
              bar: {
                borderRadius: 8,
                horizontal: !0,
                distributed: !0,
                barHeight: 50,
                dataLabels: { position: "bottom" },
              },
            },
            dataLabels: {
              enabled: !0,
              textAnchor: "start",
              offsetX: 0,
              formatter: function (e, t) {
                e;
                return wNumb({ thousand: "," }).to(e);
              },
              style: { fontSize: "14px", fontWeight: "600", align: "left" },
            },
            legend: { show: !1 },
            colors: ["#3E97FF", "#F1416C", "#50CD89", "#FFC700", "#7239EA"],
            xaxis: {
              categories: categories,
              labels: {
                formatter: function (e) {
                  return e;
                },
                style: {
                  colors: a,
                  fontSize: "14px",
                  fontWeight: "600",
                  align: "left",
                },
              },
              axisBorder: { show: !1 },
            },
            yaxis: {
              labels: {
                formatter: function (e, t) {
                  return Number.isInteger(e)
                    ? e + " - " + parseInt((100 * e) / 18).toString() + "%"
                    : e;
                },
                style: { colors: a, fontSize: "14px", fontWeight: "600" },
                offsetY: 2,
                align: "left",
              },
            },
            grid: {
              borderColor: l,
              xaxis: { lines: { show: !0 } },
              yaxis: { lines: { show: !1 } },
              strokeDashArray: 4,
            },
            tooltip: {
              style: { fontSize: "12px" },
              y: {
                formatter: function (e) {
                  return e;
                },
              },
            },
          };
        (e.self = new ApexCharts(t, r)),
          setTimeout(function () {
            e.self.render(), (e.rendered = !0);
          }, 200);
      }
    };
  return {
    init: function () {
      t(e),
        KTThemeMode.on("kt.thememode.change", function () {
          e.rendered && e.self.destroy(), t(e);
        });
    },
  };
})();
"undefined" != typeof module && (module.exports = KTChartsPerbagian),
  KTUtil.onDOMContentLoaded(function () {
    KTChartsPerbagian.init();
  });
</script>

<script>
	am5.ready(function () {

    // Create root element
    // https://www.amcharts.com/docs/v5/getting-started/#Root_element
    var root = am5.Root.new("kt_amcharts_1");

    // Set themes
    // https://www.amcharts.com/docs/v5/concepts/themes/
    root.setThemes([
        am5themes_Animated.new(root)
    ]);

    // Create chart
    // https://www.amcharts.com/docs/v5/charts/xy-chart/
    var chart = root.container.children.push(am5xy.XYChart.new(root, {
        panX: false,
        panY: false,
        wheelX: "panX",
        wheelY: "zoomX",
        layout: root.verticalLayout,
		height: 400 
    }));

    // Add legend
    // https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
    var legend = chart.children.push(
        am5.Legend.new(root, {
            centerX: am5.p50,
            x: am5.p50
        })
    );

    var data = [{
                        year: "Januari",
                        rencana: 34,
                        realisasi: 5,
                    }, {
                        year: "Februari",
                        rencana: 26,
                        realisasi: 7,
                    }, {
                        year: "Maret",
                        rencana: 28,
                        realisasi: 9,
                    }, {
                        year: "Apil",
                        rencana: 78,
                        realisasi: 34,
                    }]

    // Create axes
    // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
    var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
        categoryField: "year",
        renderer: am5xy.AxisRendererX.new(root, {
            cellStartLocation: 0.1,
            cellEndLocation: 0.9
        }),
        tooltip: am5.Tooltip.new(root, {})
    }));

    xAxis.data.setAll(data);

    var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
        renderer: am5xy.AxisRendererY.new(root, {})
    }));

    // Add series
    // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
    function makeSeries(name, fieldName, color) {
        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: name,
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: fieldName,
            categoryXField: "year"
        }));

        series.columns.template.setAll({
            tooltipText: "{name}, {categoryX}:{valueY}",
            width: am5.percent(90),
            tooltipY: 0,
			fill: am5.color(color),
			stroke: am5.color(color) ,
			cornerRadiusTL: 5, // Radius sudut kiri atas
            cornerRadiusTR: 5, // Radius sudut kanan atas
            cornerRadiusBL: 0, // Radius sudut kiri bawah
            cornerRadiusBR: 0
        });

        series.data.setAll(data);

        // Make stuff animate on load
        // https://www.amcharts.com/docs/v5/concepts/animations/
        series.appear();

        series.bullets.push(function () {
            return am5.Bullet.new(root, {
                locationY: 0,
                sprite: am5.Label.new(root, {
                    text: "{valueY}",
                    fill: root.interfaceColors.get("alternativeText"),
                    centerY: 0,
                    centerX: am5.p50,
                    populateText: true
                })
            });
        });

        legend.data.push(series);
    }

    makeSeries("Rencana", "rencana", "#FF6B6B");
    makeSeries("Realisasi", "realisasi","#F1C40F");


    // Make stuff animate on load
    // https://www.amcharts.com/docs/v5/concepts/animations/
    chart.appear(1000, 100);

}); // end am5.ready()
</script>

@endpush