<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title><g:message code="informes.label"/> - <g:message code="clientes.lista"/></title>
</head>
<body>
<div class="row">
    <div class="col-lg-2 col-lg-offset-1" style="padding-top: 80px;">
        <g:render template="menuIzquierdo"/>
    </div>
    <div class="col-lg-8">
        <h2><i class="fa fa-file-text-o"></i> <g:message code="informes.label"/> - <g:message code="clientes.lista"/></h2>
        <hr>
        <g:form action="reportListaClientes">
            <div class="from-group">
                <label for="orden"><g:message code="orden.label"/> </label>
                <g:select from="${['apellidos','nif','poblacion']}" id="orden"
                          name="orden" class="form-control input-sm"></g:select>
            </div>
            <hr>
            <div style="text-align: right;">
                <input type="submit" class="btn btn-primary" value="${g.message(code:"generar.label")}" >
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
