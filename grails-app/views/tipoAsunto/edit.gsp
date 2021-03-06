<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />
        <g:set var="entityName" value="${message(code: 'tipoAsunto.label', default: 'TipoAsunto')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard"><i class="fa fa-chevron-left" aria-hidden="true"></i> Admin</g:link></li>
        <li class="active"><g:link controller="tipoAsunto" action="create"><i class="fa fa-plus" aria-hidden="true"></i> <g:message code="default.create.label" args="[entityName]" /></g:link></li>
        <li class="active"><g:link controller="tipoAsunto" action="index"><i class="fa fa-list" aria-hidden="true"></i> <g:message code="tipoasunto.list.label" /></g:link></li>
    </ol>
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-edit"></i> <g:message code="default.edit.label" args="[entityName]" /></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.tipoAsunto}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.tipoAsunto}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.tipoAsunto}" method="PUT">
                <g:hiddenField name="version" value="${this.tipoAsunto?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="btn btn-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </div>
    </body>
</html>
