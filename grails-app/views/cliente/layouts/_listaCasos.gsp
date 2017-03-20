

        <div class="panel panel-info" style="height:300px;overflow-y:auto;">
            <div class="panel-heading">
                <strong><i class="fa fa-gavel" aria-hidden="true"></i> <g:message code="cliente.casos"></g:message></strong>
            </div>

                <table class="table table-bordered table-hover">
                    <tbody>
                    <g:each var="caso" in="${cliente?.casos}">
                        <tr>
                            <td><g:formatDate date="${caso.fechaAlta}"/> </td>
                            <td><g:link controller="caso" action="show" id="${caso.id}">${caso.numAsunto}</g:link> </td>
                            <td>${caso.subtipoAsunto}</td>
                            <td>${caso.procedimiento}</td>
                            <td style="text-align: center;"><span class="label label-${caso.estadoCaso}">${caso?.numActuacionesPendientes} / ${caso?.actuaciones.size()}</span></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            <div class="panel-body">
                <g:link action="create" controller="caso" params="['idCliente':cliente.id]" class="btn btn-default"><g:message code="caso.nuevo.label"/></g:link>
            </div>

        </div>