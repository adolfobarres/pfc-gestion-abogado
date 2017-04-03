<table class="table table-bordered table-hover" id="tableList">
    <thead>
    <tr>
        <th><g:message code="user.username"/></th>
        <th><g:message code="usuario.nombre"/></th>
        <th><g:message code="usuario.email"/></th>
        <th><g:message code="usuario.role.administrador"/></th>
        <th><g:message code="usuario.role.abogado"/></th>
        <th><g:message code="usuario.role.administrativo"/></th>
        <th style="width:10px;"></th>
        <th style="width:10px;"></th>
    </tr>
    </thead>
    <tbody>
    <g:each var="user" in="${userList}">
        <tr>
            <td>${user.username}</td>
            <td>${user.nombre} ${user.apellidos} </td>
            <td>${user.email}</td>
            <td style="text-align:center;">
                <g:if test="${user.authorities.contains(com.spring.security.Role.findByAuthority("ROLE_ADMIN"))}">
                    <i class="fa fa-check" style="color:green;"></i>
                </g:if>
                <g:else>
                    <i class="fa fa-remove" style="color:red;"></i>
                </g:else>
            </td>
            <td style="text-align:center;">
                <g:if test="${user.authorities.contains(com.spring.security.Role.findByAuthority("ROLE_ABOGADO"))}">
                    <i class="fa fa-check" style="color:green;"></i>
                </g:if>
                <g:else>
                    <i class="fa fa-remove" style="color:red;"></i>
                </g:else>
            </td>
            <td style="text-align:center;">
                <g:if test="${user.authorities.contains(com.spring.security.Role.findByAuthority("ROLE_ADMINISTRATIVO"))}">
                    <i class="fa fa-check" style="color:green;"></i>
                </g:if>
                <g:else>
                    <i class="fa fa-remove" style="color:red;"></i>
                </g:else>
            </td>
            <td><g:link controller="${controllerName}" action="edit" id="${user.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link></td>
            <td><g:link controller="${controllerName}" action="delete" id="${user.id}" class="alert hollow button"  style="padding: 2px;" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
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
