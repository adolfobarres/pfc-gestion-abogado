<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />

        <title><g:message code="lista.tipoProcedimiento.label" /></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard">Admin</g:link></li>
        <li><g:link controller="admin" action="dashboard"><g:message code="tipoProcedimiento.label"/></g:link></li>
        <li class="active"><g:message code="lista.tipoProcedimiento.label" /></li>
    </ol>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
            <h4><i class="fa fa-list"></i> <g:message code="lista.tipoProcedimiento.label" /></h4>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${tipoProcedimientoList}" />
            </div>
        </div>
    </body>
</html>