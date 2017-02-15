<%@ page import="gestion.abogado.Caso" %>
<div class="col-lg-12">
    <div class="panel panel-info">
        <div class="panel-heading">
            <strong><i class="fa fa-calendar" aria-hidden="true"></i> <g:message
                    code="calendario.citas"></g:message></strong>
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col-lg-12">
                    <g:if test="${cliente}">
                        <strong><g:message code="cliente.label"/>:</strong> ${cliente}
                    </g:if>

                    <g:if test="${params.idCaso}">
                        <br>
                        <strong><g:message code="caso.label"/>:</strong> ${gestion.abogado.Caso.get(params.idCaso)}
                    </g:if>

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
<style>
.fc-content {
    cursor: pointer;
}
</style>
<script>



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
            slotDuration: '0:15:00',
            allDaySlot: false,
            dayClick: function (date, jsEvent, view) {
                $('#diaSeleccionado').val(date.format("DD-MM-YYYY"));
                $('#diaCita').val(date.format("dddd DD MMMM YYYY"));
                $('#horaSeleccionada').val(date.format("HH:mm"));
                $('#horaInicio').val(date.format("HH:mm"));
                var parametros = '';

                parametros = "?dia="+date.format("DD-MM-YYYY");
                parametros += "&hora="+date.format("HH:mm");

                <g:if test="${params.idCaso}">
                    parametros += '&idCaso='+${params.idCaso};
                </g:if>
                <g:if test="${params.idCliente}">
                    parametros += '&idCliente='+${params.idCliente};
                </g:if>
                $('#linkAdd').attr("href", "addCita"+parametros);
                $('#fullCalModal').modal();
            },

            eventClick: function(calEvent, jsEvent, view) {
                $('#linkBorrar').attr("href", "delete/"+calEvent.id)
                $('#linkEditar').attr("href", "edit/"+calEvent.id)
                $('#modificarInfoCita').modal();
            }
        });
    });
</script>

<div id="fullCalModal" class="modal fade">
    <g:render template="layouts/modalCrearCita"/>
</div>

<div id="modificarInfoCita" class="modal fade">
    <g:render template="layouts/modalEditarCita"/>
</div>






