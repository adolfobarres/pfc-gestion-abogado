<%@ page import="gestion.abogado.Cliente" %>


<script>
    $( function() {

        $( "#clientes" ).keypress(function() {
            $( "#buton-add-cliente" ).prop( "disabled", true );
        });

        $( "#clientes" ).autocomplete({
            source: "<g:createLink controller="cliente" action="listJSON" params="['caso':caso.id]"/>",
            minLength: 2,
            select: function( event, ui ) {
                event.preventDefault()
                $("#idCliente").val(ui.item.value);
                $(this).val(ui.item.label);
                $( "#buton-add-cliente" ).prop( "disabled", false );
            }
        });
    } );
</script>
</head>
<body>

<g:form action="addOtroCliente" controller="caso">
<div class="row">
    <div class="col-lg-4">
        <div class="ui-widget">
            <div class="form-group">
                <label for="clientes"><g:message code="cliente.otros.label"/>: </label>
                <input id="clientes" class="form-control input-sm" placeholder="dni o nombre">
                <input type="hidden" id="idCliente" name="idCliente"/>
                <input type="hidden" name="idCaso" value="${caso.id}"/>
            </div>
        </div>
    </div>
    <div class="col-lg-2" style="padding-top:24px;">
        <input type="submit" value="${g.message(code: "default.button.add")}" class="btn btn-primary btn-sm" id="buton-add-cliente" disabled=""/>
    </div>
</div>
</g:form>


<table class="table table-condensed table-bordered">
    <thead>
        <tr>
            <th></th>
            <th><g:message code="cliente.label"/></th>
            <th><g:message code="clientes.apellidos"/></th>
            <th><g:message code="clientes.nif"/></th>
            <th><g:message code="clientes.email"/></th>
            <th><g:message code="clientes.movil"/></th>
            <th><g:message code="clientes.telefono"/></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><i class="fa fa-asterisk" style="color:green;"></i></td>
            <td>${caso.cliente.nombre}</td>
            <td>${caso.cliente.apellidos}</td>
            <td>${caso.cliente.nif}</td>
            <td>${caso.cliente.email}</td>
            <td>${caso.cliente.movil}</td>
            <td>${caso.cliente.telefono}</td>
            <td></td>
        </tr>
        <g:each var="otroCliente" in="${caso.otrosClientes.sort{it.cliente.apellidos}}">
            <tr>
                <td></td>
                <td>${otroCliente.cliente.nombre}</td>
                <td>${otroCliente.cliente.apellidos}</td>
                <td>${otroCliente.cliente.nif}</td>
                <td>${otroCliente.cliente.email}</td>
                <td>${otroCliente.cliente.movil}</td>
                <td>${otroCliente.cliente.telefono}</td>
                <td><g:link controller="caso" action="deleteOtroCliente" id="${otroCliente.id}" class="alert hollow button"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                            style="padding: 2px;"><i class="fa fa-trash" aria-hidden="true" style="color:red;"></i></g:link>
                </td>
            </tr>
        </g:each>
    </tbody>

</table>