
<script>
$(document).ready(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        defaultView: 'listMonth'
    })

});
</script>


<div class="col-lg-6">
    <div class="panel panel-info">
        <div class="panel-heading">
            <strong><i class="fa fa-calendar" aria-hidden="true"></i> <g:message code="citas.cliente.label"></g:message></strong>
        </div>
        <div class="panel-body">
            <div>
                <g:link class="btn btn-default" controller="cita" action="create" params="['idCliente':cliente.id]"><g:message code="cita.nuevo.label"/></g:link>
            </div>
        </div>
        </div>
</div>




