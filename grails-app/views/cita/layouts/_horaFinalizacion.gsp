
<div class="col-lg-6">
<div class="form-group">
    <label for="dia"><g:message code="cita.horaFin.label"/></label>
    <input type="text" readonly="" id="dia" name="horaFin" class="form-control" value="${horaFinal}"/>
    <g:if test="${gspMensaje != ''}">
         <span style="color:red;"><i class="fa fa-clock-o" aria-hidden="true"></i> ${gspMensaje}</span>
    </g:if>
</div>
</div>

