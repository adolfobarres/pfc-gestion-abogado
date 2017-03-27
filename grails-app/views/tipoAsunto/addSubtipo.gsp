<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="adminPage" />
        <g:set var="entityName" value="${message(code: 'subtipoAsunto.label', default: 'Sub Tipo')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <h4><i class="fa fa-plus"></i> <g:message code="default.create.label" args="[entityName]" /></h4>
            <hr>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.subtipoAsunto}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.subtipoAsunto}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <div class="row">
                <div class="col-lg-12">
                    <g:render template="layouts/infoTipo"/>
                </div>
            </div>
              <g:render template="layouts/listaSubtipos" model="['gspSubptipos':tipoAsunto.subtipos]" />
            <g:form action="saveSubtipo">
                <input type="hidden" name="tipo.id" value="${tipoAsunto.id}"/>
                <fieldset class="form">
                    <g:render template="formSubtipo"/>
                </fieldset>

                <fieldset class="buttons">
                    <g:submitButton name="create" class="btn btn-success" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </div>
    </body>
</html>
