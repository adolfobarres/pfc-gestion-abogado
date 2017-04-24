package gestion.abogado

import com.spring.security.User

class Fichero {

    def springSecurityService

    String nombre
    String descripcion
    String notas
    String idAlfresco

    Date dateCreated
    User addedBy
    Date lastUpdated

    static constraints = {
        notas nullable: true
    }

    def beforeValidate(){
        addedBy =  springSecurityService.currentUser
    }
}
