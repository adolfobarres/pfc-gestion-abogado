<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />
        <g:set var="entityName" value="${message(code: 'prioridad.label', default: 'Prioridad')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard">Admin</g:link></li>
        <li><g:link controller="admin" action="dashboard"><g:message code="prioridad.label"/></g:link></li>
        <li class="active"> <g:message code="default.edit.label" args="[entityName]" /></li>
    </ol>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-edit"></i> <g:message code="default.edit.label" args="[entityName]" /></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.prioridad}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.prioridad}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.prioridad}" method="PUT">
                <g:hiddenField name="version" value="${this.prioridad?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <hr>
                <fieldset class="buttons">
                    <input class="btn btn-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
