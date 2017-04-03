<script>
    function tipoAsuntoChanged(tipoId) {
        jQuery.ajax({type:'POST',
            data:'tipoId='+tipoId,
            url:'${createLink(action: 'getSubtipos',controller:'tipoAsunto')}',
            success:function(data,textStatus){jQuery('#divSubtipos').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
    }
</script>

<g:if test="${caso.numAsunto}">
    <g:set var="numero" value="${caso.numAsunto}"/>
</g:if>
<g:else>
    <g:set var="numero" value="${numAsunto}"/>
</g:else>

<div class="panel panel-info">
    <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-user" aria-hidden="true"></i> <g:message code="caso.datos.principales"/></h3>
    </div>
    <div class="panel-body">

        <g:if test="${actionName == 'create'}">
            <g:set var="fecha" value="${new Date()}"/>
        </g:if>
        <g:elseif test="${actionName == 'edit'}">
            <g:set var="fecha" value="${caso.fechaAlta}"/>
        </g:elseif>

        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="fechaAlta"><g:message code="caso.fechaAlta.label"/> <span class="required-indicator">*</span></label>
                    <input type="date"  class="form-control input-sm" id="fechaAlta" name="caso.fechaAlta" required="" value="${formatDate(date:fecha,format:'yyyy-MM-dd')}" >
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="numAsunto"><g:message code="caso.numAsunto.label"/> <span class="required-indicator">*</span></label>
                    <input type="text"  class="form-control input-sm" id="numAsunto" name="caso.numAsunto" required="" value="${numero}" >
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="form-group">
                    <label for="cliente"><g:message code="caso.cliente.label"/> <span class="required-indicator">*</span></label>
                    <g:select name="caso.cliente.id"
                              from="${gestion.abogado.Cliente.list()}"
                              value="${caso?.cliente?.id}"
                              optionKey="id"  class="form-control input-sm" />
                </div>
            </div>
        </div>

        <hr>

        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="tipoAsunto"><g:message code="caso.tipoAsunto.label"/> <span class="required-indicator">*</span></label>
                    <g:select name="caso.tipoAsunto.id"
                              from="${gestion.abogado.TipoAsunto.list().sort{it.descripcion}}"
                              value="${caso?.subtipoAsunto?.tipoAsunto?.id}"
                              optionKey="id"  class="form-control input-sm"
                              onchange="tipoAsuntoChanged(this.value);"  required=""/>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="subtipoAsunto"><g:message code="caso.tipoAsunto.label"/> <span class="required-indicator">*</span></label>
                    <div id="divSubtipos">
                        <g:if test="${actionName == 'create'}">
                            <g:render template="layouts/subtiposAsunto" model="['gspSubtipos':gestion.abogado.TipoAsunto.list().sort{it.descripcion}.first().subtipos]"/>
                        </g:if>
                        <g:else>
                            <g:render template="layouts/subtiposAsunto" model="['gspSubtipos':gspSubtipos]"/>
                        </g:else>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="tipoProcedimiento"><g:message code="caso.procedimiento.label"/> <span class="required-indicator">*</span></label>
                    <g:select name="caso.procedimiento.id"
                              from="${gestion.abogado.TipoProcedimiento.list()}"
                              value="${caso?.procedimiento?.id}"
                              optionKey="id"  class="form-control input-sm" />
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-group">
                    <label for="juzgado"><g:message code="caso.juzgado.label"/> <span class="required-indicator">*</span></label>
                    <input type="text"  class="form-control input-sm" id="juzgado" name="caso.juzgado" required="" value="${caso?.juzgado}" >
                </div>
            </div>
        </div>



    </div>
</div>