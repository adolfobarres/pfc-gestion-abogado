<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />
        <g:set var="entityName" value="${message(code: 'estadoActuacion.label', default: 'EstadoActuacion')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard">Admin</g:link></li>
        <li><g:link controller="admin" action="dashboard"><g:message code="estadoActuacion.label"/></g:link></li>
        <li class="active"><g:message code="default.create.label" args="[entityName]" /></li>
    </ol>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-plus"></i> <g:message code="default.create.label" args="[entityName]" /></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.estadoActuacion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.estadoActuacion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <hr>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
