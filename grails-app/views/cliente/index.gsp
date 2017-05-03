<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="clientes.lista" /> </title>
    </head>
    <body>

        <div class="row-fluid">
            <div class="col-lg-10 col-lg-offset-1">
            <h4><i class="fa fa-users" aria-hidden="true"></i> <g:message code="clientes.lista" /></h4>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
            <hr>
                <div class="row">
                    <div class="col-lg-12" >
                        <div class="btn-group" role="group">
                            <g:link controller="cliente" action="create" class="btn btn-default"><i class="fa fa-plus"></i> <g:message code="cliente.nuevo.label"/></g:link>
                        </div>
                    </div>
                </div>
            <hr>
            <g:render template="layouts/table" model="[clienteList:clienteList]" />

            <div class="pagination">
                <g:paginate total="${clienteCount ?: 0}" />
            </div>
        </div>
        </div>
    </body>
</html>