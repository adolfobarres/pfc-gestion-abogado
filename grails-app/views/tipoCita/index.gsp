<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage"/>
        <g:set var="entityName" value="${message(code: 'tipoCita.label', default: 'TipoCita')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard"><i class="fa fa-chevron-left" aria-hidden="true"></i> Admin</g:link></li>
        <li class="active"><g:link controller="tipoCita" action="create"><i class="fa fa-plus" aria-hidden="true"></i> <g:message code="default.create.label" args="[entityName]" /></g:link></li>
        <li><i class="fa fa-list" aria-hidden="true"></i> <g:message code="tipoCita.list.label" /></li>
    </ol>
        <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <h4><i class="fa fa-list" aria-hidden="true"></i> <g:message code="tipoCita.list.label" /></h4>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:render template="layouts/table"/>

        </div>
        </div>
    </body>
</html>