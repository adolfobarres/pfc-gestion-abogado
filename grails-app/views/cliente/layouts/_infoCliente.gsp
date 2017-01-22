<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                <strong><i class="fa fa-circle-o" aria-hidden="true"></i> <g:message code="cliente.datos.basicos"></g:message></strong>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <strong><g:message code="clientes.nombre"/>:</strong> ${cliente?.nombre} ${cliente.apellidos}
                    </div>
                    <div class="col-lg-6">
                        <strong><g:message code="clientes.nif"/>:</strong> ${cliente?.nif}
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <strong><g:message code="clientes.email"/>:</strong> ${cliente?.email}
                    </div>
                    <div class="col-lg-3">
                        <strong><g:message code="clientes.telefono"/>:</strong> ${cliente?.telefono}
                    </div>
                    <div class="col-lg-3">
                        <strong><g:message code="clientes.movil"/>:</strong> ${cliente?.movil}
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                            <strong><g:message code="clientes.direccion"/>:</strong>
                            ${cliente?.direccion}, ${cliente?.poblacion} (${cliente?.provincia}), ${cliente?.cp}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>