
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-globe" aria-hidden="true"></i> <g:message code="tipoDeAsunto.datos.label"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="descripcion"><g:message code="tipoDeAsunto.descripcion"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="descripcion"  name="descripcion" required="" value="${tipoAsunto?.descripcion}"   >
                </div>
            </div>
        </div>
    </div>
</div>