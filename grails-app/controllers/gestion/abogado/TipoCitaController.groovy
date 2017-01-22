package gestion.abogado

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class TipoCitaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoCita.list(params), model:[tipoCitaCount: TipoCita.count()]
    }

    def show(TipoCita tipoCita) {
        respond tipoCita
    }

    def create() {
        respond new TipoCita(params)
    }

    @Transactional
    def save(TipoCita tipoCita) {
        if (tipoCita == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoCita.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoCita.errors, view:'create'
            return
        }

        tipoCita.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), tipoCita.id])
                redirect tipoCita
            }
            '*' { respond tipoCita, [status: CREATED] }
        }
    }

    def edit(TipoCita tipoCita) {
        respond tipoCita
    }

    @Transactional
    def update(TipoCita tipoCita) {
        if (tipoCita == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoCita.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoCita.errors, view:'edit'
            return
        }

        tipoCita.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), tipoCita.id])
                redirect tipoCita
            }
            '*'{ respond tipoCita, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoCita tipoCita) {

        if (tipoCita == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoCita.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), tipoCita.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
