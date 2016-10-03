<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="row-fluid">
        <div class="col-lg-10 col-lg-offset-1">
            <h4><i class="fa fa-eye" aria-hidden="true"></i> <g:message code="default.show.label" args="[entityName]" /> ${caso.numAsunto}</h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:render template="/caso/layouts/infoCaso"/>
        </div>
        </div>
    </body>
</html>
