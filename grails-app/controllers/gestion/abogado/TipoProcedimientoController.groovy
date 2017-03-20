package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class TipoProcedimientoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoProcedimiento.list(params), model:[tipoProcedimientoCount: TipoProcedimiento.count()]
    }

    def show(TipoProcedimiento tipoProcedimiento) {
        respond tipoProcedimiento
    }

    def create() {
        respond new TipoProcedimiento(params)
    }

    @Transactional
    def save(TipoProcedimiento tipoProcedimiento) {
        if (tipoProcedimiento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoProcedimiento.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoProcedimiento.errors, view:'create'
            return
        }

        tipoProcedimiento.save flush:true

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoProcedimiento.label', default: 'TipoProcedimiento'), tipoProcedimiento.descripcion])
        redirect action:'index'
    }

    def edit(TipoProcedimiento tipoProcedimiento) {
        respond tipoProcedimiento
    }

    @Transactional
    def update(TipoProcedimiento tipoProcedimiento) {
        if (tipoProcedimiento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoProcedimiento.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoProcedimiento.errors, view:'edit'
            return
        }

        tipoProcedimiento.save flush:true


        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoProcedimiento.label', default: 'TipoProcedimiento'), tipoProcedimiento.descripcion])
        redirect action:'index'
    }

    @Transactional
    def delete(TipoProcedimiento tipoProcedimiento) {

        if (tipoProcedimiento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        try {
            tipoProcedimiento.delete flush: true
        }
        catch(org.springframework.dao.DataIntegrityViolationException e) {
            notDeleted()
            return
        }


        flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoProcedimiento.label', default: 'TipoProcedimiento'), tipoProcedimiento.descripcion])
        redirect action:"index", method:"GET"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoProcedimiento.label', default: 'TipoProcedimiento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    protected void notDeleted() {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoProcedimiento.label', default: 'TipoProcedimiento'), params.id])
                redirect action: "index", method: "GET"
    }
}
