package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class PrioridadController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prioridad.label', default: 'Prioridad'), prioridad.id])
                redirect prioridad
            }
            '*' { respond prioridad, [status: CREATED] }
        }
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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'prioridad.label', default: 'Prioridad'), prioridad.id])
                redirect prioridad
            }
            '*'{ respond prioridad, [status: OK] }
        }
    }

    @Transactional
    def delete(Prioridad prioridad) {

        if (prioridad == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        prioridad.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'prioridad.label', default: 'Prioridad'), prioridad.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
}
