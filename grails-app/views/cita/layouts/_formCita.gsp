<%@ page import="gestion.abogado.Cliente" %>
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

    function clienteChanged(idCliente) {
        jQuery.ajax({
            type: 'POST',
            data: 'idCliente=' + idCliente,
            url: '${createLink(action: 'getCasos',controller:'cliente')}',
            success: function (data, textStatus) {
                jQuery('#divCaso').html(data);
            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
            }
        });
    }

</script>

<g:if test="${params.dia}">
  <g:set var="dia" value="${params.dia}"/>
</g:if>
<g:if test="${cita.fecha}">
    <g:set var="dia" value="${g.formatDate(date:cita.fecha,format:"dd-MM-yyyy")}"/>
</g:if>
<g:if test="${params.hora}">
   <g:set var="hora" value="${params.hora}"/>
</g:if>
<g:if test="${cita.id}">
    <g:set var="hora" value="${cita.comienzo}"/>
</g:if>
<g:if test="${params.idCaso}">
    <g:set var="idCaso" value="${params.idCaso}"/>
</g:if>
<g:if test="${cita.caso}">
    <g:set var="idCaso" value="${cita.caso.id}"/>
</g:if>
<g:if test="${cliente}">
    <g:set var="idCliente" value="${cliente.id}"/>
</g:if>

<input type="hidden" name="cita.fecha" id="diaSeleccionado" value="${dia}"/>
<input type="hidden" name="horaSeleccionada" id="horaSeleccionada" value="${hora}"/>


<div class="row">
    <div class="col-lg-12">
        <div class="form-group">
            <label for="clienteNombre"><g:message code="cliente.label"/></label>
            <g:select id="clienteNombre" name='cita.cliente.id' value="${idCliente}"
                      noSelection="${['':'--Selecciona un Cliente--']}"
                      from='${gestion.abogado.Cliente.list().sort{it.nif}}' required=""
                      optionKey="id" optionValue="nifYNombre" class="form-control" onChange="clienteChanged(this.value)"></g:select>
        </div>
    </div>
</div>


<div id="divCaso">
    <g:if test="${cliente}">
        <g:if test="${idCaso}">
            <g:render template="layouts/cmbCasos" model="['gspCasos':gestion.abogado.Caso.get(idCaso).cliente.casos.sort{it.numAsunto},'gspIdCaso':idCaso]"/>
        </g:if>
        <g:else>
            <g:if test="${idCliente}">
                <g:render template="layouts/cmbCasos" model="['gspCasos':gestion.abogado.Cliente.get(idCliente).casos.sort{it.numAsunto}]"/>
            </g:if>
        </g:else>

    </g:if>
</div>

<div class="row">
    <div class="col-lg-6">
        <div class="form-group">
            <label for="diaCita"><g:message code="cita.dia.label"/></label>
            <g:if test="${dia}">
                <input type="text" readonly="" id="diaCita" class="form-control" value="${dia}"/>
            </g:if>

        </div>
    </div>

    <div class="col-lg-6">
        <div class="form-group">
            <label for="horaInicio"><g:message code="cita.horaInicio.label"/></label>
            <g:if test="${hora}">
                <input type="text" readonly="" id="horaInicio" class="form-control" value="${hora}"/>
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

<div class="row" id="divHoras">
    <g:if test="${cita.id}">
        <g:render template="layouts/horaFinalizacion" model="['horaFinal':cita.fin,'gspMensaje':'']"/>
    </g:if>

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

