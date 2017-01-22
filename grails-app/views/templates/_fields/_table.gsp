<table class="table table-hover table-bordered table-striped" id="tableList">
    <thead>
    <tr>
        <g:each in="${domainProperties}" var="p" status="i">
            <g:set var="propTitle">${domainClass.propertyName}.${p.name}.label</g:set>
            <g:sortableColumn property="${p.name}" title="${message(code: propTitle, default: p.naturalName)}" />
        </g:each>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${collection}" var="bean" status="i">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <g:each in="${domainProperties}" var="p" status="j">
                <g:if test="${j==0}">
                    <td><g:link method="GET" resource="${bean}"><f:display bean="${bean}" property="${p.name}" displayStyle="${displayStyle?:'table'}" /></g:link></td>
                </g:if>
                <g:else>
                    <td><f:display bean="${bean}" property="${p.name}"  displayStyle="${displayStyle?:'table'}" /></td>
                </g:else>
            </g:each>
            <td><g:link controller="${controllerName}" action="edit" id="${bean.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td><g:link controller="${controllerName}" action="delete" id="${bean.id}" class="alert hollow button"  style="padding: 2px;"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
        </tr>
    </g:each>
    </tbody>
</table>
<script>
    $(document).ready( function () {
        $('#tableList').DataTable({
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
