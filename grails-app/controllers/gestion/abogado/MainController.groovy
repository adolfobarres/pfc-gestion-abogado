package gestion.abogado
import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN","ROLE_ABOGADO","ROLE_ADMINISTRATIVO"])
class MainController {

    def dashboard() { }

    def ultimosCasos(){

        def ultimosCasos = Caso.list().sort{it.fechaAlta}
        def ultimosCasosOrdenados = ultimosCasos.reverse()[0..4]
        render template:'layouts/ultimosCasos', model: ['listCasos':ultimosCasosOrdenados]
    }
}
