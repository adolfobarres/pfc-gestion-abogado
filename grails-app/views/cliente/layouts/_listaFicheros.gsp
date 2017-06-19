<div class="panel panel-primary">
   <div class="panel-heading" style="margin-bottom:10px;">
       <i class="fa fa-file" aria-hidden="true"></i> <g:message code="cliente.ficheros"></g:message>
        </div>
        <div class="panel-body">

                <table class="table table-condensed table-bordered" id="tableFiles">
                <thead>
                <tr>
                    <th><g:message code="fichero.nombre"/></th>
                    <th><g:message code="fichero.descripcion"/></th>
                    <th><g:message code="fichero.notas"/>
                    <th><g:message code="fichero.size"/>
                    <th><g:message code="fichero.subidopor"/></th>
                    <th><g:message code="fichero.fechasubido"/></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:if test="${cliente?.ficheros}">
                    <tr class="info">
                        <td colspan="9"><strong><g:message code="ficheros.generales.del.caso"/></strong></td>
                    </tr>
                </g:if>
                <g:each var="fichero" in="${cliente?.ficheros}">
                    <tr>
                        <td><i class="${fichero.icono.icono}" style="color:${fichero.icono.color}"></i> ${fichero.nombre}</td>
                        <td>${fichero.descripcion}</td>
                        <td>${fichero.notas}</td>
                        <td>${fichero.size}</td>
                        <td>${fichero.addedBy.username}</td>
                        <td><g:formatDate date="${fichero.dateCreated}"/></td>
                        <td style="text-align:center;"><g:link controller="fichero" action="download" id="${fichero.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-download" aria-hidden="true"></i></g:link></td>
                        <td style="text-align:center;"><g:link controller="fichero" action="delete" id="${fichero.id}" params="['idCliente': cliente.id]"  style="padding: 2px;color:red;" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
                    </tr>
                </g:each>
                </tbody>
                </table>
</div>
<div class="panel-footer" style="text-align: right;;min-height: 51px;">
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ABOGADO">
        <g:link action="addFichero" controller="fichero" params="['idCliente':cliente.id]" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> <g:message code="fichero.nuevo"/></g:link>
    </sec:ifAnyGranted>
    </div>