<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link controller="main" action="dashboard" class="navbar-brand" ><g:img dir="images" file="logo-vertical.png" height="20px;" id="profile-img"/></g:link>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ABOGADO,ROLE_ADMINISTRATIVO">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-users" aria-hidden="true"></i> <g:message code="clientes.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="cliente" action="index"><g:message code="clientes.lista"/></g:link></li>
                        <li><g:link controller="cliente" action="create"><g:message code="cliente.nuevo.label"/> </g:link></li>
                    </ul>
                </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ABOGADO">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-gavel" aria-hidden="true"></i> <g:message code="casos.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="caso" action="index"><g:message code="casos.lista"/></g:link></li>
                        <li><g:link controller="caso" action="create"><g:message code="caso.nuevo.label"/></g:link></li>
                    </ul>
                </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ABOGADO,ROLE_ADMINISTRATIVO">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-calendar" aria-hidden="true"></i> <g:message code="agenda.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="cita" action="create"><g:message code="citas.lista"/></g:link></li>
                        <li><g:link controller="cita" action="vencimientoActuaciones"><g:message code="citas.vencimientos"/></g:link></li>
                    </ul>
                </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ABOGADO,ROLE_ADMINISTRATIVO">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-money" aria-hidden="true"></i> <g:message code="facturacion.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="factura" action="index"><g:message code="facturas.lista"/></g:link></li>
                    </ul>
                </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ABOGADO">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-file-word-o" aria-hidden="true"></i> <g:message code="documentos.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="fichero" action="list"><g:message code="documentos.buscar"/></g:link></li>
                    </ul>
                </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ABOGADO,ROLE_ADMINISTRATIVO">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bar-chart" aria-hidden="true"></i> <g:message code="informes.label"/> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="report" action="listaFacturas"><g:message code="informes.label"/></g:link></li>
                    </ul>
                </li>
                </sec:ifAnyGranted>
            </ul>

        <ul class="nav navbar-nav navbar-right">
            <li> <g:link controller="logout" ><i class="fa fa-user-circle-o" aria-hidden="true"></i> <sec:username/> (<i class="fa fa-sign-out" aria-hidden="true"></i> <g:message code="user.desconectar"/>) </g:link></li>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
            <li><g:link controller="admin" action="dashboard" style="color:#4280f4;text-decoration:underline;"> <i class="fa fa-cog" aria-hidden="true" ></i> Admin</g:link></li>
            </sec:ifAnyGranted>
            </ul>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>