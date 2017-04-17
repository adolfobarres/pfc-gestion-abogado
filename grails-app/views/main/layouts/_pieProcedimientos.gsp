<div class="panel panel-success">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-gavel" aria-hidden="true"></i> <g:message code="tipos.procedimiento.alta"/></h3>
    </div>
    <div class="panel-body">
        <div id="grafica" style="height: 200px;"></div>
    </div>
</div>


<script>
    $(function () {
        Highcharts.setOptions({

        });

        $('#grafica').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: ''
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    colors: ['#ffcc00','#3399ff','#0059b3','#66ff66'],
                    dataLabels: {
                        enabled: true,
                        color:'white',
                        format: '{point.name}({point.y})',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    },
                    borderColor: '#bfbfbf'
                }
            },
            series: [{
                type: 'pie',
                name: '<g:message code="tipoProcedimiento.label"/>',
                data: <g:include controller="main" action="datosGraficaTartaProcedimientos"/>
            }]
        });
    });
</script>