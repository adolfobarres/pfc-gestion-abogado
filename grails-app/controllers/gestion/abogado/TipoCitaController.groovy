package gestion.abogado

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class TipoCitaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

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

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), tipoCita.codigo])
        redirect action:'index'

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


        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoCita.label', default: 'TipoCita'), tipoCita.codigo])
        redirect action:'index'

    }

    @Transactional
    def delete(TipoCita tipoCita) {

        if (tipoCita == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        try {
            tipoCita.delete flush:true
        }
        catch (org.springframework.dao.DataIntegrityViolationException e){
            notDeleted()
            return
        }

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

    protected void notDeleted() {
        flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoCita.label', default: 'Tipo de Cita'), params.id])
        redirect action: 'index'
    }
}
