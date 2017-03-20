package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class EstadoActuacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EstadoActuacion.list(params), model:[estadoActuacionCount: EstadoActuacion.count()]
    }

    def show(EstadoActuacion estadoActuacion) {
        respond estadoActuacion
    }

    def create() {
        respond new EstadoActuacion(params)
    }

    @Transactional
    def save(EstadoActuacion estadoActuacion) {
        if (estadoActuacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (estadoActuacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond estadoActuacion.errors, view:'create'
            return
        }

        estadoActuacion.save flush:true

        flash.message = message(code: 'default.created.message', args: [message(code: 'estadoActuacion.label', default: 'EstadoActuacion'), estadoActuacion])
        redirect action:'index'

    }

    def edit(EstadoActuacion estadoActuacion) {
        respond estadoActuacion
    }

    @Transactional
    def update(EstadoActuacion estadoActuacion) {
        if (estadoActuacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (estadoActuacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond estadoActuacion.errors, view:'edit'
            return
        }

        estadoActuacion.save flush:true

        flash.message = message(code: 'default.updated.message', args: [message(code: 'estadoActuacion.label', default: 'EstadoActuacion'), estadoActuacion])
        redirect action:'index'
    }

    @Transactional
    def delete(EstadoActuacion estadoActuacion) {

        if (estadoActuacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        try {
            estadoActuacion.delete flush: true
        }
        catch (org.springframework.dao.DataIntegrityViolationException e){
            notDeleted()
            return
        }


        flash.message = message(code: 'default.deleted.message', args: [message(code: 'estadoActuacion.label', default: 'EstadoActuacion'), estadoActuacion])
        redirect action:"index", method:"GET"

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoActuacion.label', default: 'EstadoActuacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    protected void notDeleted() {
        flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'estadoActuacion.label', default: 'estadoActuacion'), params.id])
        redirect action: "index", method: "GET"
    }
}
