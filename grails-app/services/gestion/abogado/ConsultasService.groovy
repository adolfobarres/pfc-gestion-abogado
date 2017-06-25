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
        if(params.descripcion){
            query += " and (nombre like \"%"+params.descripcion+"%\" or descripcion like \"%"+params.descripcion+"%\")"
        }


        def sql = new Sql(dataSource)
        def rows = sql.rows(query)
        return rows
    }

    def listaCitas(def params){

        String query = "SELECT date_format(cita.fecha,'%d/%m/%Y') as fecha,\n" +
                "       concat(lpad(cita.hora_comienzo, 2, '0'),\":\",lpad(cita.minutos_comienzo, 2, '0')) AS inicio,\n" +
                "       concat(lpad(cita.hora_fin, 2, '0'),\":\",lpad(cita.minutos_fin, 2, '0')) AS fin,\n" +
                "       cliente.nif,\n" +
                "       cliente.apellidos,\n" +
                "       cliente.nombre,\n" +
                "       caso.num_asunto,\n" +
                "       tipo_asunto.descripcion as tipo_asunto,\n" +
                "       subtipo_asunto.descripcion as subtipo_asunto\n" +
                "FROM cita\n" +
                "     INNER JOIN cliente ON cliente.id = cita.cliente_id\n" +
                "     LEFT OUTER JOIN caso ON caso.id = cita.caso_id\n" +
                "     INNER JOIN subtipo_asunto\n" +
                "        ON subtipo_asunto.id = caso.subtipo_asunto_id\n" +
                "     INNER JOIN tipo_asunto\n" +
                "        ON tipo_asunto.id = subtipo_asunto.tipo_asunto_id where 1 = 1"

        if(params.from){
            query += " and fecha >= STR_TO_DATE('"+params.from+"', '%Y-%m-%d')"
        }
        if(params.to){
            query += " and fecha <= STR_TO_DATE('"+params.to+"', '%Y-%m-%d')"
        }

        String orderBY =  " ORDER BY cita.fecha, cita.hora_comienzo, cita.minutos_comienzo"

        query += orderBy
        def sql = new Sql(dataSource)
        def rows = sql.rows(query)
        return rows
    }
}
