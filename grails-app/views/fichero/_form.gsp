<%@ page import="gestion.abogado.Actuacion; gestion.abogado.Caso" %>

<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-file-o" aria-hidden="true"></i> <g:message code="fichero.datos"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="nombre"><g:message code="fichero.titulo"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="nombre"  name="nombre" required="" value="${fichero?.nombre}"   >
                </div>
            </div>
            <g:if test="${params.idCaso}">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="actuacion"><g:message code="fichero.actuacion"/></label>
                        <g:select name="actuacion"
                                  id="actuacion"
                                  from="${actuaciones}"
                                  optionKey="id" noSelection="['':'--']"
                                  class="form-control input-sm"/>
                    </div>
                </div>
            </g:if>
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
                    <label for="nombre"><g:message code="fichero.notas"/> </label>
                    <textarea class="form-control" rows="5" id="nota" name="notas" value="${fichero?.notas}" ></textarea>
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
    </div>
</div>

<g:if test="${params.idCaso}">
    <input type="hidden" name="idCaso" value="${params.idCaso}"/>
</g:if>

<g:if test="${params.idCliente}">
    <input type="hidden" name="idCliente" value="${params.idCliente}"/>
</g:if>
