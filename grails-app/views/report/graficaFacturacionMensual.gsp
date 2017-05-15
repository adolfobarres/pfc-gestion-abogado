<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title><g:message code="facturacion.mensual"/> <g:formatDate format="yyyy" date="${new Date()}"/></title>
</head>
<body>
<div class="row">
    <div class="col-lg-2 col-lg-offset-1" style="padding-top: 80px;">
        <g:render template="menuIzquierdo"/>
    </div>
    <div class="col-lg-8">
        <h2><i class="fa fa-bar-chart"></i> <g:message code="facturacion.mensual"/> <g:formatDate format="yyyy" date="${new Date()}"/></h2>
        <hr>
        <g:render template="/main/layouts/facturacionMensual"/>
    </div>
</div>
</body>
</html>
