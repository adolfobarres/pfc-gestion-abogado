<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-user" aria-hidden="true"></i> <g:message code="caso.datos.principales"/></h3>
    </div>
    <div class="panel-body">

        <div class="form-group">
            <label for="fechaAlta"><g:message code="caso.fechaAlta"/> <span class="required-indicator">*</span></label>
            <input type="date"  class="form-control input-sm" id="fechaAlta" name="caso.fechaAlta" required="" value="${formatDate(date:caso.fechaAlta,format:'yyyy-MM-dd')}" >
        </div>

        <div class="form-group">
            <label for="cliente"><g:message code="caso.cliente"/> <span class="required-indicator">*</span></label>
            <g:select name="caso.cliente.id"
                      from="${gestion.abogado.Cliente.list()}"
                      value="${caso?.cliente?.id}"
                      optionKey="id"  class="form-control input-sm" />
        </div>

        <div class="form-group">
            <label for="numAsunto"><g:message code="caso.numAsunto"/> <span class="required-indicator">*</span></label>
            <input type="text"  class="form-control input-sm" id="numAsunto" name="caso.numAsunto" required="" value="${caso?.numAsunto}" >
        </div>

        <div class="form-group">
            <label for="tipoAsunto"><g:message code="caso.tipoAsunto"/> <span class="required-indicator">*</span></label>
            <g:select name="caso.tipoAsunto.id"
                      from="${gestion.abogado.TipoAsunto.list()}"
                      value="${caso?.subtipoAsunto?.tipoAsunto?.id}"
                      optionKey="id"  class="form-control input-sm" />
        </div>

        <div class="form-group">
            <label for="subtipoAsunto"><g:message code="caso.subtipoAsunto"/> <span class="required-indicator">*</span></label>
            <g:select name="caso.subtipoAsunto.id"
                      from="${gestion.abogado.SubtipoAsunto.list()}"
                      value="${caso?.subtipoAsunto?.id}"
                      optionKey="id"  class="form-control input-sm" />
        </div>

        <div class="form-group">
            <label for="tipoProcedimiento"><g:message code="caso.tipoProcedimiento"/> <span class="required-indicator">*</span></label>
            <g:select name="caso.procedimiento.id"
                      from="${gestion.abogado.TipoProcedimiento.list()}"
                      value="${caso?.procedimiento?.id}"
                      optionKey="id"  class="form-control input-sm" />
        </div>

        <div class="form-group">
            <label for="juzgado"><g:message code="caso.juzgado"/> <span class="required-indicator">*</span></label>
            <input type="text"  class="form-control input-sm" id="juzgado" name="caso.juzgado" required="" value="${caso?.juzgado}" >
        </div>

    </div>
</div>