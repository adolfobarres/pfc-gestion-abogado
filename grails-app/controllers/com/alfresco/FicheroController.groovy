package com.alfresco

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.apache.chemistry.opencmis.client.api.CmisObject
import org.apache.chemistry.opencmis.client.api.Document
import org.apache.chemistry.opencmis.client.api.Folder
import org.apache.chemistry.opencmis.client.api.Session

@Secured("ROLE_ADMIN")
class FicheroController {
    def alfrescoConnectService
    def alfrescoContentService

    def test() {
        Session session = alfrescoConnectService.conectar()
        Folder rootFolder = alfrescoContentService.getRootFolder(session)
        Folder nuevaCarpeta = alfrescoContentService.createFolder(rootFolder,'nuevaCarpeta2')
        def documento = alfrescoContentService.getDocument('962d7b3c-1243-430b-a523-f1dedc5b7ae1',session)
        alfrescoContentService.streamFile(documento.contentStream,response)


        }
}
