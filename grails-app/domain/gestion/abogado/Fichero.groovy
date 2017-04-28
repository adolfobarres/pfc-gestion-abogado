package gestion.abogado

import com.spring.security.User
import org.apache.chemistry.opencmis.client.api.CmisObject
import org.apache.chemistry.opencmis.client.api.Document
import org.apache.chemistry.opencmis.client.api.Session
import org.apache.chemistry.opencmis.commons.data.ContentStream

class Fichero {

    def springSecurityService
    def alfrescoConnectService
    def alfrescoContentService

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

    static transients = ['mimeType','size']

    def beforeValidate(){
        addedBy =  springSecurityService.currentUser
    }

    def getMimeType(){
        Session session = alfrescoConnectService.conectar()
        Document obj = session.getObject(this.idAlfresco)
        ContentStream cs = obj.getContentStream()
        cs.getMimeType()
    }

    def getSize(){
        Session session = alfrescoConnectService.conectar()
        Document document = session.getObject(this.idAlfresco)
        InputStream inputStream = document.getContentStream().stream
        Float size = inputStream.getBytes().size()
        String tipo
        //Pasamos a Bytes

        if(size > 1024){
            size = size / 1024
            tipo = 'KB'
        }
        if(size > 1024){
            size = size / 1024
            tipo = 'MB'
        }

        return size.round(2) + " " + tipo
    }
}
