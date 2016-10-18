<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-user" aria-hidden="true"></i> <g:message code="actuacion.datos.principales"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="fechaAlta"><g:message code="actuacion.fechaAlta"/> <span class="required-indicator">*</span></label>
                    <input type="date"  class="form-control input-sm" id="fechaAlta" name="actuacion.fechaAlta" required="" value="${actuacion?.fechaAlta}" >
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="fechaVencimiento"><g:message code="actuacion.fechaVencimiento"/> <span class="required-indicator">*</span></label>
                    <input type="date"  class="form-control input-sm" id="fechaVencimiento" name="actuacion.fechaVencimiento"  value="${actuacion?.fechaVencimiento}" >
                </div>
            </div>
        </div>


        <div class="form-group">
            <label for="descripcion"><g:message code="actuacion.descripcion"/> <span class="required-indicator">*</span></label>
            <input type="text"  class="form-control input-sm" id="descripcion" name="actuacion.descripcion" required="" value="${actuacion?.descripcion}" >
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="estadoActuacion"><g:message code="actuacion.estadoActuacion"/> <span class="required-indicator">*</span></label>
                    <g:select name="actuacion.estadoActuacion.id"
                              from="${gestion.abogado.EstadoActuacion.list()}"
                              value="${actuacion?.estadoActuacion?.id}"
                              optionKey="id"  class="form-control input-sm" id="estadoActuacion" />
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="prioridad"><g:message code="actuacion.prioridad"/> <span class="required-indicator">*</span></label>
                    <g:select name="actuacion.prioridad.id"
                              from="${gestion.abogado.Prioridad.list()}"
                              value="${actuacion?.prioridad?.id}"
                              optionKey="id"  class="form-control input-sm" id="prioridad" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="notas"><g:message code="actuacion.notas"/> <span class="required-indicator">*</span></label>
            <textarea  class="form-control"  rows="4" id="notas" name="actuacion.notas"  value="${actuacion?.notas}" ></textarea>
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="fechaFin"><g:message code="actuacion.fechaFin"/> <span class="required-indicator">*</span></label>
                    <input type="date"  class="form-control input-sm" id="fechaFin" name="actuacion.fechaFin"  value="${actuacion?.fechaFin}" >
                </div>
            </div>
        </div>

    </div>
</div>