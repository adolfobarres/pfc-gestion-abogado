<script>
    $(function(){
        var current = location.pathname;
        $('#nav li a').each(function(){
            var $this = $(this);
            // if the current path is like this link, make it active
            if($this.attr('href').indexOf(current) !== -1){
                $this.addClass('active');
            }
        })
    })
</script>

<style>
    .group-main{
        background-color: #495276;
        color: white;
    }
    .active{
        font-size:13pt;
        font-weight: bold;
        text-decoration: underline;
    }

</style>

<ul id="nav" class="list-group">
    <li class="list-group-item group-main"><i class="fa fa-money"></i> <g:message code="facturacion.label"/></li>
    <li class="list-group-item"><g:link controller="report" action="listaFacturas"> <g:message code="factura.lista"/></li></g:link>
    <li class="list-group-item"><g:link controller="report" action="graficaFacturacionMensual"> <g:message code="facturacion.mensual"/></li></g:link></li>
    <li class="list-group-item group-main"><i class="fa fa-users"></i> <g:message code="clientes.label"/></li>
    <li class="list-group-item"><g:link controller="report" action="listaClientes"> <g:message code="clientes.lista"/></g:link></li>
    <li class="list-group-item group-main"><i class="fa fa-calendar"></i> <g:message code="citas.label"/></li>
    <li class="list-group-item"><g:link controller="report" action="listaCitas"> <g:message code="citas.lista.informe"/></g:link></li>
    <li class="list-group-item"><g:link controller="cita" action="create"> <g:message code="citas.lista"/></g:link></li>
</ul>