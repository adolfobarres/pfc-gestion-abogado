<table class="table table-condensed table-hover table-striped" style="font-size:9pt;" id="listaFicheros">
    <thead>
        <tr>
            <th><g:message code="fichero.miniatura"/></th>
            <th></th>
            <th><g:message code="fichero.informacion.adjunta"/></th>
            <th></th>
            <th style="width:20%"><g:message code="fichero.informacion"/></th>
        </tr>

    </thead>
    <tbody>
    <g:each var="fichero" in="${ficheros}">
        <tr>
            <td style="border-right:1px dashed grey;width:80px;">
                <g:if test="${fichero.thumbnail}">
                <img src="${createLink(controller: 'fichero', action: 'displayThumbnail',id:fichero.id)}"/>
                </g:if>
            </td>
            <td style="text-align: right;border-right: 1px dashed grey;">
                <strong><g:message code="fichero.titulo"/></strong>:<br>
                <strong><g:message code="fichero.descripcion"/></strong>:<br>
                <strong><g:message code="fichero.notas"/></strong>:<br>
                <strong><g:message code="fichero.ruta"/></strong>:
            </td>
            <td>
                ${fichero.nombre}<br>
                ${fichero.descripcion}<br>
                ${fichero.notas}<br>
                <g:link controller="cliente" action="show" id="${fichero.cliente.id}"> <i class="fa fa-user"></i> ${fichero.cliente}</g:link><br>
                <g:if test="${fichero.caso}">
                    <g:link controller="caso" action="show" id="${fichero?.caso?.id}"><i class="fa fa-gavel"></i> ${fichero.caso}
                        <g:if test="${fichero.actuacion}">
                         / ${fichero.actuacion}
                        </g:if>
                    </g:link>
                </g:if>
            </td>
            <td style="text-align: right;border-right: 1px dashed grey;">
                <strong><g:message code="fichero.nombre"/></strong>:<br>
                <strong><g:message code="fichero.size"/></strong>:<br>
                <strong><g:message code="fichero.subidopor"/></strong>:<br>
                <strong><g:message code="fichero.fechasubido"/></strong>:
            </td>
            <td>
                ${fichero.fileName}<br>
                ${fichero.size}<br>
                ${fichero.addedBy.username}<br>
                <g:formatDate date="${fichero.dateCreated}"/><br>
               <g:link controller="fichero" action="download" id="${fichero.id}">
                       <span style="font-size:14pt;"><strong><g:message code="fichero.descargar"/></strong></span> <i class="${fichero.icono.icono} fa-2x" style="color:${fichero.icono.color}"></i>
               </g:link>
            </td>
        </tr>
    </g:each>

    </tbody>
</table>

<script>
    $(document).ready( function () {

        $.fn.dataTable.moment( 'DD-MM-YYYY' );

        $('#listaFicheros').DataTable({
            "order": [[ 0, "desc" ]],
            language: {
                "sProcessing":     "Procesando...",
                "sLengthMenu":     "Mostrar _MENU_ registros",
                "sZeroRecords":    "No se encontraron resultados",
                "sEmptyTable":     "Ningún dato disponible en esta tabla",
                "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix":    "",
                "sSearch":         "Buscar en los resultados:",
                "sUrl":            "",
                "sInfoThousands":  ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst":    "Primero",
                    "sLast":     "Último",
                    "sNext":     "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            }
        } );
    } );
</script>