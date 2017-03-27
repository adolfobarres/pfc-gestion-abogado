<table class="table table-condensed table-bordered table-striped" id="tableList">
    <thead>
    <tr>
        <th><g:message code="subtipoAsunto.descripcion"/></th>
        <th style="width:10px;"></th>
        <th style="width:10px;"></th>
    </tr>
    </thead>
    <tbody>
    <g:each var="subtipo" in="${gspSubptipos}">
        <tr>
            <td>${subtipo.descripcion}</td>
            <td><g:link controller="tipoAsunto" action="editSubtipo" id="${subtipo.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td><g:link controller="tipoAsunto" action="deleteSubtipo" id="${subtipo.id}" class="alert hollow button"  style="padding: 2px;" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
        </tr>

    </g:each>
    </tbody>
</table>

<script>
    $(document).ready( function () {

        $.fn.dataTable.moment( 'DD-MM-YYYY' );

        $('#tableList').DataTable({
            "order": [[ 0, "desc" ]],
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