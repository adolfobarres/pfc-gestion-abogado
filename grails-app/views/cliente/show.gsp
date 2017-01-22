<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="row-fluid">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="row">
                <div class="col-lg-10">
                    <h4><i class="fa fa-id-card-o" aria-hidden="true"></i> <g:message code="cliente.label"/>: ${cliente.nombre} ${cliente.apellidos}</h4>
                </div>
                <div class="col-lg-2" style="text-align: right;">
                    <div class="btn-group" role="group" aria-label="...">
                        <g:link class="btn btn-default" title="${g.message(code:"default.edit.label",args:[entityName])}" action="edit" id="${cliente.id}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link>
                    </div>
                </div>
            </div>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:render template="/cliente/layouts/infoCliente"/>

            <div class="row">
                <g:render template="/cliente/layouts/listaCasos" model="['cliente':cliente]"/>

                <g:render template="/cliente/layouts/agenda" />
            </div>


        </div>
    </div>
    </body>
</html>
