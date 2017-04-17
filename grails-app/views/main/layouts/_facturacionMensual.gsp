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
                fontSize: '9px',
                fontFamily: 'Verdana, sans-serif'
            }
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: '€ facturados mes'
        }
    },
    legend: {
        enabled: false
    },
    tooltip: {
        pointFormat: '{point.y:.1f} €</b>'
    },
    series: [{
        name: 'Population',
        data: <g:include action="datosGraficaFacturacionMensualAnno" controller="main"/>,
        dataLabels: {
            enabled: true,
            rotation: -90,
            color: '#FFFFFF',
            align: 'right',
            //format: '{point.y}', // one decimal
            y: 10, // 10 pixels down from the top
            style: {
                fontSize: '12px'
                //fontFamily: 'Verdana, sans-serif'
            }
        }
    }]
});
</script>