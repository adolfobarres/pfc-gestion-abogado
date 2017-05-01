
<nav class="navbar navbar-default"><div class="container-fluid">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
        <g:form class="navbar-form navbar-left" action="busqueda">
            <label><g:message code="busqueda.por.atributos"/></label><br>
            <div class="form-group">
                <input class="form-control" placeholder="<g:message code="fichero.caso"/>" name="caso">
                <input class="form-control" placeholder="<g:message code="fichero.dni.cliente"/>" name="dni">
            </div>
            <button type="submit" class="btn btn-default"><g:message code="fichero.buscar"/></button>
        </g:form>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-3">
        <g:form class="navbar-form navbar-left" action="busquedaContenido">
            <label><g:message code="busqueda.por.contenido"/></label><br>
            <div class="form-group">
                <input class="form-control" placeholder="<g:message code="fichero.contenido"/>" name="contenido">
            </div>
            <button type="submit" class="btn btn-default"><g:message code="fichero.buscar"/></button>
        </g:form>
    </div>
    </div>
</nav>

<hr>