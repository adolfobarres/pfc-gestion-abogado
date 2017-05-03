
<nav class="navbar navbar-default"><div class="container-fluid">
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
        <form class="navbar-form navbar-left form-busqueda" action="<g:createLink controller='fichero' action='busqueda'/>" method="post" id="form-busqueda">
            <label><g:message code="busqueda.por.atributos"/></label><br>
            <div class="form-group">
                <input type="text" pattern=".{3,}"  title="mínimo 3 caracteres" class="form-control" placeholder="<g:message code="fichero.caso"/>" name="caso" value="${params?.caso}">
                <input type="text" pattern=".{3,}"  title="mínimo 3 caracteres" class="form-control" placeholder="<g:message code="fichero.dni.cliente"/>" name="dni" value="${params?.dni}">
            </div>
            <button type="submit" class="btn btn-default"><g:message code="fichero.buscar"/></button>
        </form>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-3">
        <form form class="navbar-form navbar-left form-busqueda" action="<g:createLink controller='fichero' action='busquedaContenido'/>" method="post" id="form-busqueda-contenido">
            <label><g:message code="busqueda.por.contenido"/></label><br>
            <div class="form-group">
                <input class="form-control" placeholder="<g:message code="fichero.contenido"/>" name="contenido" value="${params?.contenido}">
            </div>
            <button type="submit" class="btn btn-default"><g:message code="fichero.buscar"/></button>
        </form>
    </div>
    </div>
</nav>

<hr>
<script>
    $(function(){
        $(".form-busqueda").submit(function(event){
            event.preventDefault(); //prevent default action
            var post_url = $(this).attr("action"); //get form action url
            var request_method = $(this).attr("method"); //get form GET/POST method
            var form_data = $(this).serialize(); //Encode form elements for submission
            $("#divResultado").hide()
            $('#spinner').show();
            $.ajax({
                url : post_url,
                type: request_method,
                data : form_data
            }).done(function(response){ //
                $('#spinner').hide();
                $("#divResultado").show().fadeIn('slow')
                $("#divResultado").html(response);
            });
        });

    })
</script>