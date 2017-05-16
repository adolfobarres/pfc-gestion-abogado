<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="login" />
    <title><g:message code="recuperar.contraseña"/></title>
</head>
<body>
<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<g:if test="${flash.messageerror}">
    <div class="alert alert-warning" role="status">${flash.messageerror}</div>
</g:if>
<div class="container">
    <div class="card card-container">
        <g:form action="renewPassword" controller="user">
        <g:img dir="images" file="logo.png" class="profile-img-card" id="profile-img"/>
        <p>Si olvidó su contraseña, escriba su email y le será enviado un correo guiándole por el proceso para recuperarla.</p>


        <div class="form-group">
            <label for="email"><g:message code="clientes.email"/> <span class="required-indicator">*</span></label>
        <input type="email" class="form-control input-sm" required name="email" placeholder="email" id="email">
        <hr>
            <div style="text-align: right;">
            <input type="submit" value="Enviar" class="btn btn-primary">
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
