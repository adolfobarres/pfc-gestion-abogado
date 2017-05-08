
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-globe" aria-hidden="true"></i> <g:message code="estadoActuacion.datos.label"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="codigo"><g:message code="estadoActuacion.codigo"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="codigo"  name="codigo" required="" value="${estadoActuacion?.codigo}"   >
                </div>
            </div>
            <div class="col-lg-8">
                <div class="form-group">
                    <label for="descripcion"><g:message code="estadoActuacion.descripcion"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="descripcion"  name="descripcion" required="" value="${estadoActuacion?.descripcion}"   >
                </div>
            </div>
        </div>
    </div>
</div>