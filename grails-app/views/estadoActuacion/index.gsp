<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />
        <title><g:message code="estadoActuacion.list.label"/></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard">Admin</g:link></li>
        <li><g:link controller="admin" action="dashboard"><g:message code="actuacion.estadoActuacion.label"/></g:link></li>
        <li class="active"> <g:message code="estadoActuacion.list.label"/></li>
    </ol>
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
            <h4><i class="fa fa-list"></i> <g:message code="estadoActuacion.list.label"/></h4>
                <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${estadoActuacionList}" />
        </div>
        </div>
    </body>
</html>