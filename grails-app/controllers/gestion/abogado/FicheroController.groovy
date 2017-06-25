package gestion.abogado

import grails.plugin.springsecurity.annotation.Secured
import org.apache.chemistry.opencmis.client.api.CmisObject
import org.apache.chemistry.opencmis.client.api.Document
import org.apache.chemistry.opencmis.client.api.Folder
import org.apache.chemistry.opencmis.client.api.Session
import org.springframework.web.multipart.MultipartFile

@Secured(['ROLE_ADMIN','ROLE_ABOGADO'])
class FicheroController {
    def consultasService
    def alfrescoConnectService
    def alfrescoContentService

    def addFichero() {
        if(params.idCaso){
            ['actuaciones': Caso.get(params.idCaso).actuaciones.sort{it.descripcion}]
        }
    }

    def upload(){
        def vNombreCarpeta = ''
        Caso caso =  null
        Actuacion actuacion = null
        Cliente cliente = null
        Folder folder = null
        Session session = alfrescoConnectService.conectar()

        if(params.idCliente){
            cliente = Cliente.get(params.idCliente)
            vNombreCarpeta = cliente.nif
        }
        if(params.actuacion){
            actuacion = Actuacion.get(params.actuacion)
            vNombreCarpeta =  actuacion.caso.cliente.nif+"/"+actuacion.caso.numAsunto+"/"+actuacion.descripcion
        } else if(params.idCaso){
            caso = Caso.get(params.idCaso)
            vNombreCarpeta = caso.cliente.nif+"/"+caso.numAsunto
        }
        folder = alfrescoContentService.createPath(vNombreCarpeta,session)

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
                    if(params.actuacion){
                        actuacion.addToFicheros(vFichero)
                        actuacion.save(flush:true)
                        redirect action:'show', controller:'caso', id:actuacion.caso.id
                    }
                    else if (params.idCaso){
                        caso.addToFicheros(vFichero)
                        caso.save(flush:true)
                        redirect action:'show', controller:'caso', id:caso.id
                    }
                    else if (params.idCliente){
                        cliente.addToFicheros(vFichero)
                        cliente.save(flush:true)
                        redirect action:'show', controller:'cliente', id:cliente.id
                    }
                }
                flash.message = message(code: 'fichero.creado.con.exito')
            }
            else{
                flash.messageerror = message(code:"fichero.ya.existe")
            }
        }

    }

    def download(Long id){
        Fichero fichero = Fichero.get(id)
        Session session = alfrescoConnectService.conectar()
        Document documento = session.getObject(fichero.idAlfresco)

        alfrescoContentService.streamFile(documento.getContentStream(),response)
    }

    def delete(Long id){
        Fichero fichero = Fichero.get(id)
        Caso caso = null
        Actuacion actuacion = null
        Cliente cliente = null

        if(params.idCaso){
            caso = Caso.get(params.idCaso)
        }else if(params.idActuacion){
            actuacion = Actuacion.get(params.idActuacion)
        }else if(params.idCliente){
            cliente = Cliente.get(params.idCliente)
        }

        if(fichero){
            //borra el fichero en ALfresco
            Session session =  alfrescoConnectService.conectar()
            CmisObject fileAlfresco = session.getObject(fichero.idAlfresco)
            if(fileAlfresco){
                fileAlfresco.delete()
            }
            //Borra el fichero en SIGAB
            if(params.idCaso){
                caso.removeFromFicheros(fichero)
            }
            else if(params.idActuacion){
                actuacion.removeFromFicheros(fichero)
            }else if(params.idCliente){
                cliente.removeFromFicheros(fichero)
            }

            fichero.delete(flush: true)

        }
        flash.message = message(code:"fichero.borrado.con.exito")
        redirect(uri: request.getHeader('referer') )
    }

    def list(){
        ['ficheros':null]
    }

    def displayThumbnail(Long id){
        Fichero fichero = Fichero.get(id)
        def thumbnail = fichero.thumbnail
        if(fichero.thumbnail != null){
            OutputStream out = response.getOutputStream();
            response.setContentType("application/png")
            out.write(thumbnail)
            out.flush()
            out.close()
        }
        return

    }

    def busquedaContenido(){
        def result = null
        if(params.contenido) {
            Session session = alfrescoConnectService.conectar()
            result = alfrescoContentService.findByContent(params.contenido, session)
        }
        render template:'/fichero/layouts/tablaFicheros', model:['ficheros':result]

    }

    def busqueda(){
        println params
        def listaFicheros = []
        Fichero fichero = null

        def datos = consultasService.obtenerIdFicheros(params)
        if(datos.size()>0){
            datos.each{ idalfresco ->
                fichero = Fichero.findByIdAlfresco(idalfresco.id_alfresco)
                if(fichero){
                    listaFicheros << fichero
                }
            }
        }

        render template:'/fichero/layouts/tablaFicheros', model:['ficheros':listaFicheros]
    }




}
