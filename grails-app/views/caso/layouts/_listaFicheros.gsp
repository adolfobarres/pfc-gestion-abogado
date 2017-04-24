<table class="table table-condensed table-bordered table-striped" id="tableFiles">
    <thead>
    <tr>
        <th><g:message code="fichero.nombre"/></th>
        <th><g:message code="fichero.descripcion"/></th>
        <th><g:message code="fichero.notas"/>
        <th><g:message code="fichero.subidopor"/></th>
        <th><g:message code="fichero.fechasubido"/></th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each var="fichero" in="${caso.ficheros}">
        <tr>
            <td>${fichero.nombre}</td>
            <td>${fichero.descripcion}</td>
            <td>${fichero.notas}</td>
            <td>${fichero.addedBy.username}</td>
            <td><g:formatDate date="${fichero.dateCreated}"/></td>
            <td style="text-align:center;"><g:link controller="fichero" action="download" id="${fichero.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-download" aria-hidden="true"></i></g:link></td>
            <td style="text-align:center;"><g:link controller="fichero" action="delete" id="${fichero.id}" class="alert hollow button"  style="padding: 2px;"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>

<script>
    $(document).ready( function () {

        $.fn.dataTable.moment( 'DD-MM-YYYY' );

        $('#tableFiles').DataTable({
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