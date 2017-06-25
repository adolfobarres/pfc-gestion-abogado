package com.spring.security

import gestion.abogado.EnvioEmail
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured("ROLE_ADMIN")
@Transactional(readOnly = true)

class UserController {

    def mailService

    static allowedMethods = [save: "POST", update: "PUT", delete: "GET"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userCount: User.count()]
    }

    def show(User user) {
        respond user
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User user) {

        println params

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'create'
            return
        }

        user.save flush:true

        def vRoles = [params.roles]
        vRoles.each{ rol ->
            UserRole userRole = new UserRole(user: user, role: Role.findByAuthority(rol)).save(flush:true)
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect action:'index'


    }

    def edit(User user) {
        respond user
    }

    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        UserRole.removeAll(user)
        def vUser = User.get(user.id)
        def vRoles = [params.roles].flatten()
        vRoles.each{ rol ->
            def vRol = Role.findByAuthority(rol)
            UserRole userRole = new UserRole(user: vUser, role: vRol).save(flush:true)
        }

        user.save flush:true

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect action:'index'

        }

    @Secured("permitAll")
    def rememberPassword(){

    }

    @Secured("permitAll")
    def renewPassword(){
            def user = User.findByEmail(params.email)
            if(user){
                String id = UUID.randomUUID().toString()
                String url = g.createLink(action:"newPassword",controller: "user",absolute: true,params: ['uid':id])


                mailService.sendMail {
                    to params.email
                    subject "SIGAB - Renovación de contraseña"
                    html "<b>Renovación de contraseña solicitada</b><br>" +
                            " Por favor haga clic en el siguiente link para cambiar su contraseña<br>" +
                            "Usuario: " + user.username +
                            "<br>" +
                            " <a href='"+url+"'>"+url+"</a>"

                }

                def enviosAnteriores = EnvioEmail.findAllByEmail(params.email)*.delete(flush:true)

                EnvioEmail envioEmail = new EnvioEmail(idGenerado: id, email: params.email).save(flush: true)

                flash.message = "Revise su bandeja de entrada, se ha enviado un email"

            }
        else{
                flash.messageerror = "No existe un usuario con dicho email"
            }

        redirect action:"rememberPassword"
        }

    @Secured("permitAll")
    def changePassword(){
        if(params.uid){
            EnvioEmail envioEmail = EnvioEmail.findByIdGenerado(params.uid)
            User user = User.findByEmail(envioEmail.email)
            if(user){
                user.password = params.password
                user.validate()
                user.save(flush:true)
                envioEmail.delete()
                flash.message = "Contraseña cambiada con éxito, haga login con la nueva contraseña"
                redirect action:"auth",controller: "login"
            }
        }

    }

    @Secured("permitAll")
    def newPassword(){

        if(params.uid){
            EnvioEmail envioEmail = EnvioEmail.findByIdGenerado(params.uid)
            if(envioEmail){
                [gspEmail:envioEmail.email]
            }
            else{
                flash.messageerror = "No puede renovarse la contraseña, uid no encontrado"
            }
        }

    }

    @Transactional
    def delete(User user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
