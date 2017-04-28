


                <g:link action="addFichero" controller="fichero" params="['idCliente':cliente.id]" class="btn btn-default"><g:message code="fichero.nuevo"/></g:link>
                <hr>
                <table class="table table-condensed table-bordered" id="tableFiles">
                <thead>
                <tr>
                    <th><g:message code="fichero.nombre"/></th>
                    <th><g:message code="fichero.descripcion"/></th>
                    <th><g:message code="fichero.notas"/>
                    <th><g:message code="fichero.size"/>
                    <th><g:message code="fichero.tipo"/>
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
                        <td>${fichero.nombre}</td>
                        <td>${fichero.descripcion}</td>
                        <td>${fichero.notas}</td>
                        <td>${fichero.size}</td>
                        <td>${fichero.mimeType}</td>
                        <td>${fichero.addedBy.username}</td>
                        <td><g:formatDate date="${fichero.dateCreated}"/></td>
                        <td style="text-align:center;"><g:link controller="fichero" action="download" id="${fichero.id}" class="hollow button" style="padding: 2px;"><i class="fa fa-download" aria-hidden="true"></i></g:link></td>
                        <td style="text-align:center;"><g:link controller="fichero" action="delete" id="${fichero.id}" params="['idCliente': cliente.id]"  style="padding: 2px;color:red;" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="fa fa-trash" aria-hidden="true"></i></g:link></td>
                    </tr>
                </g:each>
                </tbody>
                </table>
