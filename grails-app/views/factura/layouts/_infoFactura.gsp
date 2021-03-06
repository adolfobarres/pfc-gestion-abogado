<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">
            <div class="row">
                <div class="col-lg-8">
                    <g:message code="factura.label"/>: ${factura.numero}
                </div>
                <div class="col-lg-4" style="text-align: right;">
                    <g:link controller="factura"  action="edit" id="${factura.id}" title="${g.message(code:"editar.factura.label")}"><i class="fa fa-edit"></i></g:link>
                </div>
            </div>

        </h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                 <strong><i class="fa fa-gavel"></i> <g:message code="caso.label"/></strong>: <g:link action="show" controller="caso" id="${factura.caso.id}"> ${factura.caso}</g:link>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <strong><i class="fa fa-user"></i> <g:message code="cliente.label"/></strong>: ${factura.caso.cliente}
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <strong><i class="fa fa-calendar"></i> <g:message code="factura.fecha.label"/></strong>: ${g.formatDate(date:factura.fecha,format:"dd/MM/yyyy")}
            </div>
            <div class="col-lg-4">
                <strong><i class="fa fa-percent"></i> <g:message code="factura.iva.label"/></strong>: ${factura.iva}
            </div>
            <div class="col-lg-4">
                <g:if test="${factura.irpf}">
                    <strong><i class="fa fa-percent"></i> <g:message code="factura.irpf.label"/></strong>: ${factura.irpf}%
                </g:if>
            </div>
        </div>
    </div>
</div>
