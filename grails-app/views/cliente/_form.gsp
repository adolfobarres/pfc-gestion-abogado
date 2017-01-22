
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-user" aria-hidden="true"></i> <g:message code="clientes.datos.personales"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="nif"><g:message code="clientes.nif"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="nif"  name="nif" required="" value="${cliente?.nif}"   >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="nombre"><g:message code="clientes.nombre"/> <span class="required-indicator">*</span></label>
                    <input type="text"  class="form-control input-sm" id="nombre" name="nombre" required="" value="${cliente?.nombre}" >
                </div>
            </div>
            <div class="col-lg-8">
                <div class="form-group">
                    <label for="apellidos"><g:message code="clientes.apellidos"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="apellidos"  name="apellidos" required="" value="${cliente?.apellidos}">
                </div>
            </div>
        </div>
    </div>
</div>



<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-at" aria-hidden="true"></i> <g:message code="clientes.contacto"/></h3>
    </div>
    <div class="panel-body">

        <div class="row">
            <div class="col-lg-8">
                <div class="form-group">
                    <label for="email"><g:message code="clientes.email"/> <span class="required-indicator">*</span></label>
                    <input type="email" class="form-control input-sm" id="email"  name="email" required="" value="${cliente?.email}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="telefono"><g:message code="clientes.telefono"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="telefono"  name="telefono" required="" value="${cliente?.telefono}">
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="movil"><g:message code="clientes.movil"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="movil"  name="movil" required="" value="${cliente?.movil}">
                </div>
            </div>
        </div>
    </div>
</div>


<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-home" aria-hidden="true"></i> <g:message code="clientes.direccion"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="pais"><g:message code="clientes.pais"/> <span class="required-indicator">*</span></label>
                    <g:countrySelect name="pais" value="${cliente?.pais}"
                                     noSelection="['es':'España']" class="form-control input-sm" required="" />
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="provincia"><g:message code="clientes.provincia"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="provincia"  name="provincia" required="" value="${cliente?.provincia}">
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="cp"><g:message code="clientes.cp"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="cp"  name="cp" required="" value="${cliente?.cp}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="poblacion"><g:message code="clientes.poblacion"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="poblacion"  name="poblacion" required="" value="${cliente?.poblacion}">
                </div>
            </div>
            <div class="col-lg-8">
                <div class="form-group">
                    <label for="direccion"><g:message code="clientes.direccion"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="direccion"  name="direccion" required="" value="${cliente?.direccion}">
                </div>
            </div>
        </div>
    </div>
</div>