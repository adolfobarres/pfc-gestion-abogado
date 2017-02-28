<g:if test="${factura.fecha}">
        <g:set var="fecha" value="${factura.fecha}"/>
</g:if>
<g:else>
        <g:set var="fecha" value="${new Date()}"/>
</g:else>
<g:if test="${!factura.iva}">
    <g:set var="iva" value="${gestion.abogado.MainInfo.list().first().iva}"/>
</g:if>
<g:else>
    <g:set var="iva" value="${factura.iva}"/>
</g:else>

<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-money" aria-hidden="true"></i> <g:message code="factura.datos.principales"/></h3>
    </div>
    <div class="panel-body">

        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="caso"><g:message code="caso.label"/> <span class="required-indicator">*</span></label>
                    <input type="text"  class="form-control input-sm" id="caso" name="caso.text" readonly="" value="${caso}" >
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="form-group">
                    <label for="cliente"><g:message code="cliente.label"/> <span class="required-indicator">*</span></label>
                    <input type="text"  class="form-control input-sm" id="cliente" name="cliente.text" readonly="" value="${caso?.cliente}" >
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="numFactura"><g:message code="factura.numero.label"/> <span class="required-indicator">*</span></label>
                    <input type="text"  class="form-control input-sm" id="numFactura" name="factura.numero" required="" value="${numFactura}" >
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="fechaFactura"><g:message code="factura.fecha.label"/> <span class="required-indicator">*</span></label>
                    <input type="date"  class="form-control input-sm" id="fechaFactura" name="factura.fecha" required="" value="${formatDate(date:fecha,format:'yyyy-MM-dd')}"  >
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4">
                <label for="iva"><g:message code="factura.iva.label"/> <span class="required-indicator">*</span></label>
                <div class="input-group">
                    <input type="number" step="1" min="0" max="100" class="form-control input-s m" id="iva" name="factura.iva" required="" value="${iva}" >
                    <span class="input-group-addon" id="basic-addon1">%</span>
                </div>
            </div>
            <div class="col-lg-4">
                <label for="irpf"><g:message code="factura.irpf.label"/> </label>
                <div class="input-group">
                    <input type="number" step="1" min="0" max="100"  class="form-control input-sm" id="irpf" name="factura.irpf"  value="${factura?.irpf}" >
                    <span class="input-group-addon" id="basic-addon2">%</span>
                </div>
            </div>
        </div>

    </div>
</div>