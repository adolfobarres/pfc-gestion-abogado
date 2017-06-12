<div class="row">
    <div class="col-lg-6">
        <div class="form-group">
            <label for="descripcion"><g:message code="conceptoFactura.descripcion.label"/></label>
            <input type="text" class="form-control" id="descripcion" name="conceptoFactura.descripcion" required="" value="${concepto?.descripcion}">
        </div>
    </div>
    <div class="col-lg-4">
        <div class="form-group">
            <label for="importe"><g:message code="conceptoFactura.importe.label"/></label>
            <input type="number decimal" step="0.01" min="0" class="form-control" id="importe" name="conceptoFactura.importe" required="" value="${fieldValue(bean: concepto, field: 'importe')}">
        </div>
    </div>
    <div class="col-lg-2">
        <div class="form-group">
            <label for="suplido"><g:message code="conceptoFactura.esSuplido.label"/></label>
            <div class="input-group">
                <g:checkBox name="conceptoFactura.esSuplido" value="${conceptoFactura?.esSuplido}" id="suplido"/>
            </div>
        </div>
    </div>
</div>






