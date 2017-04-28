package com.alfresco

import grails.transaction.Transactional
import org.apache.chemistry.opencmis.client.api.CmisObject
import org.apache.chemistry.opencmis.client.api.Folder
import org.apache.chemistry.opencmis.client.api.OperationContext
import org.apache.chemistry.opencmis.client.api.Session
import org.apache.chemistry.opencmis.client.util.OperationContextUtils
import org.apache.chemistry.opencmis.commons.PropertyIds
import org.apache.chemistry.opencmis.commons.data.ContentStream
import org.apache.chemistry.opencmis.commons.enums.VersioningState
import org.apache.chemistry.opencmis.commons.impl.dataobjects.ContentStreamImpl

import javax.swing.text.Document

@Transactional
class AlfrescoContentService {

    def rootPath = "/Sitios/abogado-y-tributos/documentlibrary"

    String getRootPath(){
        return rootPath
    }

    CmisObject  getRootFolder(Session session){
        this.getFolderByPath(rootPath,session)
    }


    CmisObject getFolderByPath(String path,Session session){
        try{
            OperationContext oc = OperationContextUtils.createMaximumOperationContext();
            CmisObject folder = session.getObjectByPath(path,oc);
            return folder
        }
        catch(Exception e){
            println e
            return null
        }

    }

    Folder createFolder(String path, String name, Session session){
        def parentFolder = getFolderByPath(path, session)
        if(parentFolder) {
            Map<String, Object> properties = new HashMap<String, Object>();
            properties.put(PropertyIds.NAME, name);
            properties.put(PropertyIds.OBJECT_TYPE_ID, "cmis:folder");

            // create the folder
            try {
                Folder newFolder = parentFolder.createFolder(properties);
                return newFolder
            }
            catch (Exception e) {
                log.error("Imposible crear la carpeta")
                return null
            }
        }

    }

    def createDocument(def fichero, def description, def parentFolder){
        try{
            def mimetype = fichero.getContentType()
            byte [] content=fichero.getBytes()
            InputStream inputStream = new ByteArrayInputStream(content)
            // properties
            // (minimal set: name and object type id)
            Map<String, Object> properties = new HashMap<String, Object>();
            properties.put(PropertyIds.OBJECT_TYPE_ID, "cmis:document");
            properties.put(PropertyIds.NAME, fichero.getOriginalFilename());
            if(description){
                properties.put(PropertyIds.DESCRIPTION, description);
            }
            // content
            ContentStream contentStream = new ContentStreamImpl(fichero.getOriginalFilename(), BigInteger.valueOf(content.length), mimetype, inputStream);

            // create a major version
            def newDoc = parentFolder.createDocument(properties, contentStream, VersioningState.MAJOR);
            return newDoc
        }
        catch(Exception e){
            println e
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

    /*def createDocument(parent,String filename,String name,String description=null, Session session){
        File f = new File(filename)

        def is = new FileInputStream(f);

        ContentStream contentStream = session.getObjectFactory().createContentStream(name,f.size(), mimetype, is);

        def properties=[:]
        properties.put(PropertyIds.OBJECT_TYPE_ID, "cmis:document,P:cm:titled");
        properties.put(PropertyIds.NAME, name);
        if (description) {
            properties.put("cm:description",description);
        }

        Document doc = parentFolder.createDocument(properties, contentStream, VersioningState.NONE);
        is.close();

        return doc
    }*/


    def createPath(String cmisPath, def session) {

        def pathElements = cmisPath.split("/")

        def parent = this.getFolderByPath(rootPath, session)
        def path = rootPath
        def pathAbuscar = path
        pathElements.each { pathElement ->
            if (pathElement.length() > 0) {
                path = pathAbuscar
                pathAbuscar = pathAbuscar + "/" + pathElement
                //println "Path: " + path + ", PathAbuscar: " +pathAbuscar+ ", PathElement: " + pathElement
                def entry = this.getFolderByPath(pathAbuscar, session)

                if (!entry) {
                    this.createFolder(path, pathElement, session)
                    parent = this.getFolderByPath(pathAbuscar, session)
                } else {
                    parent = entry
                }
            }

        }
        return parent
    }

}

