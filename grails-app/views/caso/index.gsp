<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <h4><i class="fa fa-gavel" aria-hidden="true"></i> <g:message code="casos.lista" /></h4>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="row">
                <div class="col-lg-12" >
                    <div class="btn-group" role="group">
                        <g:link controller="caso" action="create" class="btn btn-default"><i class="fa fa-plus"></i> <g:message code="caso.nuevo.label"/></g:link>
                    </div>
                </div>
            </div>
            <hr>
            <g:render template="layouts/table" model="[casoList:casoList]"/>

        </div>
        </div>
    </body>
</html>