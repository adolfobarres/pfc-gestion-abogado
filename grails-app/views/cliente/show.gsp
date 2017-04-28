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
                <div class="col-lg-6" >
                    <g:render template="/cliente/layouts/listaCasos" model="['cliente':cliente]"/>

                </div>
                <div class="col-lg-6">
                    <g:render template="/cliente/layouts/agenda" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading" style="margin-bottom:10px;">
                            <strong><i class="fa fa-money" aria-hidden="true"></i> <g:message code="cliente.facturas"></g:message></strong>
                        </div>

                    <g:render template="/factura/layouts/listaFacturas" model="['facturas':cliente?.casos?.facturas.flatten()]"/>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading" style="margin-bottom:10px;">
                            <strong><i class="fa fa-money" aria-hidden="true"></i> <g:message code="cliente.facturas"></g:message></strong>
                        </div>
                        <div class="panel-body">
                            <g:render template="/cliente/layouts/listaFicheros" model="['cliente':cliente]"/>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
    </body>
</html>
