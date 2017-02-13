<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title><g:message code="cita.editar.label"/></title>
</head>
<body>
<div class="row-fluid">
    <div class="col-lg-8 col-lg-offset-2">
        <h4><i class="fa fa-plus" aria-hidden="true"></i> <g:message code="cita.nuevo.label"/></h4>
        <hr>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.cita}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.cita}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form action="save">
            <fieldset class="form">
                <g:render template="layouts/formCita"/>
            </fieldset>
            <hr>
            <fieldset class="buttons">
                <input class="btn btn-success" type="submit" value="${message(code: 'default.button.create.label', default: 'Añadir')}" />
            </fieldset>
        </g:form>
    </div>
</div>

</body>
</html>
