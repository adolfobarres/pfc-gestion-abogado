package gestion.abogado

import com.spring.security.User
import org.apache.chemistry.opencmis.client.api.CmisObject
import org.apache.chemistry.opencmis.client.api.Document
import org.apache.chemistry.opencmis.client.api.OperationContext
import org.apache.chemistry.opencmis.client.api.Rendition
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

    static transients = ['mimeType','size','thumbnail','fileName','icono','cliente','caso','actuacion']

    def beforeValidate(){
        addedBy =  springSecurityService.currentUser
    }

    def getMimeType(){
        Session session = alfrescoConnectService.conectar()
        Document obj = session.getObject(this.idAlfresco)
        ContentStream cs = obj.getContentStream()
        cs.getMimeType()
    }

    def getFileName(){
        Session session = alfrescoConnectService.conectar()
        Document obj = session.getObject(this.idAlfresco)
        ContentStream cs = obj.getContentStream()
        cs.fileName
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

    def getThumbnail(){
        Session session = alfrescoConnectService.conectar()
        OperationContext oc = session.createOperationContext();
        oc.setRenditionFilterString("cmis:thumbnail");
        Document document = session.getObject(this.idAlfresco, oc)
        def thumbnail
        for (Rendition rendition: document.getRenditions()) {
            thumbnail = rendition.getContentStream().stream.bytes
        }
        thumbnail

    }


    def getIcono(){
        def tipoFichero = mimeType
        switch (mimeType){

            case 'application/pdf': return [icono:'fa fa-file-pdf-o',color:'red']
            case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document': return [icono:'fa fa-file-word-o',color:'blue']
            case 'image/jpeg': return [icono:'fa fa-file-image-o',color:'blue']
            case 'audio/mp3':  return [icono:'fa fa-file-audio-o',color:'orange']
            default: return [icono:'fa fa-file',color:'grey']
        }
    }

    def getCliente(){
        if(this.caso){
            return caso.cliente
        }
        else{
            def ficheros = Cliente.withCriteria(){
                ficheros {
                    eq("id", this.id)
                }
            }

            if(ficheros.size()>0){
                ficheros.first()
            }
            else{
                null
            }
        }
    }

    def getCaso(){

        if(this.actuacion){
            return actuacion.caso
        }
        else{
            def ficheros = Caso.withCriteria(){
                ficheros {
                    eq("id", this.id)
                }
            }

            if(ficheros.size()>0){
                ficheros.first()
            }
            else{
                null
            }
        }

    }

    def getActuacion(){

        def ficheros = Actuacion.withCriteria() {
            ficheros {
                eq("id", this.id)
            }
        }

        if(ficheros.size()>0){
            ficheros.first()
        }
        else{
            null
        }
    }
}
