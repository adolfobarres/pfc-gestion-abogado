<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="loginPage" />
    <title><g:message code="informes.label"/> - <g:message code="factura.lista"/></title>
</head>
<body>
<div class="row">
    <div class="col-lg-2 col-lg-offset-1" style="padding-top: 80px;">
        <g:render template="menuIzquierdo"/>
    </div>
    <div class="col-lg-8">
        <h2><i class="fa fa-file-text-o"></i> <g:message code="informes.label"/> - <g:message code="factura.lista"/></h2>
        <hr>
        <g:form action="reportListaFacturas">
            <div class="from-group">
                <label for="anno"><g:message code="anno.label"/> </label>
                <g:select from="${annos}" id="anno" optionKey="anno" optionValue="anno"
                             name="anno" class="form-control input-sm"></g:select>
            </div>
            <div class="from-group">
                <label for="mes"><g:message code="mes.label"/> </label>
                <g:select from="${[["num":1,"nombre":"Enero"],["num":2,"nombre":"Febrero"],["num":3,"nombre":"Marzo"],["num":4,"nombre":"Abril"],
                                   ["num":5,"nombre":"Mayo"],["num":6,"nombre":"Junio"],["num":7,"nombre":"Julio"],["num":8,"nombre":"Agosto"],
                                   ["num":9,"nombre":"Septiembre"],["num":10,"nombre":"Octubre"],["num":11,"nombre":"Noviembre"],["num":12,"nombre":"Diciembre"]]}"
                        id="mes"  optionKey="num" optionValue="nombre" name="mes" class="form-control input-sm"noSelection="['':'--Todos--']"></g:select>
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
