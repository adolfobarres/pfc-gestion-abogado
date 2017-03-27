<style>
.fc-toolbar h2 {
    margin: 0;
    font-size:14pt;
}
</style>

<script>
$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        height:240,
        header:{
            left: 'today prev,next',
            center: '',
            right:  'title'
        },
        defaultView: 'listMonth',
        events: '${createLink(action: 'listaCitasJSON',controller:'cita',params:['idCliente':cliente.id])}'
    })

});
</script>



    <div class="panel panel-info" style="height:400px;overflow-y:auto;">
        <div class="panel-heading">
            <strong><i class="fa fa-calendar" aria-hidden="true"></i> <g:message code="citas.cliente.label"></g:message></strong>
        </div>
        <div class="panel-body">
            <g:link class="btn btn-default" controller="cita" action="create" params="['idCliente':cliente.id]"><g:message code="cita.nuevo.label"/></g:link>
            <hr>
            <div id="calendar">

            </div>
        </div>
        </div>




