
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-file-o" aria-hidden="true"></i> <g:message code="fichero.datos"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="nombre"><g:message code="fichero.nombre"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="nombre"  name="nombre" required="" value="${fichero?.nombre}"   >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="descripcion"><g:message code="fichero.descripcion"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="descripcion"  name="descripcion" required="" value="${fichero?.descripcion}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="nombre"><g:message code="fichero.notas"/> <span class="required-indicator">*</span></label>
                    <textarea class="form-control" rows="5" id="nota" name="notas" required="" value="${fichero?.notas}" ></textarea>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="file"><g:message code="fichero.file"/> <span class="required-indicator">*</span></label>
                    <input type="file" class="form-control input-sm" id="file"  name="file" required="" value="${fichero?.file}">
                </div>
            </div>
        </div>
        <hr>
        <input type="submit" value="${g.message(code:"fichero.subir")}" class="btn btn-success">
    </div>
</div>

<g:if test="${params.idCaso}">
    <input type="hidden" name="idCaso" value="${params.idCaso}"/>
</g:if>

