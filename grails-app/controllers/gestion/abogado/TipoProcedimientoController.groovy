package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class TipoProcedimientoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoProcedimiento.label', default: 'TipoProcedimiento'), tipoProcedimiento.id])
                redirect tipoProcedimiento
            }
            '*' { respond tipoProcedimiento, [status: CREATED] }
        }
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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoProcedimiento.label', default: 'TipoProcedimiento'), tipoProcedimiento.id])
                redirect tipoProcedimiento
            }
            '*'{ respond tipoProcedimiento, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoProcedimiento tipoProcedimiento) {

        if (tipoProcedimiento == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoProcedimiento.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoProcedimiento.label', default: 'TipoProcedimiento'), tipoProcedimiento.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
}
