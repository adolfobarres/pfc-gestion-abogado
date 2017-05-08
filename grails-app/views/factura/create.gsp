<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'factura.label', default: 'Factura')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="row-fluid">
        <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-plus" aria-hidden="true"></i> <g:message code="default.create.label" args="[entityName]" /></h4>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.factura}">
            <ul class="alert alert-danger" role="alert">
                <g:eachError bean="${this.factura}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <g:hiddenField name="caso.id" value="${caso.id}"/>
                    <g:render template="form"/>
                </fieldset>
                <hr>
                <fieldset class="buttons" style="text-align: right;">
                    <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.addConceptos.label', default: 'Add Concept')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
    </body>
</html>
