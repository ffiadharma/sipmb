<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2"><?php echo !empty($title) ? $title : null ?></h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="pendaftar"></div>
        </div>
    </div>
</main>
<script>
getGrafikPie('pendaftar', <?= $grafik3 ?>, 'Grafik Pendaftar Berdasarkan Tingkat Prestasi');

function getGrafikPie(selector, data, title) {
    var nasional = 570;
    var internasional = 115;

    Highcharts.chart(selector, {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: title
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.jumlah:.1f}</b>'
        },
        accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            name: 'Jumlah Pendaftar',
            colorByPoint: true,
            data: [{
                name: 'Nasional',
                jumlah: nasional,
                y: Math.floor(Math.random() * 30) + 1,
            }, {
                name: 'Internasional',
                jumlah: internasional,
                y: Math.floor(Math.random() * 30) + 1,
            }],
        }]
    });
}
</script>