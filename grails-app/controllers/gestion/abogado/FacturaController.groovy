package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
@Transactional(readOnly = true)
class FacturaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Factura.list(params), model:[facturaCount: Factura.count()]
    }

    def show(Factura factura) {
        respond factura
    }

    def create() {
        Caso caso
        Factura factura = null
        String numFactura = '1'.padLeft(6,'0')

        if(params.idCaso){
            caso = Caso.get(params.idCaso)
        }

        def vFactura = Factura.list([max:1,sort:"id",order:"desc"])
        if(vFactura){
            Integer idFactura = vFactura.first().id + 1
            numFactura = idFactura.toString().padLeft(6,'0')
        }


        respond new Factura(params), model: ['caso':caso, 'numFactura':numFactura]
    }

    @Transactional
    def save(Factura factura) {
        Caso caso = Caso.get(params.caso.id)
        factura.caso = caso
        factura.validate()

        if (factura == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (factura.hasErrors()) {
            //transactionStatus.setRollbackOnly()
            respond factura.errors, view:'create', model:['caso':caso,'numFactura':factura.numero]
            return
        }

        factura.save flush:true

        flash.message = message(code: 'default.created.message', args: [message(code: 'factura.label', default: 'Factura'), factura.id])
        redirect action: 'addConcepto', id:factura.id
    }

    def addConcepto(Long id){
        Factura factura = Factura.get(id)
        [factura: factura]
    }

    def edit(Factura factura) {
        respond factura
    }

    @Transactional
    def update(Factura factura) {
        if (factura == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (factura.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond factura.errors, view:'edit'
            return
        }

        factura.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'factura.label', default: 'Factura'), factura.id])
                redirect factura
            }
            '*'{ respond factura, [status: OK] }
        }
    }

    @Transactional
    def delete(Factura factura) {

        if (factura == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        factura.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'factura.label', default: 'Factura'), factura.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'factura.label', default: 'Factura'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
