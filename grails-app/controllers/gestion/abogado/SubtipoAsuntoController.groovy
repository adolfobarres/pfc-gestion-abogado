package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class SubtipoAsuntoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SubtipoAsunto.list(params), model:[subtipoAsuntoCount: SubtipoAsunto.count()]
    }

    def show(SubtipoAsunto subtipoAsunto) {
        respond subtipoAsunto
    }

    def create() {
        respond new SubtipoAsunto(params)
    }

    @Transactional
    def save(SubtipoAsunto subtipoAsunto) {
        if (subtipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (subtipoAsunto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond subtipoAsunto.errors, view:'create'
            return
        }

        subtipoAsunto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subtipoAsunto.label', default: 'SubtipoAsunto'), subtipoAsunto.id])
                redirect subtipoAsunto
            }
            '*' { respond subtipoAsunto, [status: CREATED] }
        }
    }

    def edit(SubtipoAsunto subtipoAsunto) {
        respond subtipoAsunto
    }

    @Transactional
    def update(SubtipoAsunto subtipoAsunto) {
        if (subtipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (subtipoAsunto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond subtipoAsunto.errors, view:'edit'
            return
        }

        subtipoAsunto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'subtipoAsunto.label', default: 'SubtipoAsunto'), subtipoAsunto.id])
                redirect subtipoAsunto
            }
            '*'{ respond subtipoAsunto, [status: OK] }
        }
    }

    @Transactional
    def delete(SubtipoAsunto subtipoAsunto) {

        if (subtipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        subtipoAsunto.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'subtipoAsunto.label', default: 'SubtipoAsunto'), subtipoAsunto.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtipoAsunto.label', default: 'SubtipoAsunto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
