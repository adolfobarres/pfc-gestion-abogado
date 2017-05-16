<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="login" />
    <title><g:message code="renovar.password"/></title>
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
        <g:form action="changePassword" controller="user">
            <g:img dir="images" file="logo.png" class="profile-img-card" id="profile-img"/>
            <p>Escriba una nueva contraseña para el usuario con email: <b>${gspEmail}</b></p>


            <div class="form-group">
                <label for="password">Password <span class="required-indicator">*</span></label>
            <input type="password" class="form-control input-sm" required name="password" placeholder="nueva contraseña" id="password">
            <input type="hidden" name="uid" value="${params.uid}"/>
            <hr>
            <div style="text-align: right;">
                <input type="submit" value="Enviar" class="btn btn-primary">
            </div>
        </g:form>

    </div>
    </div>
    </div>
</body>
</html>
