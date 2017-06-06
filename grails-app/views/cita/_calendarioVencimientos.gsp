<%@ page import="gestion.abogado.Caso" %>


<div class="col-lg-12">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <strong><i class="fa fa-calendar" aria-hidden="true"></i> <g:message
                    code="calendario.vencimientos"></g:message></strong>
        </div>

        <div class="panel-body">
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
            height:500,
            events: '${createLink(controller: "cita", action: "listaVencimientoActuacionesJSON")}',
            defaultView: 'month',
            editable: false,
            firstDay: 1,
            minTime: "09:00:00",
            maxTime: "22:00:00",
            slotDuration: '0:15:00',
            allDaySlot: true,
            eventClick: function(calEvent, jsEvent, view) {
                console.log(calEvent)
                $('#linkShowCaso').attr("href", "../caso/show/"+calEvent.caso)
                $('#verInfoActuacion').modal();
            }
        });
    });
</script>

<div id="verInfoActuacion" class="modal fade">
    <g:render template="layouts/modalVerInfoActuacion"/>
</div>






