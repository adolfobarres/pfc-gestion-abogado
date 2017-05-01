<%@ page import="gestion.abogado.Fichero" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title><g:message code="documentos.lista"/></title>
</head>
<body>
<div class="row-fluid">
    <div class="col-lg-10 col-lg-offset-1">
        <h4><i class="fa fa-list" aria-hidden="true"></i> <g:message code="documentos.lista"/> <small><g:message code="total.ficheros"/>: ${gestion.abogado.Fichero.list().size()}</small></h4>
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
        <div class="row">
            <g:render template="layouts/busqueda"></g:render>
        </div>
        <div class="row">
            <g:render template="layouts/tablaFicheros"></g:render>
        </div>

    </div>
</div>
</body>
</html>



