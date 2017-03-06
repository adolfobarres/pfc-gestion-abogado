<table class="table table-condensed table-bordered table-striped" id="tableList">
    <thead>
    <tr>
        <th><g:message code="conceptoFactura.descripcion.label"/></th>
        <th><g:message code="conceptoFactura.importe.label"/></th>
        <th><g:message code="conceptoFactura.importeconIva.label"/></th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <g:if test="${factura.conceptos}">
    <tfoot>
    <tr>
        <td><strong>TOTAL</strong></td>
        <td><strong>
            <g:formatNumber number="${factura?.conceptos?.importe?.sum()}" type="currency" currencyCode="EUR" /></strong></td>
        <td><strong>
            <g:formatNumber number="${factura?.conceptos?.importe?.sum()*(1+(gestion.abogado.MainInfo.list().first().iva / 100))}" type="currency" currencyCode="EUR" />
           </strong></td>
        <td></td>
        <td></td>
    </tr>
    </tfoot>
    </g:if>
    <tbody>
    <g:each var="concepto" in="${factura.conceptos}">
        <tr>
            <td>${concepto.descripcion}</td>
            <td>
                <g:formatNumber number="${concepto.importe}" type="currency" currencyCode="EUR" />
            </td>
            <td>
                <g:formatNumber number="${concepto.importe + (concepto.importe * factura.iva/100)}" type="currency" currencyCode="EUR" />
            </td>
            <td><g:link controller="factura" action="editConcepto" id="${concepto.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td><g:link controller="conceptoFactura" action="delete" id="${concepto.id}" class="alert hollow button"  style="padding: 2px;" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
        </tr>

    </g:each>
    </tbody>
</table>

<script>
    $(document).ready( function () {

        $.fn.dataTable.moment( 'DD-MM-YYYY' );

        $('#tableList').DataTable({
            "order": [[ 1, "desc" ]],
            "paging":false,
            "searching": false,
            "bInfo" : false,
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