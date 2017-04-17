package com.alfresco

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_ADMIN")
class FicheroController {

    def alfrescoConnectService

    def index() {
       def resultado = alfrescoConnectService.conectar()
        println resultado
        render resultado as JSON
    }
}
