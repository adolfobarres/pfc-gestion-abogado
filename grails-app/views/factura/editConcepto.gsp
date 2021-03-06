<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <g:set var="entityName" value="${message(code: 'conceptoFactura.label', default: 'Concepto')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">
    <div class="col-lg-6 col-lg-offset-3">
        <h4><i class="fa fa-plus" aria-hidden="true"></i> <g:message code="default.edit.label" args="[entityName]" /></h4>
        <hr>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
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
        <g:form action="update" controller="conceptoFactura" method="PUT">
            <input type="hidden" name="id" value="${concepto.id}"/>
            <input type="hidden" name="version" value="${concepto.version}"/>
            <fieldset class="form ">
                <input type="hidden" name="conceptoFactura.factura.id" value="${factura.id}"/>
                <g:render template="/factura/layouts/formConcepto" />
            </fieldset>
            <fieldset>
                <div class="row">
                    <div class="col-lg-2">
                        <button type="submit" class="btn btn-success"><g:message code="actualizar.label"/></button>
                    </div>
                </div>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
