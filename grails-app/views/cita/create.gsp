<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title><g:message code="cita.nuevo.label"/></title>
</head>
<body>
<div class="row-fluid">
    <div class="col-lg-10 col-lg-offset-1">
        <h4><i class="fa fa-plus" aria-hidden="true"></i> <g:message code="cita.nuevo.label"/></h4>
        <hr>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.cita}">
            <ul class="alert alert-danger" role="alert">
                <g:eachError bean="${this.cita}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form action="save">
            <fieldset class="form">
                <g:render template="form" model="['cliente':cliente]"/>
            </fieldset>
            <fieldset class="buttons" style="text-align: right;">
                <g:submitButton name="create" class="btn" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
