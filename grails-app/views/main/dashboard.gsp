<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title>SIGAB - Main </title>
</head>
<body>
    <div class="row">
        <div class="col-lg-12">
            <h3>${gestion.abogado.MainInfo.list().first().nombreDespacho} <small>${gestion.abogado.MainInfo.list().first().tituloDespacho}</small></h3>
            <hr>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8">
            <div class="row">
                <div class="col-lg-12">
                    <g:include action="ultimosCasos"/>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <g:render template="layouts/facturacionMensual"/>
                </div>
                <div class="col-lg-6">
                    <g:render template="layouts/pieProcedimientos"/>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <g:render template="layouts/calendario"/>
        </div>
    </div>
</body>
</html>