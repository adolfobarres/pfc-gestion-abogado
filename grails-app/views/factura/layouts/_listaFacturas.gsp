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
        <th>Total <g:message code="factura.irpf.label"/></th>
        <th><g:message code="factura.aabonar"/> </th>
        <th><g:message code="factura.abonada.label"/></th>
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
            <td style="border-left:1px solid grey;">${factura.iva}%</td>
            <td>
                <g:if test="${factura.irpf}">
                    ${factura.irpf}%
                </g:if>
            </td>
            <g:if test="${factura.conceptos}">
                <td style="border-left:1px solid grey;">
                    <g:formatNumber number="${factura?.totalBase}" type="currency" currencyCode="EUR" /></td>
                <td>
                    <g:formatNumber number="${factura?.totalIva}" type="currency" currencyCode="EUR" />
                </td>
                <td>
                    <g:if test="${factura.irpf}">
                    <g:formatNumber number="${factura?.totalIrpf}" type="currency" currencyCode="EUR" />
                    </g:if>

                </td>
                <td>
                    <g:if test="${factura?.totalIrpf != 0}">
                        <strong><g:formatNumber number="${factura?.totalIva - factura?.totalIrpf}" type="currency" currencyCode="EUR" /></strong>
                    </g:if>
                    <g:else>
                        <strong><g:formatNumber number="${factura?.totalIva}" type="currency" currencyCode="EUR" /></strong>
                    </g:else>
                </td>
            </g:if>
            <g:else>
                <td style="border-left:1px solid grey;" ><g:formatNumber number="${0}" type="currency" currencyCode="EUR" /></td>
                <td ><g:formatNumber number="${0}" type="currency" currencyCode="EUR" /></td>
                <td></td>
                <td><strong><g:formatNumber number="${0}" type="currency" currencyCode="EUR" /></strong></td>
            </g:else>
            <td>
                <g:if test="${factura?.abonada}">
                    <i class='fa fa-check' aria-hidden='true' style="color:green;"></i>
                </g:if>
                <g:else>
                    <i class="fa fa-times" aria-hidden="true" style="color:red;"></i>
                </g:else>
            </td>
            <td><g:link controller="factura" action="edit" id="${factura.id}" class="hollow b1utton" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td><g:link controller="factura" action="delete" id="${factura.id}" class="alert hollow button"  style="padding: 2px;color:red;" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
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