<table class="table table-bordered table-hover" id="tableList">
    <thead>
    <tr>
    <th><g:message code="tipoDeAsunto.descripcion"/></th>
    <th style="width:10px;"></th>
    <th style="width:10px;"></th>

        <th><g:message code="tipoDeAsunto.subtipos"/></th>

    </tr>
    </thead>
    <tbody>
    <g:each var="tipo" in="${tipoAsuntoList}">
        <tr>
            <td>${tipo.descripcion}</td>
            <td><g:link controller="${controllerName}" action="edit" id="${tipo.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td>
                <g:if test="${tipo.subtipos.size()==0}">
                    <g:link controller="${controllerName}" action="delete" id="${tipo.id}" class="alert hollow button"  style="padding: 2px;"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></g:link>
                </g:if>
            </td>
            <td>
                <ul>
                <g:each var="subtipo" in="${tipo.subtipos}">
                    <li>${subtipo.descripcion} <g:link action="editSubtipo" id="${subtipo.id}"><i class="fa fa-edit"></i></g:link> </li>
                </g:each>
                    <li><g:link action="addSubTipo" id="${tipo.id}"><i class="fa fa-plus"></i> <g:message code="add.subtipo"/></g:link></li>
                </ul>

            </td>


        </tr>
    </g:each>
    </tbody>
</table>


<script>
    $(document).ready( function () {

        $.fn.dataTable.moment( 'DD-MM-YYYY' );

        $('#tableList').DataTable({
            "order": [[ 0, "asc" ]],
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
