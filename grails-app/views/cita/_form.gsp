<div class="col-lg-12">
    <div class="panel panel-info">
        <div class="panel-heading">
            <strong><i class="fa fa-calendar" aria-hidden="true"></i> <g:message
                    code="cliente.asignar.cita"></g:message></strong>
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col-lg-12">
                    <strong><g:message code="cliente.label"/></strong>: ${cliente}
                    <hr>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div id="bootstrapModalFullCalendar"></div>
                </div>
            </div>

        </div>
    </div>
</div>

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


    $(document).ready(function () {
        $('#bootstrapModalFullCalendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            events: '${createLink(controller: "cita", action: "listaCitasJSON")}',
            defaultView: 'agendaWeek',
            editable: false,
            firstDay: 1,
            minTime: "09:00:00",
            maxTime: "22:00:00",
            slotDuration: '0:30:00',
            allDaySlot: false,
            dayClick: function (date, jsEvent, view) {
                $('#diaSeleccionado').val(date.format("DD-MM-YYYY"));
                $('#diaCita').val(date.format("dddd DD MMMM YYYY"));
                $('#horaSeleccionada').val(date.format("HH:mm"));
                $('#horaInicio').val(date.format("HH:mm"));
                $('#fullCalModal').modal();
            }
        });
    });
</script>

<div id="fullCalModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span
                        class="sr-only">close</span></button>
                <h4 id="modalTitle" class="modal-title"><g:message code="selecciona.hora.cita"/></h4>
            </div>

        <div id="modalBody" class="modal-body">
            <g:form action="save">
                <input type="hidden" name="cita.fecha" id="diaSeleccionado"/>
                <input type="hidden" name="horaSeleccionada" id="horaSeleccionada"/>
                <input type="hidden" id="cliente" name="cita.cliente.id" value="${cliente.id}"/>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="dia"><g:message code="cliente.label"/></label>
                            <input type="text" readonly="" id="clienteNombre" class="form-control" value="${cliente}"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="dia"><g:message code="cita.dia.label"/></label>
                            <input type="text" readonly="" id="diaCita" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="dia"><g:message code="cita.horaInicio.label"/></label>
                            <input type="text" readonly="" id="horaInicio" class="form-control"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="tipoCita"><g:message code="tipoCita.label"/>
                                <span class="required-indicator">*<span/></label>
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
                            <input type="text" class="form-control" id="descripcion" required="" name="cita.titulo"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="descripcion"><strong><g:message code="cita.descripcion.label"/> <span
                                    class="required-indicator">*</span></strong></label>
                            <textarea class="form-control" rows="3" name="notas"></textarea>
                        </div>
                    </div>
                </div>






            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><g:message
                        code="default.close.label"/></button>
                <button class="btn" type="submit"><g:message code="default.button.create.label"/></button>
            </div>
                    </g:form>
        </div>
    </div>
</div>






