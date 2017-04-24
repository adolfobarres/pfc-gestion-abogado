package gestion.abogado

import org.apache.chemistry.opencmis.client.api.CmisObject
import org.apache.chemistry.opencmis.client.api.Document
import org.apache.chemistry.opencmis.client.api.Session
import org.springframework.web.multipart.MultipartFile

class FicheroController {

    def alfrescoConnectService
    def alfrescoContentService

    def addFichero() { }

    def upload(){
        def vNombreCarpeta = ''
        Caso caso =  Caso.get(params.idCaso)
        if(params.idCaso){
            vNombreCarpeta = caso.numAsunto
        }

        Session session = alfrescoConnectService.conectar()
        String rootPath = alfrescoContentService.getRootPath()
        String nombreCarpetaContenedoraCasos = rootPath+"/Casos/"

        //Obtenemos primero la carpeta contenedora
        CmisObject folder = alfrescoContentService.getFolderByPath(nombreCarpetaContenedoraCasos+vNombreCarpeta,session)

        if(folder == null){
            folder = alfrescoContentService.createFolder(nombreCarpetaContenedoraCasos,vNombreCarpeta,session)
        }

        //O se ha recuperado o se ha creado la carpeta para contener al fichero
        if(folder){
            MultipartFile fichero = params.file
            Document document = alfrescoContentService.createDocument(fichero,params.descripcion,folder)
            if(document){
                def idDocumento = document.getId()
                Fichero vFichero = new Fichero(nombre: params.nombre, descripcion: params.descripcion, notas: params.notas, idAlfresco: idDocumento)
                if(!vFichero.save(flush:true)){
                    println "Imposible crear el tipo Fichero"
                }
                else{
                    if(params.idCaso){
                        caso.addToFicheros(vFichero)
                        caso.save(flush:true)
                        flash.message = message(code: 'fichero.creado.con.exito')
                    }
                }
            }
            else{
                println "Imposible crear el documento"
            }
        }

        if(params.idCaso){
            redirect action:'show', controller:'caso', id:caso.id
        }
    }

    def download(Long id){
        Fichero fichero = Fichero.get(id)
        Session session = alfrescoConnectService.conectar()
        Document documento = session.getObject(fichero.idAlfresco)

        alfrescoContentService.streamFile(documento.getContentStream(),response)
    }

    def delete(Long id){

    }

}
