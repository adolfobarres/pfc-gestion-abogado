<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />
        <title><g:message code="crear.infogeneral.label"/></title>
    </head>
    <body>
    <ol class="breadcrumb">
        <li><g:link controller="admin" action="dashboard">Admin</g:link></li>
        <li><g:link controller="admin" action="dashboard"><g:message code="configuracion.general.label"/></g:link></li>
        <li class="active"><g:message code="crear.infogeneral.label"/></li>
    </ol>
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-university"></i> <g:message code="crear.infogeneral.label"/></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.mainInfo}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.mainInfo}" var="error">
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
