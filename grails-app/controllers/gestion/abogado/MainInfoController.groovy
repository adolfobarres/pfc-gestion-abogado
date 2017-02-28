package gestion.abogado

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class MainInfoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MainInfo.list(params), model:[mainInfoCount: MainInfo.count()]
    }

    def show(MainInfo mainInfo) {
        respond mainInfo
    }

    def create() {
        respond new MainInfo(params)
    }

    @Transactional
    def save(MainInfo mainInfo) {
        if (mainInfo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (mainInfo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond mainInfo.errors, view:'create'
            return
        }

        mainInfo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'mainInfo.label', default: 'MainInfo'), mainInfo.id])
                redirect mainInfo
            }
            '*' { respond mainInfo, [status: CREATED] }
        }
    }

    def edit(MainInfo mainInfo) {
        respond mainInfo
    }

    @Transactional
    def update(MainInfo mainInfo) {
        if (mainInfo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (mainInfo.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond mainInfo.errors, view:'edit'
            return
        }

        mainInfo.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'mainInfo.label', default: 'MainInfo'), mainInfo.id])
                redirect mainInfo
            }
            '*'{ respond mainInfo, [status: OK] }
        }
    }

    @Transactional
    def delete(MainInfo mainInfo) {

        if (mainInfo == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        mainInfo.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'mainInfo.label', default: 'MainInfo'), mainInfo.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mainInfo.label', default: 'MainInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
