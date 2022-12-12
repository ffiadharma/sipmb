<!-- <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
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
getGrafikPie('pendaftar', <?= $grafik3 ?>, 'Grafik Pendaftar Berdasarkan Status Pembayaran');

function getGrafikPie(selector, data, title) {
    var bayar = 667;
    var belum = 333;

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
                name: 'bayar',
                jumlah: bayar,
                y: Math.floor(Math.random() * 30) + 1,
            }, {
                name: 'belum',
                jumlah: belum,
                y: Math.floor(Math.random() * 30) + 1,
            }],
        }]
    });
}
</script> -->

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
getGrafikPie('pendaftar', <?= $grafik6 ?>, 'Grafik Pendaftar Berdasarkan Status Pembayaran');

function getGrafikPie(selector, data, title) {
    var bayar = 667;
    var belum = 333;

    Highcharts.chart(selector, {
        chart: {
            type: 'column'
        },
        title: {
            text: title
        },
        xAxis: {
            categories: ['BCA', 'Mandiri', 'BRI', 'BNI']
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Sudah Bayar',
            data: [148, 117, 154, 148]
        }, {
            name: 'Belum Bayar',
            data: [25, 25, 19, 18]
        }]
    });


    // Highcharts.chart('container', {
    //     chart: {
    //         type: 'column'
    //     },
    //     title: {
    //         text: 'Grafik Pendaftar Berdasarkan Status Pembayaran',
    //         align: 'left'
    //     },
    //     xAxis: {
    //         categories: ['BCA', 'MANDIRI', 'BNI', 'BRI']
    //     },
    //     yAxis: {
    //         min: 0,
    //         title: {
    //             text: 'Jumlah Pendaftar'
    //         },
    //         stackLabels: {
    //             enabled: true,
    //             style: {
    //                 fontWeight: 'bold',
    //                 color: ( // theme
    //                     Highcharts.defaultOptions.title.style &&
    //                     Highcharts.defaultOptions.title.style.color
    //                 ) || 'gray',
    //                 textOutline: 'none'
    //             }
    //         }
    //     },
    //     legend: {
    //         align: 'left',
    //         x: 70,
    //         verticalAlign: 'top',
    //         y: 70,
    //         floating: true,
    //         backgroundColor: Highcharts.defaultOptions.legend.backgroundColor || 'white',
    //         borderColor: '#CCC',
    //         borderWidth: 1,
    //         shadow: false
    //     },
    //     tooltip: {
    //         headerFormat: '<b>{point.x}</b><br/>',
    //         pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
    //     },
    //     plotOptions: {
    //         column: {
    //             stacking: 'normal',
    //             dataLabels: {
    //                 enabled: true
    //             }
    //         }
    //     },
    //     series: [{
    //         name: 'Sudah Bayar',
    //         data: [148, 117, 154, 148],
    //         y: Math.floor(Math.random() * 30) + 1
    //     }, {
    //         name: 'Belum Bayar',
    //         data: [25, 25, 19, 18],
    //         y: Math.floor(Math.random() * 30) + 1,
    //     }]
    // });
}
</script>