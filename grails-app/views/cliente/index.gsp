<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="row-fluid">
            <div class="col-lg-10 col-lg-offset-1">
            <h4><g:message code="clientes.lista" /></h4>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${clienteList}" />

            <div class="pagination">
                <g:paginate total="${clienteCount ?: 0}" />
            </div>
        </div>
        </div>
    </body>
</html>