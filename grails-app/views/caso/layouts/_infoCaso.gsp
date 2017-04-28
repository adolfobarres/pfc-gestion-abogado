<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                <g:message code="caso.datos.basicos"></g:message>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <strong><g:message code="caso.numAsunto.label"/>:</strong> ${caso?.numAsunto}
                    </div>
                    <div class="col-lg-6">
                        <strong><g:message code="caso.fechaAlta.label"/>:</strong>
                        <g:formatDate date="${caso?.fechaAlta}" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <strong><g:message code="caso.tipoAsunto.label"/>:</strong>
                        ${caso?.subtipoAsunto.tipoAsunto} - ${caso?.subtipoAsunto}
                    </div>
                    <div class="col-lg-6">
                       <strong><g:message code="caso.procedimiento.label"/>:</strong>
                        ${caso?.procedimiento}
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <strong><g:message code="caso.cliente.label"/>:</strong>
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
            <li class="active"><a data-toggle="pill" href="#home"> Actuaciones <i class="fa fa-gavel" aria-hidden="true"></i></a></li>
            <li><a data-toggle="pill" href="#menu1">Ficheros <i class="fa fa-file-word-o" aria-hidden="true"></i></a> </li>
            <li><a data-toggle="pill" href="#menu2">Clientes <i class="fa fa-users" aria-hidden="true"></i></a></li>
            <li><a data-toggle="pill" href="#menu3">Citas <i class="fa fa-calendar" aria-hidden="true"></i></a> </li>
            <li><a data-toggle="pill" href="#menu4"><g:message code="facturacion.label"/> <i class="fa fa-money" aria-hidden="true"></i></i></a> </li>
        </ul>

        <div class="tab-content">
            <div id="home" class="tab-pane fade in active">
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
            <div id="menu1" class="tab-pane fade">
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
            <div id="menu2" class="tab-pane fade">
                <h3>Menu 2</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
            </div>
            <div id="menu3" class="tab-pane fade">
                <g:render template="layouts/listaCitasCaso"/>
            </div>
            <div id="menu4" class="tab-pane fade">
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