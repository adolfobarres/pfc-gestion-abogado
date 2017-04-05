<div class="panel panel-warning">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-money" aria-hidden="true"></i> <g:message code="facturacion.mensual"/> <g:formatDate format="yyyy" date="${new Date()}"/></h3>
    </div>
    <div class="panel-body">
        <div id="grafica-fact" style="height: 200px;"></div>
    </div>
</div>


<script>
    Highcharts.chart('grafica-fact', {
        chart: {
            type: 'column'
        },
        title: {
            text: ''
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: '€'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
        },
        series: [{
            name: 'Population',
            data: [
                ['Enero', 23.7],
                ['Febrero', 16.1],
                ['Marzo', 14.2],
                ['Abril', 14.0],
                ['Mayo', 0],
                ['Junio', 0],
                ['Julio', 0],
                ['Agosto', 0],
                ['Septiembre', 0],
                ['Octubre', 0],
                ['Noviembre', 0],
                ['Diciembre', 0],
            ],
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                format: '{point.y:.1f}', // one decimal
                y: 10, // 10 pixels down from the top
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }]
    });
</script>