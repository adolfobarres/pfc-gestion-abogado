<div class="row">
    <div class="col-lg-12">
        <div class="form-group">
            <label for="caso"><g:message code="caso.label"/></label>
            <g:select id="caso" name='cita.caso.id' value="${gspIdCaso}"
                      noSelection="${['': '--Selecciona un Caso--']}"
                      from='${gspCasos}'
                      optionKey="id" class="form-control" ></g:select>
        </div></div></div>
