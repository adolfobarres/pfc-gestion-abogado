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
}