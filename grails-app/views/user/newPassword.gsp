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



            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="password"><i class="fa fa-lock"></i> <g:message code="user.password"/> <span class="required-indicator">*</span></label>
                    <input  class="form-control input-sm" id="password" title="La contraseña debe contener al menos 6 carácteres(1 número y 1 letra minúscula y 1 mayúscula)" type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="password" onchange="
                        this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
                        if(this.checkValidity()) form.pwd2.pattern = this.value;">
                        </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="pw2"><i class="fa fa-lock"></i> <g:message code="user.password.repetir"/> <span class="required-indicator">*</span></label>
                        <input  class="form-control input-sm" title="Las contraseñas no coinciden" type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="pwd2" onchange="
                            this.setCustomValidity(this.validity.patternMismatch ? this.title : '');">
                    </div>
                </div>
            </div>
            <input type="hidden" name="uid" value="${params.uid}"/>
            <hr>
            <div style="text-align: right;">
                <input type="submit" value="Enviar" class="btn btn-primary">
            </div>
        </g:form>

    </div>
    </div>
</body>
</html>
