package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class CasoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        respond Caso.list()
    }

    def show(Caso caso) {
        respond caso
    }

    def create() {
        respond new Caso(params)
    }

    @Transactional
    def save(Caso caso) {



        if (caso == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (caso.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond caso.errors, view:'create'
            return
        }


        caso.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'caso.label', default: 'Caso'), caso.id])
                redirect caso
            }
            '*' { respond caso, [status: CREATED] }
        }
    }

    def edit(Caso caso) {
        respond caso
    }

    @Transactional
    def update(Caso caso) {

        if (caso == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (caso.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond caso.errors, view:'edit'
            return
        }

        caso.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'caso.label', default: 'Caso'), caso.id])
                redirect caso
            }
            '*'{ respond caso, [status: OK] }
        }
    }

    @Transactional
    def delete(Caso caso) {

        if (caso == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        caso.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'caso.label', default: 'Caso'), caso.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'caso.label', default: 'Caso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
