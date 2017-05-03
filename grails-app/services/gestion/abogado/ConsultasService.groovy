package gestion.abogado

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class ConsultasService {
    def dataSource

    def obtenerDatosFactura(Long id) {

        String query = "select cliente.nombre, cliente.apellidos, factura.numero, " +
                "       factura.fecha, concepto_factura.descripcion, concepto_factura.importe" +
                "  from factura" +
                "    left join concepto_factura on factura.id = concepto_factura.factura_id" +
                "    inner join caso on factura.caso_id = caso.id" +
                "    inner join cliente on caso.cliente_id = cliente.id" +
                "    and factura.id = " + id



        def sql = new Sql(dataSource)
        def rows = sql.rows(query)
        return rows
    }

    def obtenerIdFicheros(def params){
        String query = "select id_alfresco from v_lista_ficheros where 1 = 1"
        if(params.dni){
            query += " and DNI like \"%"+params.dni+"%\""
        }
        if(params.caso){
            query += " and caso like \"%"+params.caso+"%\""
        }


        def sql = new Sql(dataSource)
        def rows = sql.rows(query)
        return rows
    }
}
