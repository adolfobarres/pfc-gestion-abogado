<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-university" aria-hidden="true"></i> <g:message code="ultimos.casos"/></h3>
    </div>

        <table class="table table-hover table-condensed"style="font-size:12px;">
            <thead>
            <tr>
                <th><g:message code="caso.numAsunto.label"/></th>
                <th><g:message code="caso.fechaAlta.label"/></th>
                <th><g:message code="caso.procedimiento.label"/></th>
                <th><g:message code="caso.tipoAsunto.label"/></th>
                <th><g:message code="caso.cliente.label"/></th>
                <th><g:message code="caso.actuaciones.label"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each var="caso" in="${listCasos}">
                <tr>
                    <td><g:link action="show" controller="caso" id="${caso.id}">${caso.numAsunto}</g:link></td>
                    <td><g:formatDate date="${caso.fechaAlta}"/></td>
                    <td>${caso.procedimiento}</td>
                    <td>${caso.subtipoAsunto}</td>
                    <td>${caso.cliente}</td>
                    <td style="text-align: center;"><span class="label label-${caso.estadoCaso}">${caso?.numActuacionesPendientes} / ${caso?.actuaciones.size()}</span></td>
                </tr>
            </g:each>

            </tbody>
        </table>

</div>


