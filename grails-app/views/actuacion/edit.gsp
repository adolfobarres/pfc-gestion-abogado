<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'actuacion.label', default: 'Actuacion')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="row-fluid">
        <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-pencil" aria-hidden="true"></i> <g:message code="actuacion.editar.label" /></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.actuacion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.actuacion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.actuacion}" method="PUT">
                <g:hiddenField name="version" value="${this.actuacion?.version}" />
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <hr>
                <fieldset class="buttons">
                    <input class="btn" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
