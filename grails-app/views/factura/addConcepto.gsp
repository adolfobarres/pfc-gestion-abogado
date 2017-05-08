<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <g:set var="entityName" value="${message(code: 'conceptoFactura.label', default: 'Concepto')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">
    <div class="col-lg-6 col-lg-offset-3">
        <h4><i class="fa fa-plus" aria-hidden="true"></i> <g:message code="default.create.label" args="[entityName]" /></h4>
        <hr>
        <g:if test="${flash.message}">
            <div class="alert alert-success" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.conceptoFactura}">
            <ul class="alert alert-danger" role="alert">
                <g:eachError bean="${this.conceptoFactura}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:render template="/factura/layouts/infoFactura"/>
        <hr>
        <g:render template="/factura/layouts/listaConceptos"/>
        <hr>
        <g:form action="save" controller="conceptoFactura">
            <fieldset class="form ">
                <input type="hidden" name="conceptoFactura.factura.id" value="${factura.id}"/>
                <g:render template="/factura/layouts/formConcepto" />
            </fieldset>
            <fieldset>
                <div class="row">
                    <div class="col-lg-12" style="text-align: right;">
                        <button type="submit" class="btn btn-primary"><g:message code="add.label"/></button>
                    </div>
                </div>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
