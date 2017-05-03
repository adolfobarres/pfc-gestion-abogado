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



    <div class="panel panel-primary">
        <div class="panel-heading">
            <i class="fa fa-calendar" aria-hidden="true"></i> <g:message code="citas.cliente.label"></g:message>
        </div>
        <div class="panel-body" style="height:300px;overflow-y:auto;">

            <div id="calendar">

            </div>
        </div>
        <div class="panel-footer" style="text-align: right;"><g:link class="btn btn-default btn-sm" controller="cita" action="create" params="['idCliente':cliente.id]"><i class="fa fa-plus"></i> <g:message code="cita.nuevo.label"/></g:link></div>
        </div>




