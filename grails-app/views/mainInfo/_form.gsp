
<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-globe" aria-hidden="true"></i> <g:message code="mainInfo.datos.principales"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="nombreDespacho"><g:message code="maininfo.nombre.despacho"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="nombreDespacho"  name="nombreDespacho" required="" value="${mainInfo?.nombreDespacho}"   >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="tituloDespacho"><g:message code="maininfo.nombre.titulo"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="tituloDespacho"  name="tituloDespacho" required="" value="${mainInfo?.tituloDespacho}"   >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="subtituloDespacho"><g:message code="maininfo.nombre.subtitulo"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="subtituloDespacho"  name="subtituloDespacho" required="" value="${mainInfo?.subtituloDespacho}"   >
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
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="direccion"><g:message code="maininfo.direccion"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="direccion"  name="direccion" required="" value="${mainInfo?.direccion}"   >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="telefono"><g:message code="maininfo.telefono"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="telefono"  name="telefono" required="" value="${mainInfo?.telefono}"   >
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="movil"><g:message code="maininfo.movil"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="movil"  name="movil" required="" value="${mainInfo?.movil}"   >
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="fax"><g:message code="maininfo.fax"/> </label>
                    <input type="text" class="form-control input-sm" id="fax"  name="fax"  value="${mainInfo?.fax}"   >
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="email"><g:message code="maininfo.email"/> <span class="required-indicator">*</span></label>
                    <input type="email" class="form-control input-sm" id="email"  name="email" required="" value="${mainInfo?.email}"   >
                </div>
            </div>
        </div>
    </div>
</div>

<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-money" aria-hidden="true"></i> <g:message code="informacion.fiscal"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="cif"><g:message code="maininfo.cif"/> <span class="required-indicator">*</span></label>
                    <input type="text" class="form-control input-sm" id="cif"  name="cif" required="" value="${mainInfo?.cif}"   >
                </div>
            </div>
            <div class="col-lg-4">
                <label for="irpf"><g:message code="factura.iva.label"/> </label>
                <div class="input-group">
                    <input type="number" step="1" min="0" max="100"  class="form-control input-sm" id="iva" name="iva" required=""  value="${mainInfo?.iva}" >
                    <span class="input-group-addon" id="basic-addon1">%</span>
                </div>
            </div>
            <div class="col-lg-4">
                <label for="irpf"><g:message code="factura.irpf.label"/> </label>
                <div class="input-group">
                    <input type="number" step="1" min="0" max="100"  class="form-control input-sm" id="irpf" name="irpf" required="" value="${mainInfo?.irpf}" >
                    <span class="input-group-addon" id="basic-addon2">%</span>
                </div>
            </div>
        </div>
    </div>
</div>
