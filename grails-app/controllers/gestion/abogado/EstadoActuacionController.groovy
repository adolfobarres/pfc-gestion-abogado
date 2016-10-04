package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class EstadoActuacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estadoActuacion.label', default: 'EstadoActuacion'), estadoActuacion.id])
                redirect estadoActuacion
            }
            '*' { respond estadoActuacion, [status: CREATED] }
        }
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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'estadoActuacion.label', default: 'EstadoActuacion'), estadoActuacion.id])
                redirect estadoActuacion
            }
            '*'{ respond estadoActuacion, [status: OK] }
        }
    }

    @Transactional
    def delete(EstadoActuacion estadoActuacion) {

        if (estadoActuacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        estadoActuacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'estadoActuacion.label', default: 'EstadoActuacion'), estadoActuacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
}
