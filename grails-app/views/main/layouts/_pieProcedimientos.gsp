<div class="panel panel-success">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-gavel" aria-hidden="true"></i> <g:message code="tipos.procedimiento.alta"/></h3>
    </div>
    <div class="panel-body">
        <div id="grafica" style="height: 200px;"></div>
    </div>
</div>


<script>
$(document).ready(function () {

    // Build the chart
    Highcharts.chart('grafica', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: ''
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'Arendamiento',
                y: 24.03
            }, {
                name: 'Diligencias previas',
                y: 10.38
            }, {
                name: 'Medidas cautelares',
                y: 4.77
            }]
        }]
    });
});
</script>