<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />
        <g:set var="entityName" value="${message(code: 'prioridad.label', default: 'Prioridad')}" />
        <title><g:message code="lista.prioridades.label" /></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard">Admin</g:link></li>
        <li><g:link controller="admin" action="dashboard"><g:message code="prioridad.label"/></g:link></li>
        <li class="active"> <g:message code="lista.prioridades.label" /></li>
    </ol>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
            <h4><i class="fa fa-list"></i> <g:message code="lista.prioridades.label" /></h4>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${prioridadList}" />
        </div>
        </div>
    </body>
</html>