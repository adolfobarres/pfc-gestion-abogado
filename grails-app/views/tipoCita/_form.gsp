
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-globe" aria-hidden="true"></i> <g:message code="tipoCita.datos.label"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-2">
                <div class="form-group">
                    <label for="descripcion"><g:message code="tipoCita.codigo"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="codigo"  name="codigo" required="" value="${tipoCita?.codigo}"   >
                </div>
            </div>
            <div class="col-lg-10">
                <div class="form-group">
                    <label for="descripcion"><g:message code="tipoCita.descripcion"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="descripcion"  name="descripcion" required="" value="${tipoCita?.descripcion}"   >
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-2">
                <div class="form-group">
                    <label for="duracionMediaHoras"><g:message code="tipoCita.duracionMediaHoras"/> <span class="required-indicator">*</span></label>
                    <input type="number" step="1" min="0" max="24" class="form-control input-sm" id="duracionMediaHoras"  name="duracionMediaHoras" required="" value="${tipoCita?.duracionMediaHoras}"   >
                </div>
            </div>
            <div class="col-lg-2">
                <div class="form-group">
                    <label for="duracionMediaMinutos"><g:message code="tipoCita.duracionMediaMinutos"/> <span class="required-indicator">*</span></label>
                    <input type="number" step="1" min="0" max="59" class="form-control input-sm" id="duracionMediaMinutos"  name="duracionMediaMinutos" required="" value="${tipoCita?.duracionMediaMinutos}"   >
                </div>
            </div>

        </div>
    </div>
</div>