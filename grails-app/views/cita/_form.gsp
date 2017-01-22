<div class="col-lg-12">
    <div class="panel panel-info">
        <div class="panel-heading">
            <strong><i class="fa fa-calendar" aria-hidden="true"></i> <g:message code="cli"></g:message></strong>
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
                    <div class="form-group">
                        <label for="tipoCita"><g:message code="tipoCita.label"/> <span class="required-indicator">*</span></label>
                        <g:select name="cita.tipoCita.id"
                                  from="${gestion.abogado.TipoCita.list().sort{it.codigo}}"
                                  value="${cita?.tipoCita?.id}"
                                  optionKey="id"  class="form-control input-sm" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div id="calendario-semanas"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>

    $(document).ready(function() {

        $('#calendario-semanas').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultView: 'agendaWeek',
            editable: true,
            minTime: "09:00:00",
            maxTime: "22:00:00",
            slotDuration: '0:30:00',
            events: [

            ],
            dayClick: function(date, jsEvent, view) {

                alert('Clicked on: ' + date.format());

                alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

                alert('Current view: ' + view.name);

                // change the day's background color just for fun
                $(this).css('background-color', 'red');

            }

        });

    });

</script>






