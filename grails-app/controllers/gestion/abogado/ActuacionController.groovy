package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN','ROLE_ABOGADO'])
@Transactional(readOnly = true)
class ActuacionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Actuacion.list(params), model:[actuacionCount: Actuacion.count()]
    }

    def show(Actuacion actuacion) {
        respond actuacion
    }

    def create() {
        respond new Actuacion(params)
    }

    @Transactional
    def save(Actuacion actuacion) {
        if (actuacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (actuacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond actuacion.errors, view:'create'
            return
        }

        actuacion.save flush:true
        println actuacion
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'actuacion.label', default: 'Actuacion'), actuacion.id])
                redirect(controller:'caso', action:'show', id:actuacion.caso.id)
            }
            '*' { respond actuacion, [status: CREATED] }
        }
    }

    def edit(Actuacion actuacion) {
        respond actuacion
    }

    @Transactional
    def update(Actuacion actuacion) {
        if (actuacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (actuacion.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond actuacion.errors, view:'edit'
            return
        }

        actuacion.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'actuacion.label', default: 'Actuacion'), actuacion.descripcion])
                redirect(controller:'caso', action:'show', id:actuacion.caso.id)
            }
            '*'{ respond actuacion, [status: OK] }
        }
    }

    @Transactional
    def delete(Actuacion actuacion) {

        if (actuacion == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        actuacion.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'actuacion.label', default: 'Actuacion'), actuacion.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'actuacion.label', default: 'Actuacion'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
