package gestion.abogado

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class ConsultasService {
    def dataSource

    def obtenerDatosFactura(Long id) {

        String query = "select cliente.nombre, cliente.apellidos, factura.numero, " +
                "       factura.fecha, concepto_factura.descripcion, concepto_factura.importe," +
                "      if( " +
                "        concepto_factura.es_suplido, " +
                "        concepto_factura.importe, " +
                "        concepto_factura.importe " +
                "                + (concepto_factura.importe * factura.iva / 100)) " +
                "        AS importe_con_iva " +
                "  from factura" +
                "    left join concepto_factura on factura.id = concepto_factura.factura_id" +
                "    inner join caso on factura.caso_id = caso.id" +
                "    inner join cliente on caso.cliente_id = cliente.id" +
                "    and factura.id = " + id



        def sql = new Sql(dataSource)
        def rows = sql.rows(query)
        return rows
    }

    def listaFacturas(def params){
        String query="SELECT factura.numero, \
                            caso.num_asunto, \
                            cliente.nif, \
                            cliente.nombre, \
                            cliente.apellidos, \
                            factura.fecha, \
                            factura.iva, \
                            factura.irpf, \
                            round(sum(concepto_factura.importe), 2) importe_sin_iva, \
                            round( \
                                    sum( \
                                            if(concepto_factura.es_suplido, \
                                            concepto_factura.importe, \
                                            concepto_factura.importe * (1 + factura.iva / 100))) \
                                    - if(factura.irpf, \
                            sum(concepto_factura.importe * factura.irpf / 100), \
                            0), \
                            2) \
                            importe_con_iva, \
                            if(factura.abonada, 'SI', 'NO')         abonada \
                            FROM factura \
                            INNER JOIN concepto_factura \
                            ON concepto_factura.factura_id = factura.id \
                            INNER JOIN caso ON caso.id = factura.caso_id \
                            INNER JOIN cliente ON cliente.id = caso.cliente_id \
                            WHERE 1 = 1 "


        if(params.anno){
            query += " AND DATE_FORMAT(fecha,'%Y') = " + params.anno
        }
        if(params.mes){
            query += " AND DATE_FORMAT(fecha,'%m') = " + params.mes
        }

        query +=  "     group by 1"

        def sql = new Sql(dataSource)
        def rows = sql.rows(query)
        return rows
    }

    def listaClientes(def params){
        String query = "SELECT nombre,\n" +
                "       apellidos,\n" +
                "       nif,\n" +
                "       email,\n" +
                "       telefono,\n" +
                "       movil,\n" +
                "       pais,\n" +
                "       poblacion,\n" +
                "       direccion,\n" +
                "       cp,\n" +
                "       provincia\n" +
                "FROM cliente"

        if(params.orden){
            query += " order by "+params.orden
        }

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
