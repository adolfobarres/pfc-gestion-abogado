<table class="table table-bordered table-hover" id="tableList">
    <thead>
    <th><g:message code="clientes.nombre"/></th>
    <th><g:message code="clientes.apellidos"/></th>
    <th><g:message code="clientes.nif"/></th>
    <th><g:message code="clientes.email"/></th>
    <th><g:message code="clientes.movil"/></th>
    <th><g:message code="clientes.direccion"/></th>
    <th></th>
    <th></th>
    </thead>
    <tbody>
    <g:each var="cliente" in="${clienteList}">
        <tr>
            <td><g:link controller="cliente" action="show" id="${cliente.id}">${cliente.nombre}</g:link></td>
            <td>${cliente.apellidos}</td>
            <td>${cliente?.nif}</td>
            <td>${cliente?.email}</td>
            <td>${cliente?.movil}</td>
            <td>${cliente?.direccion}</td>
            <td><g:link controller="${controllerName}" action="edit" id="${cliente.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td>
                <g:if test="${cliente.casos.size()==0}">
                    <g:link controller="${controllerName}" action="delete" id="${cliente.id}" class="alert hollow button"  style="padding: 2px;"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></g:link>
                </g:if>
             </td>

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
