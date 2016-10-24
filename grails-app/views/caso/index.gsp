<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="row-fluid">
        <div class="col-lg-10 col-lg-offset-1">
            <h4><g:message code="casos.lista" /></h4>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:render template="layouts/table" model="[casoList:casoList]"/>

            <div class="pagination">
                <g:paginate total="${casoCount ?: 0}" />
            </div>
        </div>
        </div>
    </body>
</html>