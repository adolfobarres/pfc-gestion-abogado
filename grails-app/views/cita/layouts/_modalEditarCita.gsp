<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span
                    class="sr-only">close</span></button>
            <h4 id="modalTitle" class="modal-title"><g:message code="opciones.cita"/></h4>
        </div>

        <div id="modalBody" class="modal-body">
            <a href="#" id="linkEditar" class="btn btn-primary btn-lg btn-block"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <g:message code="cita.editar.label"/></a>
            <a href="#" id="linkCliente" class="btn btn-primary btn-lg btn-block"><i class="fa fa-user" aria-hidden="true"></i> <g:message code="cita.verfichacliente.label"/></a>
            <a href="#" id="linkAsistida" class="btn btn-primary btn-lg btn-block"><i class="fa fa-check-square-o" aria-hidden="true"></i> <g:message code="cita.marcarcomoasistida.label"/></a>
            <hr>

            <a href="#" id="linkBorrar" class="btn btn-danger btn-lg btn-block" onclick="return confirm('¿Estás seguro?')"><i class="fa fa-trash" aria-hidden="true"></i> <g:message code="cita.borrar.label"/></a>
        </div>

    </div>
</div>