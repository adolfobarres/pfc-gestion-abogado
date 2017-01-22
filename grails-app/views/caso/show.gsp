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
            <div class="row">
                <div class="col-lg-10">
                    <h4><i class="fa fa-eye" aria-hidden="true"></i> <g:message code="caso.label"/>: ${caso.numAsunto}</h4>
                </div>
                <div class="col-lg-2" style="text-align: right;">
                    <div class="btn-group" role="group" aria-label="...">
                        <g:link class="btn btn-default" title="${g.message(code:"default.edit.label",args:[entityName])}" action="edit" id="${caso.id}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></g:link>
                    </div>
                </div>
            </div>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:render template="/caso/layouts/infoCaso"/>
        </div>
        </div>
    </body>
</html>
