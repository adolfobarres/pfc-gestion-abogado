package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class TipoAsuntoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoAsunto.list(params), model:[tipoAsuntoCount: TipoAsunto.count()]
    }

    def show(TipoAsunto tipoAsunto) {
        respond tipoAsunto
    }

    def create() {
        respond new TipoAsunto(params)
    }

    @Transactional
    def save(TipoAsunto tipoAsunto) {
        if (tipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoAsunto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoAsunto.errors, view:'create'
            return
        }

        tipoAsunto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoAsunto.label', default: 'TipoAsunto'), tipoAsunto.id])
                redirect tipoAsunto
            }
            '*' { respond tipoAsunto, [status: CREATED] }
        }
    }

    def edit(TipoAsunto tipoAsunto) {
        respond tipoAsunto
    }

    @Transactional
    def update(TipoAsunto tipoAsunto) {
        if (tipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoAsunto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoAsunto.errors, view:'edit'
            return
        }

        tipoAsunto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoAsunto.label', default: 'TipoAsunto'), tipoAsunto.id])
                redirect tipoAsunto
            }
            '*'{ respond tipoAsunto, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoAsunto tipoAsunto) {

        if (tipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoAsunto.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoAsunto.label', default: 'TipoAsunto'), tipoAsunto.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAsunto.label', default: 'TipoAsunto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
