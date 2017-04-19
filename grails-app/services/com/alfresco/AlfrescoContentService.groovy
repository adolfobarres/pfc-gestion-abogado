package com.alfresco

import grails.transaction.Transactional
import org.apache.chemistry.opencmis.client.api.CmisObject
import org.apache.chemistry.opencmis.client.api.Folder
import org.apache.chemistry.opencmis.client.api.Document
import org.apache.chemistry.opencmis.client.api.OperationContext
import org.apache.chemistry.opencmis.client.api.Session
import org.apache.chemistry.opencmis.client.runtime.DocumentImpl
import org.apache.chemistry.opencmis.client.util.OperationContextUtils
import org.apache.chemistry.opencmis.commons.PropertyIds
import org.apache.chemistry.opencmis.commons.data.ContentStream

import javax.swing.text.Document

@Transactional
class AlfrescoContentService {

    def alfrescoConnectService

    Folder getRootFolder(Session session){
        this.getFolderByPath("/Sitios/abogado-y-tributos",session)
    }


    Folder getFolderByPath(String path,Session session){
        OperationContext oc = OperationContextUtils.createMaximumOperationContext();
        Folder folder = (Folder) session.getObjectByPath(path,oc);

        return folder
    }

    Folder createFolder(Folder parentFolder,String name){

        Map<String, Object> properties = new HashMap<String, Object>();
        properties.put(PropertyIds.NAME, name);
        properties.put(PropertyIds.OBJECT_TYPE_ID, "cmis:folder");

        // create the folder
        try{
            Folder newFolder = parentFolder.createFolder(properties);
            return newFolder
        }
        catch(Exception e){
            log.error("Imposible crear la carpeta")
            return null
        }

    }

    def getDocument(String id, Session session){

        try{
            CmisObject cmisObject = session.getObject(id);
            if(cmisObject){
                return cmisObject
            }
            else{
                return null
            }
        }
        catch (Exception e){
            println e
            log.error("Imposible obtener el documento con id: " + id)
            return null
        }

    }

    def streamFile(ContentStream contentStream, response) {
        response.setHeader("Content-disposition", "attachment; filename=\"" +contentStream.fileName+"\"")
        response.setHeader("Content-Type", contentStream.mimeType)

        def inputStream=contentStream.stream
        def bufsize=100000
        byte[] bytes=new byte[(int)bufsize]

        def offset=0
        def len=1
        while (len>0) {
            len=inputStream.read(bytes, 0, bufsize)
            if (len>0)
                response.outputStream.write(bytes,0,len)
            offset+=bufsize
        }
        response.outputStream.flush()
    }

}
