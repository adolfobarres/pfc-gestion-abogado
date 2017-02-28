<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><g:message code="factura.label"/>: <sgtrong>${factura.numero}</sgtrong></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                <strong><g:message code="caso.label"/></strong>: ${factura.caso}
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <strong><g:message code="cliente.label"/></strong>: ${factura.caso.cliente}
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <strong><g:message code="factura.fecha.label"/></strong>: ${g.formatDate(date:factura.fecha,format:"dd/MM/yyyy")}
            </div>
            <div class="col-lg-4">
                <strong><g:message code="factura.iva.label"/></strong>: ${factura.iva}%
            </div>
            <div class="col-lg-4">
                <g:if test="${factura.irpf}">
                    <strong><g:message code="factura.irpf.label"/></strong>: ${factura.irpf}%
                </g:if>
            </div>
        </div>
    </div>
</div>
