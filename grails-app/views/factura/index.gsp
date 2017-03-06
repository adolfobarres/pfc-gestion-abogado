<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

    <div class="row-fluid">
        <div class="col-lg-10 col-lg-offset-1">
            <h4><i class="fa fa-money" aria-hidden="true"></i> <g:message code="factura.lista" /></h4>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:render template="layouts/listaFacturas" model="['facturas':gestion.abogado.Factura.list()]"/>

        </div>
        </div>
    </body>
</html>