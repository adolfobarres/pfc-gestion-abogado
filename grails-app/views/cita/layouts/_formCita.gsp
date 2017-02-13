<script>
    function tipoCitaChanged(tipoId, dia, hora) {
        jQuery.ajax({
            type: 'POST',
            data: 'tipoId=' + tipoId + '&dia=' + dia.value+'&hora='+hora.value,
            url: '${createLink(action: 'getHorasDisponibles',controller:'cita')}',
            success: function (data, textStatus) {
                jQuery('#divHoras').html(data);
            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
            }
        });
    }
</script>

<g:if test="${params.dia}">
    <input type="hidden" name="cita.fecha" id="diaSeleccionado" value="${params.dia}"/>
</g:if>
<g:if test="${params.hora}">
    <input type="hidden" name="horaSeleccionada" id="horaSeleccionada" value="${params.hora}"/>
</g:if>

<input type="hidden" id="cliente" name="cita.cliente.id" value="${cliente.id}"/>
<g:if test="${params.idCaso}">
    <input type="hidden" id="caso" name="cita.caso.id" value="${params.idCaso.toLong()}"/>
</g:if>

<div class="row">
    <div class="col-lg-12">
        <div class="form-group">
            <label for="clienteNombre"><g:message code="cliente.label"/></label>
            <input type="text" readonly="" id="clienteNombre" class="form-control" value="${cliente}"/>
        </div>
    </div>
</div>
<g:if test="${params.idCaso}">
    <div class="row">
        <div class="col-lg-12">
            <div class="form-group">
                <label for="clienteNombre"><g:message code="caso.label"/></label>
                <input type="text" readonly="" id="casoDesc" class="form-control"
                       value="${gestion.abogado.Caso.get(params.idCaso)}"/>
            </div>
        </div>
    </div>
</g:if>

<div class="row">
    <div class="col-lg-6">
        <div class="form-group">
            <label for="diaCita"><g:message code="cita.dia.label"/></label>
            <g:if test="${params.dia}">
                <input type="text" readonly="" id="diaCita" class="form-control" value="${params.dia}"/>
            </g:if>

        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label for="horaInicio"><g:message code="cita.horaInicio.label"/></label>
            <g:if test="${params.hora}">
                <input type="text" readonly="" id="horaInicio" class="form-control" value="${params.hora}"/>
            </g:if>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="form-group">
            <label for="tipoCita"><g:message code="tipoCita.label"/>
                <span class="required-indicator">*</span></label>
            <g:select name="cita.tipoCita.id" noSelection="${['': '--Selecciona un tipo--']}"
                      id="tipoCita"
                      from="${gestion.abogado.TipoCita.list().sort { it.codigo }}"
                      value="${cita?.tipoCita?.id}"
                      optionKey="id" class="form-control input-sm"
                      onchange="tipoCitaChanged(this.value,document.getElementById('diaSeleccionado'),document.getElementById('horaSeleccionada'));"
                      required=""/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-6" id="divHoras">

    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="form-group">
            <label for="descripcion"><strong><g:message code="cita.descripcion.label"/> <span
                    class="required-indicator">*</span></strong></label>
            <input type="text" class="form-control" id="descripcion" required="" name="cita.titulo" value="${cita.titulo}"/>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="form-group">
            <label for="descripcion"><strong><g:message code="cita.notas.label"/> </strong></label>
            <textarea class="form-control" rows="3" name="notas" id="notas"></textarea>
        </div>
    </div>
</div>

