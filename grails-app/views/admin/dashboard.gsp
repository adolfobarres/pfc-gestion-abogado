<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="adminPage" />
    <title>Admin DashBoard</title>
</head>
<body>
 <div class="row">
     <div class="col-lg-10 col-lg-offset-1">
         <div class="row">
             <div class="col-lg-12">
                 <h1><i class="fa fa-cog"></i> <g:message code="panel.administracion.label"/> <small>SIGAB</small></h1>
             </div>
         </div>
         <hr>
         <div class="row">
             <div class="col-lg-3  card card-1 card-maininfo">
                 <h3><i class="fa fa-university"></i> <g:message code="configuracion.general.label"/></h3>
                 <hr>
                 <ul  class="list-unstyled lista-dashboard">
                     <g:if test="${gestion.abogado.MainInfo.list().size()>0}">
                        <li><g:link controller="mainInfo" action="edit" id="${gestion.abogado.MainInfo.list().first().id}"><i class="fa fa-edit"></i> <g:message code="editar.infogeneral.label"/></g:link> </li>
                     </g:if>
                     <g:else>
                         <li><g:link controller="mainInfo" action="create" ><i class="fa fa-plus"></i> <g:message code="crear.infogeneral.label"/></g:link> </li>
                     </g:else>
                 </ul>
             </div>
             <div class="col-lg-3 col-lg-offset-1 card card-1 card-usuarios">
                 <h3><i class="fa fa-users"></i> <g:message code="usuarios.permisos.label"/></h3>
                 <hr>
                 <ul  class="list-unstyled lista-dashboard">
                     <li><g:link controller="user" action="create"><i class="fa fa-plus"></i> <g:message code="user.nuevo"/></g:link> </li>
                     <li><g:link controller="user" action="search"><i class="fa fa-search"></i> <g:message code="user.buscar"/></g:link> </li>
                 </ul>
             </div>
             <div class="col-lg-3 col-lg-offset-1 card card-1 card-casos">
                 <h3><i class="fa fa-gavel"></i> <g:message code="casos.label"/></h3>
                 <hr>
                 <ul  class="list-unstyled lista-dashboard">
                     <li><g:link controller="tipoAsunto" action="create"><i class="fa fa-plus"></i> <g:message code="caso.tipoAsunto.nuevo.label"/></g:link>
                     <li><g:link controller="tipoAsunto" action="index"><i class="fa fa-search"></i> <g:message code="caso.tipoAsunto.buscar.label"/></g:link> </li>
                     <li><g:link controller="tipoProcedimiento" action="create"><i class="fa fa-plus"></i> <g:message code="caso.procedimiento.nuevo.label"/></g:link>
                     <li><g:link controller="tipoProcedimiento" action="index"><i class="fa fa-search"></i> <g:message code="caso.procedimiento.buscar.label"/></g:link> </li>
                 </ul>
             </div>
         </div>
         <div class="row">
             <div class="col-lg-3 card card-1 card-actuaciones">
                 <h3><i class="fa fa-shopping-bag"></i> <g:message code="caso.actuaciones.label"/></h3>
                 <hr>
                 <ul  class="list-unstyled lista-dashboard">
                     <li><g:link controller="estadoActuacion" action="create"><i class="fa fa-plus"></i> <g:message code="actuacion.estado.nuevo.label"/></g:link>
                     <li><g:link controller="estadoActuacion" action="index"><i class="fa fa-search"></i> <g:message code="actuacion.estado.buscar.label"/></g:link> </li>
                     <li><g:link controller="prioridad" action="create"><i class="fa fa-plus"></i> <g:message code="actuacion.prioridad.nuevo.label"/></g:link>
                     <li><g:link controller="prioridad" action="index"><i class="fa fa-search"></i> <g:message code="actuacion.prioridad.buscar.label"/></g:link> </li>
                 </ul>
             </div>

             <div class="col-lg-3 card card-1 col-lg-offset-1 card-citas">
                 <h3><i class="fa fa-calendar"></i> <g:message code="citas.label"/></h3>
                 <hr>
                 <ul  class="list-unstyled lista-dashboard">
                     <li><g:link controller="tipoCita" action="create"><i class="fa fa-plus"></i> <g:message code="tipoCita.nuevo.label"/></g:link>
                     <li><g:link controller="tipoCita" action="index"><i class="fa fa-search"></i> <g:message code="tipoCita.buscar.label"/></g:link> </li>
                 </ul>
             </div>
         </div>

     </div>


 </div>
</body>
</html>
