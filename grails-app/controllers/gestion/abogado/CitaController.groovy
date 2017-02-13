package gestion.abogado

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("ROLE_ADMIN")
@Transactional(readOnly = true)
class CitaController {

    def CitaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cita.list(params), model:[citaCount: Cita.count()]
    }

    def show(Cita cita) {
        respond cita
    }

    def create() {

        Cliente vCliente = null

        if(params.idCliente){
            vCliente = Cliente.get(params.idCliente)

        }
        respond new Cita(params), model:['cliente':vCliente]
    }

    def addCita(){
        Cliente vCliente = null

        if(params.idCliente){
            vCliente = Cliente.get(params.idCliente)

        }
        respond new Cita(params), model:['cliente':vCliente]
    }

    @Transactional
    def save(Cita cita) {
        println params
        cita.minutosComienzo = CitaService.getMinutos(params.horaSeleccionada)
        cita.horaComienzo = CitaService.getHoras(params.horaSeleccionada)
        cita.minutosFin = CitaService.getMinutos(params.horaFin)
        cita.horaFin = CitaService.getHoras(params.horaFin)
        cita.validate()

        if (cita == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cita.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cita.errors, view:'create', model:['cliente':Cliente.get(params.cita.cliente.id)]
            return
        }

        cita.save flush:true

        flash.message = message(code: 'default.created.message', args: [message(code: 'cita.label', default: 'Cita'), cita.id])
        redirect url: request.getHeader('referer')

        /*request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cita.label', default: 'Cita'), cita.id])
                redirect cita
            }
            '*' { respond cita, [status: CREATED] }
        }*/
    }

    def edit(Cita cita) {

        Cliente vCliente = cita.cliente
        respond cita, model:['cliente':vCliente]
    }

    @Transactional
    def update(Cita cita) {
        if (cita == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cita.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cita.errors, view:'edit'
            return
        }

        cita.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'cita.label', default: 'Cita'), cita.id])
                redirect cita
            }
            '*'{ respond cita, [status: OK] }
        }
    }

    @Transactional
    def delete(Cita cita) {
        Long idCita = cita.id
        Caso caso = cita.caso
        Cliente cliente = cita.cliente

        if (cita == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        cita.delete flush:true

        flash.message = message(code: 'default.deleted.message', args: [message(code: 'cita.label', default: 'Cita'), idCita])

        redirect url: request.getHeader('referer')




    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def getHorasDisponibles(){

        TipoCita vTipo
        vTipo = TipoCita.get(params.tipoId)
        String horaFinal
        Date dia  = Date.parse("dd-MM-yyyy",params.dia)

        if(vTipo.duracionMediaHoras > 0){
             horaFinal = CitaService.addHoras(params.hora,vTipo.duracionMediaHoras)
        }
        if(vTipo.duracionMediaMinutos){
            horaFinal = CitaService.addMinutos(params.hora,vTipo.duracionMediaMinutos)
        }

        def posibleHoraFinal = CitaService.intervaloLibre(params.hora,horaFinal,dia)
        println posibleHoraFinal
        if(posibleHoraFinal != ''){
            horaFinal = posibleHoraFinal
        }

        render template: 'layouts/horaFinalizacion', model:['horaFinal':horaFinal]
    }

    def listaCitasJSON() {
        println params
        def vLista = Cita.list()
        def listaEventos = []
        def events

        if(params.idCliente){
            vLista = vLista.findAll{it.cliente.id == params.idCliente.toLong()}
        }
        if(params.idCaso){
            vLista = vLista.findAll{it?.caso?.id == params.idCaso.toLong()}
        }

        vLista.each { cita ->
            listaEventos << ['id':cita.id,'title': cita.titulo + ' ' + '['+cita.cliente.nif+']',
                             'start': cita.fecha.format("YYYY-MM-dd")+"T"+cita.comienzo+"Z",
                               'end': cita.fecha.format("YYYY-MM-dd")+"T"+cita.fin+"Z"]
        }

        def json = ['events': listaEventos]
        render listaEventos as JSON
    }
}
