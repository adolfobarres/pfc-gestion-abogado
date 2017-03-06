<table class="table table-condensed table-bordered table-striped" id="facturaList">
    <thead>
    <tr>
        <th><g:message code="factura.numero.label"/></th>
        <th><g:message code="caso.label"/></th>
        <th><g:message code="cliente.label"/></th>
        <th><g:message code="factura.fecha.label"/></th>
        <th><g:message code="factura.iva.label"/></th>
        <th><g:message code="factura.irpf.label"/></th>
        <th><g:message code="conceptoFactura.importe.label"/></th>
        <th><g:message code="conceptoFactura.importeconIva.label"/></th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each var="factura" in="${facturas}">
        <tr>
            <td><strong><g:link controller="report" action="printFactura" id="${factura.id}"> ${factura.numero}</g:link></strong></td>
            <td><g:link controller="caso" action="show" id="${factura.caso.id}">${factura.caso.numAsunto}</g:link></td>
            <td><g:link controller="cliente" action="show" id="${factura.caso.cliente.id}" title="${factura.caso.cliente}">${factura.caso.cliente.nif}</g:link></td>
            <td><g:formatDate date="${factura.fecha}"/></td>
            <td>${factura.iva}</td>
            <td>${factura.irpf}</td>
            <g:if test="${factura.conceptos}">
                <td>
                    <g:formatNumber number="${factura?.conceptos?.importe?.sum()}" type="currency" currencyCode="EUR" /></td>
                <td>
                    <g:formatNumber number="${factura?.conceptos?.importe?.sum()*(1+(gestion.abogado.MainInfo.list().first().iva/100))}" type="currency" currencyCode="EUR" />
                </td>
            </g:if>
            <g:else>
                <td><g:formatNumber number="${0}" type="currency" currencyCode="EUR" /></td>
                <td><g:formatNumber number="${0}" type="currency" currencyCode="EUR" /></td>
            </g:else>

            <td><g:link controller="factura" action="edit" id="${factura.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td><g:link controller="factura" action="delete" id="${factura.id}" class="alert hollow button"  style="padding: 2px;"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
        </tr>

    </g:each>
    </tbody>
</table>

<script>
    $(document).ready( function () {

        $.fn.dataTable.moment( 'DD-MM-YYYY' );

        $('#facturaList').DataTable({
            "order": [[ 0, "desc" ]],
            language: {
                "sProcessing":     "Procesando...",
                "sLengthMenu":     "Mostrar _MENU_ registros",
                "sZeroRecords":    "No se encontraron resultados",
                "sEmptyTable":     "Ningún dato disponible en esta tabla",
                "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix":    "",
                "sSearch":         "Buscar:",
                "sUrl":            "",
                "sInfoThousands":  ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst":    "Primero",
                    "sLast":     "Último",
                    "sNext":     "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            }
        } );
    } );
</script>