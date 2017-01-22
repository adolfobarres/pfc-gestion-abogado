<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'caso.label', default: 'Caso')}" />
        <title> <g:message code="editar.caso.label"  /></title>
    </head>
    <body>
    <div class="row-fluid">
        <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-pencil" aria-hidden="true"></i> <g:message code="editar.caso.label"  /></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.caso}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.caso}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.caso}" method="PUT">
                <g:hiddenField name="version" value="${this.caso?.version}" />
                <fieldset class="form">
                    <g:render template="form" model="[caso:caso]"/>
                </fieldset>
                <hr>
                <fieldset class="buttons">
                    <input class="btn btn-success" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
