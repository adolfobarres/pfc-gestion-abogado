<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-circle-o" aria-hidden="true"></i> <g:message code="caso.datos.basicos"></g:message>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <strong><i class="fa fa-terminal" aria-hidden="true"></i> <g:message code="caso.numAsunto.label"/>:</strong> ${caso?.numAsunto}
                    </div>
                    <div class="col-lg-6">
                        <strong><i class="fa fa-calendar"></i> <g:message code="caso.fechaAlta.label"/>:</strong>
                        <g:formatDate date="${caso?.fechaAlta}" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <strong><i class="fa fa-sitemap" aria-hidden="true"></i> <g:message code="caso.tipoAsunto.label"/>:</strong>
                        ${caso?.subtipoAsunto.tipoAsunto} - ${caso?.subtipoAsunto}
                    </div>
                    <div class="col-lg-6">
                       <strong><i class="fa fa-suitcase" aria-hidden="true"></i> <g:message code="caso.procedimiento.label"/>:</strong>
                        ${caso?.procedimiento}
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <strong><i class="fa fa-user"></i> <g:message code="caso.cliente.label"/>:</strong>
                        <g:link controller="cliente" action="show" id="${caso.cliente.id}">${caso?.cliente}</g:link>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <ul class="nav nav-tabs" id="myTab">
            <li <g:if test="${session.pestanaCaso == 'casos' || !session.pestanaCaso}">class="active"</g:if>><a data-toggle="pill" href="#casos" onclick="activaPestana('casos')"><i class="fa fa-gavel" aria-hidden="true"></i> Actuaciones <span class="label label-info">${caso.actuaciones.size()}</span> </a></li>
            <li <g:if test="${session.pestanaCaso == 'ficheros'}">class="active"</g:if>> <a data-toggle="pill" href="#ficheros" onclick="activaPestana('ficheros')"><i class="fa fa-file-word-o" aria-hidden="true"></i> Ficheros <span class="label label-info">${caso.ficheros.size() + caso.actuaciones.ficheros.flatten().size()}</span></a> </li>
            <li <g:if test="${session.pestanaCaso == 'clientes'}">class="active"</g:if>><a data-toggle="pill" href="#clientes" onclick="activaPestana('clientes')"><i class="fa fa-users" aria-hidden="true"></i> Clientes <span class="label label-info">${caso.otrosClientes.size()+1}</span></a></li>
            <li <g:if test="${session.pestanaCaso == 'citas'}">class="active"</g:if>><a data-toggle="pill" href="#citas" onclick="activaPestana('citas')"><i class="fa fa-calendar" aria-hidden="true"></i> Citas  <span class="label label-info">${caso.citas.findAll{it.realizada == false}.size()}</span></a> </li>
            <li <g:if test="${session.pestanaCaso == 'facturas'}">class="active"</g:if>><a data-toggle="pill" href="#facturas" onclick="activaPestana('facturas')"><i class="fa fa-money" aria-hidden="true"></i> <g:message code="facturacion.label"/> <span class="label label-info">${caso.facturas.size()}</span></a> </li>
        </ul>

        <div class="tab-content">
            <div id="casos" class="tab-pane fade in <g:if test="${session.pestanaCaso == 'casos' || !session.pestanaCaso}">active</g:if>">
                <div class="row">
                    <div class="col-lg-12" style="margin-top: 20px;">
                        <div class="btn-group" role="group">
                            <g:link controller="actuacion" action="create" params="['idCaso':caso.id]" class="btn btn-default"><i class="fa fa-plus"></i> <g:message code="actuacion.nueva.label"/></g:link>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-lg-12" >
                        <g:render template="layouts/listaActuaciones"/>
                    </div>
                </div>
            </div>
            <div id="ficheros" class="tab-pane fade <g:if test="${session.pestanaCaso == 'ficheros'}">in active</g:if>">
                <div class="row">
                <div class="col-lg-12" style="margin-top: 20px;">
                    <div class="btn-group" role="group">
                        <g:link controller="fichero" action="addFichero" params="['idCaso':caso.id]" class="btn btn-default"><i class="fa fa-plus"></i> <g:message code="fichero.nuevo"/></g:link>
                    </div>
                </div>
            </div>
            <hr>
                <div class="row">
                    <div class="col-lg-12" >
                <g:render template="layouts/listaFicheros"/>
                        </div></div>
            </div>
            <div id="clientes" class="tab-pane fade <g:if test="${session.pestanaCaso == 'clientes'}">in active</g:if>">
                <g:render template="layouts/listaClientes"/>
            </div>
            <div id="citas" class="tab-pane fade <g:if test="${session.pestanaCaso == 'citas'}">in active</g:if>">
                <g:render template="layouts/listaCitasCaso"/>
            </div>
            <div id="facturas" class="tab-pane fade <g:if test="${session.pestanaCaso == 'facturas'}">in active</g:if>">
                <div class="row">
                    <div class="col-lg-12" style="margin-top: 20px;">
                        <div class="btn-group" role="group">
                            <g:link controller="factura" action="create" params="['idCaso':caso.id]" class="btn btn-default"><i class="fa fa-plus"></i> <g:message code="factura.nueva.label"/></g:link>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-lg-12" >
                        <g:render template="/factura/layouts/listaFacturas" model="['facturas':caso?.facturas]"/>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


    <script>
        function activaPestana(pestana) {
            jQuery.ajax({
                type: 'POST',
                data: 'pestana=' + pestana,
                url: '${createLink(action: 'pestanaCaso',controller:'main')}'
            });
        }
    </script>