package gestion.abogado

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(["ROLE_ADMIN","ROLE_ABOGADO","ROLE_ADMINISTRATIVO"])
class ClienteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

    def index(Integer max) {
       //params.max = Math.min(max ?: 10, 100)
        respond Cliente.list(params), model:[clienteCount: Cliente.count()]
    }

    def show(Cliente cliente) {
        respond cliente
    }

    def create() {
        respond new Cliente(params)
    }

    @Transactional
    def save(Cliente cliente) {
        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cliente.errors, view:'create'
            return
        }

        cliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect cliente
            }
            '*' { respond cliente, [status: CREATED] }
        }
    }

    def edit(Cliente cliente) {
        respond cliente
    }

    @Transactional
    def update(Cliente cliente) {
        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cliente.errors, view:'edit'
            return
        }

        cliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect cliente
            }
            '*'{ respond cliente, [status: OK] }
        }
    }

    @Transactional
    def delete(Cliente cliente) {

        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        cliente.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
        redirect action:"index", method:"GET"
        }

    def getCasos(Long idCliente){
        def vCasos = Cliente.get(idCliente)?.casos

        render template:"/cita/layouts/cmbCasos", model:['gspCasos':vCasos]
    }

    def listJSON(){
        println params
        Caso caso = Caso.get(params.caso)

        def listaClientesAsignados = []
        listaClientesAsignados << caso.cliente
        listaClientesAsignados << caso.otrosClientes.cliente
        listaClientesAsignados = listaClientesAsignados.flatten()

        def vListaClientes = Cliente.list().findAll{it.nifYNombre.toLowerCase().contains(params.term.toLowerCase())}
        def vListaResultado = []

        println vListaClientes

        listaClientesAsignados.each { clienteAsignado ->
            def clienteEncontrado =  vListaClientes.find{it.id == clienteAsignado.id}
            if(clienteEncontrado){
                vListaClientes.remove(clienteEncontrado)
            }
        }


        def resultado = []
        vListaClientes.each{ cliente ->
            resultado << ["label":cliente.nifYNombre,"value":cliente.id]
        }

        render resultado as JSON
    }



    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
