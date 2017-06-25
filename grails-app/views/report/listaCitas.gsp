<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title><g:message code="informes.label"/> - <g:message code="citas.lista.informe"/></title>
</head>
<body>
<div class="row">
    <div class="col-lg-2 col-lg-offset-1" style="padding-top: 80px;">
        <g:render template="menuIzquierdo"/>
    </div>
    <div class="col-lg-8">
        <h2><i class="fa fa-file-text-o"></i> <g:message code="informes.label"/> - <g:message code="citas.lista.informe"/></h2>
        <hr>
        <g:form action="reportListaCitas">
            <div class="from-group">
                <div class="row">
                <div class="col-lg-2">
                    <label for="from"><g:message code="fromto.label"/>; </label>
                </div>
                <div class="col-lg-3">
                    <input type="date" name="from" id="from" class="form-control input-sm"/>
                </div>
                <div class="col-lg-3">
                    <input type="date" name="to" class="form-control input-sm"/>
                </div>
                </div>
            </div>
            <hr>
            <div class="row">
            <div style="text-align: right;">
                <input type="submit" class="btn btn-primary" value="${g.message(code:"generar.label")}" >
            </div>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
