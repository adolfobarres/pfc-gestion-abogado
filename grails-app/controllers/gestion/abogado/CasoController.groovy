package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN","ROLE_ABOGADO"])
@Transactional(readOnly = true)
class CasoController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        def user = springSecurityService.currentUser

        if(user.authorities.any{ it.authority == "ROLE_ADMIN" }){
            respond Caso.list()
        }
        else if(user.authorities.any{it.authority == "ROLE_ABOGADO"}){
            respond Caso.findAllByAddedBy(user)
        }
    }

    def show(Caso caso) {
        respond caso
    }

    def create() {

        String numAsunto = '1'.padLeft(6,'0')

        def vCaso = Caso.list([max:1,sort:"id",order:"desc"])
        if(vCaso){
            Integer idCaso = vCaso.first().id + 1
            numAsunto = idCaso.toString().padLeft(6,'0')
        }

        respond new Caso(params), model: ['numAsunto':'CA'+numAsunto]
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
            respond caso.errors, view:'create', model:["gspSubtipos":SubtipoAsunto.findAllByTipoAsunto(caso.subtipoAsunto.tipoAsunto)]
            return
        }


        caso.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'caso.label', default: 'Caso'), caso.id])
                redirect caso
            }
            '*' { respond caso, [status: CREATED] }
        }
    }

    def edit(Caso caso) {
        ['caso':caso, 'gspSubtipos':caso.subtipoAsunto.tipoAsunto.subtipos]
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
    def addOtroCliente(){
        Caso caso = Caso.get(params.idCaso)
        Cliente cliente = Cliente.get(params.idCliente)
        if(caso && cliente){
            OtrosClientesCaso otrosClientesCaso = new OtrosClientesCaso(caso:caso,cliente: cliente)
            otrosClientesCaso.save(flush:true)
        }
        flash.message = message(code: 'cliente.add.al.caso')
        redirect action: 'show', id:caso.id
    }

    def deleteOtroCliente(Long id){
        OtrosClientesCaso otrosClientesCaso = OtrosClientesCaso.get(id)
        def caso = otrosClientesCaso.caso
        if(otrosClientesCaso){
            otrosClientesCaso.delete(flush:true)
            flash.message = message(code: 'cliente.remove.al.caso')
            redirect action: 'show', id:caso.id
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
