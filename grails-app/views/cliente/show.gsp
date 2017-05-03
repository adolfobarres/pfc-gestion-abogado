<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="loginPage" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>


    <div class="row-fluid">
        <div class="col-lg-10 col-lg-offset-1">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:render template="/cliente/layouts/infoCliente"/>

            <div class="row" id="casos">
                <div class="col-lg-6" >
                    <g:render template="/cliente/layouts/listaCasos" model="['cliente':cliente]"/>

                </div>
                <div class="col-lg-6" id="citas">
                    <g:render template="/cliente/layouts/agenda" />
                </div>
            </div>
            <div class="row" id="facturas">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="margin-bottom:10px;">
                            <i class="fa fa-money" aria-hidden="true"></i> <g:message code="cliente.facturas"></g:message>
                        </div>

                    <g:render template="/factura/layouts/listaFacturas" model="['facturas':cliente?.casos?.facturas.flatten()]"/>
                    </div>
                </div>
            </div>

            <div class="row" id="documentos">
                <div class="col-lg-12">

                            <g:render template="/cliente/layouts/listaFicheros" model="['cliente':cliente]"/>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
    </body>
</html>
