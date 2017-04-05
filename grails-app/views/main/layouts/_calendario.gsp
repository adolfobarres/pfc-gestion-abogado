
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-calendar" aria-hidden="true"></i> <g:message code="citas.esta.semana"/></h3>
    </div>
    <div class="panel-body" style="height: 448px;">

        <div id="citasSemana" style="height: 400px;" ></div>
    </div>
</div>

<div id="modificarInfoCita" class="modal fade">
    <g:render template="/cita/layouts/modalEditarCita"/>
</div>

<style>
.fc-content {
    cursor: pointer;
}

 .fc-toolbar h2 {
     margin: 0;
     font-size: 14pt;
 }

</style>
<script>



    $(document).ready(function () {
        $('#citasSemana').fullCalendar({
            header: {
                left: '',
                center: 'title',
                right: 'prev,next today'
            },
            events: '${createLink(controller: "cita", action: "listaCitasJSON")}',
            defaultView: 'agendaDay',
            editable: false,
            firstDay: 1,
            minTime: "09:00:00",
            maxTime: "22:00:00",
            slotDuration: '1:00:00',
            allDaySlot: false,
            eventClick: function(calEvent, jsEvent, view) {
                console.log(calEvent)
                $('#linkBorrar').attr("href", "delete/"+calEvent.id)
                $('#linkCliente').attr("href", "cliente/show/"+calEvent.cliente)
                if(calEvent.realizada == 'N'){
                    $('#linkAsistida').show()
                    $('#linkAsistida').attr("href", "cita/markAsistencia/"+calEvent.id)
                }
                else{
                    $('#linkAsistida').hide()
                }
                $('#linkEditar').attr("href", "edit/"+calEvent.id)
                $('#modificarInfoCita').modal();
            }
        });
    });
</script>

