<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="row-fluid">
        <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-edit" aria-hidden="true"></i> <g:message code="default.edit.label" args="[entityName]" /></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.cliente}">
            <ul class="alert alert-danger" role="alert">
                <g:eachError bean="${this.cliente}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.cliente}" method="PUT">
                <g:hiddenField name="version" value="${this.cliente?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <hr>
                <fieldset class="buttons" style="text-align: right;">
                    <input class="btn btn-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
