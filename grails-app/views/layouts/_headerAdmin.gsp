<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        <a class="navbar-brand" href="#"><i class="fa fa-cog" aria-hidden="true" ></i> ADMIN</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-university"></i> <g:message code="configuracion.general.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <g:if test="${gestion.abogado.MainInfo.list().size()>0}">
                            <li><g:link controller="mainInfo" action="edit" id="${gestion.abogado.MainInfo.list().first().id}"><i class="fa fa-edit"></i> <g:message code="editar.infogeneral.label"/></g:link> </li>
                        </g:if>
                        <g:else>
                            <li><g:link controller="mainInfo" action="create" ><i class="fa fa-plus"></i> <g:message code="crear.infogeneral.label"/></g:link> </li>
                        </g:else>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-users" aria-hidden="true"></i> <g:message code="usuarios.permisos.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="user" action="create"><i class="fa fa-plus"></i> <g:message code="user.nuevo"/></g:link> </li>
                        <li><g:link controller="user" action="index"><i class="fa fa-search"></i> <g:message code="user.buscar"/></g:link> </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-gavel" aria-hidden="true"></i> <g:message code="casos.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="tipoAsunto" action="create"><i class="fa fa-plus"></i> <g:message code="caso.tipoAsunto.nuevo.label"/></g:link>
                        <li><g:link controller="tipoAsunto" action="index"><i class="fa fa-search"></i> <g:message code="caso.tipoAsunto.buscar.label"/></g:link> </li>
                        <li><g:link controller="tipoProcedimiento" action="create"><i class="fa fa-plus"></i> <g:message code="caso.procedimiento.nuevo.label"/></g:link>
                        <li><g:link controller="tipoProcedimiento" action="index"><i class="fa fa-search"></i> <g:message code="caso.procedimiento.buscar.label"/></g:link> </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-shopping-bag" aria-hidden="true"></i> <g:message code="caso.actuaciones.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="estadoActuacion" action="create"><i class="fa fa-plus"></i> <g:message code="actuacion.estado.nuevo.label"/></g:link>
                        <li><g:link controller="estadoActuacion" action="index"><i class="fa fa-search"></i> <g:message code="actuacion.estado.buscar.label"/></g:link> </li>
                        <li><g:link controller="prioridad" action="create"><i class="fa fa-plus"></i> <g:message code="actuacion.prioridad.nuevo.label"/></g:link>
                        <li><g:link controller="prioridad" action="index"><i class="fa fa-search"></i> <g:message code="actuacion.prioridad.buscar.label"/></g:link> </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-calendar"></i> <g:message code="citas.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="tipoCita" action="create"><i class="fa fa-plus"></i> <g:message code="tipoCita.nuevo.label"/></g:link>
                        <li><g:link controller="tipoCita" action="index"><i class="fa fa-search"></i> <g:message code="tipoCita.buscar.label"/></g:link> </li>
                    </ul>
                </li>
            </ul>

        <ul class="nav navbar-nav navbar-right">
            <li> <g:link controller="logout" ><i class="fa fa-user-circle-o" aria-hidden="true"></i> <sec:username/> (<g:message code="user.desconectar"/>) </g:link></li>
            <li><g:link controller="caso" action="index" style="color:#4280f4;text-decoration:underline;"> <i class="fa fa-home" aria-hidden="true" ></i> Home</g:link></li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>