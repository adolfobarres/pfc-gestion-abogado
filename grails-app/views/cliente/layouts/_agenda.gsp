
<script>
$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        defaultView: 'listYear',
        events: '${createLink(action: 'listaCitasJSON',controller:'cita',params:['idCliente':cliente.id])}'
    })

});
</script>



    <div class="panel panel-info" style="height:300px;overflow-y:auto;">
        <div class="panel-heading">
            <strong><i class="fa fa-calendar" aria-hidden="true"></i> <g:message code="citas.cliente.label"></g:message></strong>
        </div>
        <div class="panel-body">
            <div id="calendar">
                <g:link class="btn btn-default" controller="cita" action="create" params="['idCliente':cliente.id]"><g:message code="cita.nuevo.label"/></g:link>
            </div>
        </div>
        </div>




