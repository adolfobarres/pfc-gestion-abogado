package gestion.abogado

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class TipoAsuntoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoAsunto.list(params), model:[tipoAsuntoCount: TipoAsunto.count()]
    }

    def show(TipoAsunto tipoAsunto) {
        respond tipoAsunto
    }

    def create() {
        respond new TipoAsunto(params)
    }

    @Transactional
    def save(TipoAsunto tipoAsunto) {
        if (tipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoAsunto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoAsunto.errors, view:'create'
            return
        }

        tipoAsunto.save flush:true


        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoAsunto.label', default: 'TipoAsunto'), tipoAsunto.id])
        redirect action:'addSubTipo', id:tipoAsunto.id
    }

    def addSubTipo(Long id){
        TipoAsunto tipoAsunto = TipoAsunto.get(id)
        [tipoAsunto: tipoAsunto]
    }

    def editSubtipo(Long id){
        SubtipoAsunto subtipo = SubtipoAsunto.get(id)
        TipoAsunto tipo= subtipo.tipoAsunto
        [tipoAsunto:tipo,subtipoAsunto:subtipo]
    }

    @Transactional
    def saveSubtipo(){
        TipoAsunto tipo = TipoAsunto.get(params.tipo.id.toLong())
        if(tipo){
            tipo.addToSubtipos(new SubtipoAsunto(descripcion: params.descripcion))
            tipo.save(flush:true)
        }

        flash.message = message(code: 'nuevo.subtipoAsunto.anadido')
        redirect action:'addSubTipo', id:tipo.id
    }

    @Transactional
    def updateSubtipo(Long id){
        SubtipoAsunto subTipoAsunto = SubtipoAsunto.get(id)
        subTipoAsunto.descripcion = params.descripcion

        subTipoAsunto.save(flush:true)

        flash.message = message(code: 'editado.subtipoAsunto.anadido')
        redirect action:'addSubTipo', id:subTipoAsunto.tipoAsunto.id
    }

    @Transactional
    def deleteSubtipo(Long id){
        SubtipoAsunto subtipo = SubtipoAsunto.get(id)
        if(subtipo){
            try {
                subtipo.delete flush: true
            }
            catch (org.springframework.dao.DataIntegrityViolationException e){
                notDeleted(subtipo)
                return
            }
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subtipoAsunto.label', default: 'Subtipo de Asunto'), subtipo.id])
            redirect action:"addSubTipo", id:subtipo.tipoAsunto.id
        }


    }

    def edit(TipoAsunto tipoAsunto) {
        respond tipoAsunto
    }

    @Transactional
    def update(TipoAsunto tipoAsunto) {
        if (tipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoAsunto.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoAsunto.errors, view:'edit'
            return
        }

        tipoAsunto.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoAsunto.label', default: 'TipoAsunto'), tipoAsunto.id])
                redirect action:'index'
            }
            '*'{ respond tipoAsunto, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoAsunto tipoAsunto) {

        if (tipoAsunto == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoAsunto.delete flush:true

                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoAsunto.label', default: 'TipoAsunto'), tipoAsunto.id])
                redirect action:"index", method:"GET"
    }

    def getSubtipos(Long tipoId){
        TipoAsunto tipoAsunto = TipoAsunto.get(tipoId)
        def subTipos = []
        if(tipoAsunto != null){
            subTipos = tipoAsunto.subtipos.sort{it.descripcion}
        }

        render template:  '/caso/layouts/subtiposAsunto', model: ['gspSubtipos':subTipos]
        /*render g.select(id:'sutTipoId', name:'caso.subtipoAsunto.id',
                from:subTipos, optionKey:'id', class:'form-control input-sm', required:"")*/
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAsunto.label', default: 'TipoAsunto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    protected void notDeleted(SubtipoAsunto subtipo) {
        flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subtipoAsunto.label', default: 'estadoActuacion'), params.id])
        redirect action: "addSubTipo", id:subtipo.tipoAsunto.id
    }

}
