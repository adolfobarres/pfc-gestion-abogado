<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard"><i class="fa fa-chevron-left" aria-hidden="true"></i> Admin</g:link></li>
        <li class="active"><i class="fa fa-plus" aria-hidden="true"></i> <g:message code="default.create.label" args="[entityName]" /></li>
        <li class="active"><g:link controller="user" action="index"><i class="fa fa-list" aria-hidden="true"></i> <g:message code="user.list.label" /></g:link></li>
    </ol>
        <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <h4><i class="fa fa-plus"></i> <g:message code="default.create.label" args="[entityName]" /></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
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
