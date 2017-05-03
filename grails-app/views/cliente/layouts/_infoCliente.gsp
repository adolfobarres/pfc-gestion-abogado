<div class="row">
    <div class="col-lg-12">

                <div class="row">
                    <div class="col-lg-6">
                        <h3><i class="fa fa-user"></i> ${cliente?.nombre} ${cliente.apellidos}</h3>
                    </div>
                    <div class="col-lg-6">
                        <h3><i class="fa fa-id-card"></i> ${cliente?.nif}</h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <h4><i class="fa fa-at"></i> ${cliente?.email}</h4>
                    </div>
                    <div class="col-lg-3">
                        <h4><i class="fa fa-phone"></i> ${cliente?.telefono}</h4>
                    </div>
                    <div class="col-lg-3">
                        <h4> <i class="fa fa-mobile-phone"></i>  ${cliente?.movil}</h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <h4><i class="fa fa-home"></i>
                            ${cliente?.direccion}, ${cliente?.poblacion} (${cliente?.provincia}), ${cliente?.cp}</h4>
                    </div>
                </div>

    </div>
</div>
<hr>
<div class="row" style="margin-bottom: 20px; text-align: center">
    <div class="col-lg-12">
        <div class="btn-group" role="group" aria-label="...">

            <a href="#casos" class="btn btn-default"><i class="fa fa-gavel"></i> <g:message code="casos.label"/> <span class="label label-info">${cliente.casos.size()}</span></a>
            <a href="#citas" class="btn btn-default"><i class="fa fa-calendar"></i> <g:message code="citas.label"/> <span class="label label-info">${cliente.citas.findAll{it.realizada == false}.size()}</span></a>
            <a href="#facturas" class="btn btn-default"><i class="fa fa-money"></i> <g:message code="facturacion.label"/> <span class="label label-info">${cliente.casos.facturas.flatten().size()}</span></a>
            <a href="#documentos" class="btn btn-default"><i class="fa fa-file"></i> <g:message code="ficheros.label"/> <span class="label label-info">${cliente.ficheros.size()}</span></a>
            <g:link class="btn btn-default" title="${g.message(code:"default.edit.label",args:[entityName])}" action="edit" id="${cliente.id}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <g:message code="default.button.edit.label"/></g:link>
        </div>

    </div>
</div>

