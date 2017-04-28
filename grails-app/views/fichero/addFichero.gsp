<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title><g:message code="fichero.nuevo"/></title>
</head>
<body>
<div class="row-fluid">
    <div class="col-lg-6 col-lg-offset-3">
        <h4><i class="fa fa-file-o" aria-hidden="true"></i> <g:message code="fichero.nuevo"/></h4>
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
        <g:uploadForm name="myUpload" controller="fichero" action="upload">
            <g:render template="form"/>

        </g:uploadForm>
    </div>
    </div>
</body>
</html>


