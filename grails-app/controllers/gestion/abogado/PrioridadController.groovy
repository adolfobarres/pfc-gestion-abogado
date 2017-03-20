package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class PrioridadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Prioridad.list(params), model:[prioridadCount: Prioridad.count()]
    }

    def show(Prioridad prioridad) {
        respond prioridad
    }

    def create() {
        respond new Prioridad(params)
    }

    @Transactional
    def save(Prioridad prioridad) {
        if (prioridad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (prioridad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond prioridad.errors, view:'create'
            return
        }

        prioridad.save flush:true

        flash.message = message(code: 'default.created.message', args: [message(code: 'prioridad.label', default: 'Prioridad'), prioridad])
        redirect action:'index'
    }

    def edit(Prioridad prioridad) {
        respond prioridad
    }

    @Transactional
    def update(Prioridad prioridad) {
        if (prioridad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (prioridad.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond prioridad.errors, view:'edit'
            return
        }

        prioridad.save flush:true


        flash.message = message(code: 'default.updated.message', args: [message(code: 'prioridad.label', default: 'Prioridad'), prioridad])
        redirect action:'index'
    }

    @Transactional
    def delete(Prioridad prioridad) {

        if (prioridad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        try{
            prioridad.delete flush:true
        }
        catch (org.springframework.dao.DataIntegrityViolationException e){
            notDeleted()
            return
        }


        flash.message = message(code: 'default.deleted.message', args: [message(code: 'prioridad.label', default: 'Prioridad'), prioridad])
        redirect action:"index", method:"GET"
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prioridad.label', default: 'Prioridad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    protected void notDeleted() {
        flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prioridad.label', default: 'prioridad'), params.id])
        redirect action: "index", method: "GET"
    }
}
