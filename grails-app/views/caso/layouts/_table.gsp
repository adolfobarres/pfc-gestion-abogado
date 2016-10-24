<table class="table table-bordered table-hover" id="tableList">
    <thead>
        <th><g:message code="caso.numAsunto.label"/></th>
        <th><g:message code="caso.fechaAlta.label"/></th>
        <th><g:message code="caso.tipoAsunto.label"/></th>
        <th><g:message code="caso.procedimiento.label"/></th>
        <th><g:message code="caso.cliente.label"/></th>
        <th><g:message code="caso.actuaciones.label"/></th>
        <th></th>
        <th></th>
    </thead>
    <tbody>
        <g:each var="caso" in="${casoList}">
            <tr>
                <td><g:link controller="caso" action="show" id="${caso.id}">${caso.numAsunto}</g:link></td>

                <td><g:formatDate date="${caso.fechaAlta}"/></td>
                <td>${caso?.subtipoAsunto}</td>
                <td>${caso?.procedimiento}</td>
                <td>${caso?.cliente}</td>
                <td style="text-align: center;"><span class="label label-${caso.estadoCaso}">${caso?.numActuacionesPendientes} / ${caso?.actuaciones.size()}</span></td>
                <td><g:link controller="${controllerName}" action="edit" id="${caso.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
                <td><g:link controller="${controllerName}" action="delete" id="${caso.id}" class="alert hollow button"  style="padding: 2px;"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
            </tr>
        </g:each>
    </tbody>
</table>


<script>
    $(document).ready( function () {

        $.fn.dataTable.moment( 'DD-MM-YYYY' );

        $('#tableList').DataTable({
            "order": [[ 1, "desc" ]],
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
