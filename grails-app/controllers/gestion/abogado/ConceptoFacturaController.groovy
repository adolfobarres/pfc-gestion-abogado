package gestion.abogado

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("ROLE_ADMIN")
@Transactional(readOnly = true)
class ConceptoFacturaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ConceptoFactura.list(params), model:[conceptoFacturaCount: ConceptoFactura.count()]
    }

    def show(ConceptoFactura conceptoFactura) {
        respond conceptoFactura
    }

    def create() {
        respond new ConceptoFactura(params)
    }

    @Transactional
    def save(ConceptoFactura conceptoFactura) {
        if (conceptoFactura == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (conceptoFactura.hasErrors()) {
            //transactionStatus.setRollbackOnly()
            respond conceptoFactura.errors, view:'/factura/addConcepto', model:['factura':Factura.get(params.factura.id)]
            return
        }

        conceptoFactura.save flush:true

        flash.message = message(code: 'default.created.message', args: [message(code: 'conceptoFactura.label', default: 'ConceptoFactura'), conceptoFactura.descripcion])
        redirect  action:'addConcepto', controller:'factura', id:conceptoFactura.factura.id
    }

    def edit(ConceptoFactura conceptoFactura) {
        respond conceptoFactura
    }

    @Transactional
    def update(ConceptoFactura conceptoFactura) {

        println params
        if (conceptoFactura == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (conceptoFactura.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond conceptoFactura.errors, view:'edit'
            return
        }

        conceptoFactura.save flush:true

        flash.message = message(code: 'default.updated.message', args: [message(code: 'conceptoFactura.label', default: 'ConceptoFactura'), conceptoFactura.id])
        redirect controller: "factura", action: "addConcepto", id:conceptoFactura.factura.id
    }

    @Transactional
    def delete(ConceptoFactura conceptoFactura) {

        if (conceptoFactura == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        Factura factura = conceptoFactura.factura

        conceptoFactura.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'conceptoFactura.label', default: 'ConceptoFactura'), conceptoFactura.descripcion])
        redirect action:"addConcepto", controller:"factura", id:factura.id
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'conceptoFactura.label', default: 'ConceptoFactura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
