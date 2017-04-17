package com.alfresco

import grails.converters.JSON
import grails.transaction.Transactional
import org.apache.chemistry.opencmis.client.api.CmisObject
import org.apache.chemistry.opencmis.client.api.Document
import org.apache.chemistry.opencmis.client.api.Folder
import org.apache.chemistry.opencmis.client.api.ItemIterable
import org.apache.chemistry.opencmis.client.api.OperationContext
import org.apache.chemistry.opencmis.client.api.QueryResult
import org.apache.chemistry.opencmis.client.api.Repository
import org.apache.chemistry.opencmis.client.api.Session
import org.apache.chemistry.opencmis.client.api.SessionFactory
import org.apache.chemistry.opencmis.client.runtime.SessionFactoryImpl
import org.apache.chemistry.opencmis.client.util.OperationContextUtils
import org.apache.chemistry.opencmis.commons.PropertyIds
import org.apache.chemistry.opencmis.commons.SessionParameter
import org.apache.chemistry.opencmis.commons.data.PropertyData
import org.apache.chemistry.opencmis.commons.enums.BindingType



@Transactional
class AlfrescoConnectService {

    def conectar() {
        // default factory implementation
        SessionFactory factory = SessionFactoryImpl.newInstance();
        Map<String, String> parameters = new HashMap<String, String>();

        // user credentials
        parameters.put(SessionParameter.USER, "admin");
        parameters.put(SessionParameter.PASSWORD, "mpchsup206");

        // connection settings
        parameters.put(SessionParameter.ATOMPUB_URL, "http://127.0.0.1:8080/alfresco/api/-default-/public/cmis/versions/1.1/atom");
        parameters.put(SessionParameter.BINDING_TYPE, BindingType.ATOMPUB.value());
        parameters.put(SessionParameter.REPOSITORY_ID, "-default-");
        //Repository repository = factory.getRepositories(parameters).get(0);
        //println repository
        // create session
        Session session = factory.createSession(parameters);
        Folder rootFolder = session.getRootFolder();


        OperationContext oc = OperationContextUtils.createMinimumOperationContext("cmis:objectId", "cmis:name", "cmis:createdBy");
        // find all folders starting with 'a' or 'A'
        def resultado = []
        ItemIterable<CmisObject> results =
                session.queryObjects("cmis:folder", "cmis:name LIKE '%exp%'", false, oc);

        for (CmisObject cmisObject : results) {
            Folder document = (Folder) cmisObject;
            Map<String, Object> properties = new HashMap<String, Object>();
            properties.put(PropertyIds.OBJECT_TYPE_ID, "cmis:folder");
            properties.put(PropertyIds.NAME, "a new folder");

//
            Folder newFolder = document.createFolder(properties);
            resultado << ["documentoId":document.getId(),"documentoNombre":document.getName()]
        }


        return resultado
    }
}
