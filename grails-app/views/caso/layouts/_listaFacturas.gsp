<table class="table table-condensed table-bordered table-striped" id="facturaList">
    <thead>
    <tr>
        <th><g:message code="actuacion.descripcion.label"/></th>
        <th><g:message code="actuacion.fechaAlta.label"/></th>
        <th><g:message code="actuacion.prioridad.label"/></th>
        <th><g:message code="actuacion.estadoActuacion.label"/></th>
        <th><g:message code="actuacion.fechaVencimiento.label"/></th>
        <th><g:message code="actuacion.fechaFin.label"/></th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each var="actuacion" in="${caso.actuaciones}">
        <tr class="${actuacion.clase}">
            <td>${actuacion.descripcion}</td>
            <td><g:formatDate date="${actuacion.fechaAlta}"/></td>
            <td>${actuacion.prioridad}</td>
            <td>${actuacion.estadoActuacion}</td>
            <td><g:formatDate date="${actuacion.fechaVencimiento}"/></td>
            <td><g:formatDate date="${actuacion?.fechaFin}"/></td>
            <td><g:link controller="actuacion" action="edit" id="${actuacion.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td><g:link controller="actuacion" action="delete" id="${actuacion.id}" class="alert hollow button"  style="padding: 2px;"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
        </tr>

    </g:each>
    </tbody>
</table>

<script>
    $(document).ready( function () {

        $.fn.dataTable.moment( 'DD-MM-YYYY' );

        $('#facturaList').DataTable({
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