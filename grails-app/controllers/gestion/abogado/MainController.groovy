package gestion.abogado

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import groovy.sql.Sql

@Secured(["ROLE_ADMIN","ROLE_ABOGADO","ROLE_ADMINISTRATIVO"])
class MainController {
    def dataSource
    def springSecurityService

    def dashboard() { }

    def ultimosCasos(){
        def user = springSecurityService.currentUser
        def ultimosCasos = null
        if(user.authorities.any{ it.authority == "ROLE_ADMIN" } || user.authorities.any{ it.authority == "ROLE_ADMINISTRATIVO" } ){
            ultimosCasos = Caso.list().sort{it.fechaAlta}
        }
        else if(user.authorities.any{it.authority == "ROLE_ABOGADO"}){
            ultimosCasos = Caso.findAllByAddedBy(user).sort{it.fechaAlta}
        }
        def ultimosCasosOrdenados = null
        if(ultimosCasos.size()>5){
            ultimosCasosOrdenados = ultimosCasos.reverse()[0..4]
        }
        else{
            ultimosCasosOrdenados = ultimosCasos.reverse()
        }
        render template:'layouts/ultimosCasos', model: ['listCasos':ultimosCasosOrdenados]
    }

    def datosGraficaTartaProcedimientos(){
        def resultadoFinal = []

        def query =  "SELECT tipo_procedimiento.descripcion, count(tipo_procedimiento.id) AS num_tipos\n" +
                "FROM tipo_procedimiento\n" +
                "     LEFT OUTER JOIN caso ON caso.procedimiento_id = tipo_procedimiento.id\n" +
                "GROUP BY tipo_procedimiento.descripcion "

        def db = new Sql(dataSource)
        def result = db.rows(query)
        result.each{fila ->
            resultadoFinal << fila.values()
        }

        db.close()

        render resultadoFinal as JSON
    }

    def datosGraficaFacturacionMensualAnno(){
        def resultadoFinal = []
        def annoEnCurso = (new Date().getYear()+1900).toString()
        def query = "SELECT meses.nombre_mes,\n" +
                "       meses.anno                                      anno,\n" +
                "       round(IFNULL(sum(concepto_factura.importe * 1.21), 0),2) importe\n" +
                "FROM factura\n" +
                "     INNER JOIN concepto_factura\n" +
                "        ON (factura.id = concepto_factura.factura_id)\n" +
                "     RIGHT OUTER JOIN\n" +
                "     (SELECT 1 AS mes, 'Enero' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 2 AS mes, 'Febrero' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 3 AS mes, 'Marzo' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 4 AS mes, 'Abril' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 5 AS mes, 'Mayo' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 6 AS mes, 'Junio' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 7 AS mes, 'Julio' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 8 AS mes, 'Agosto' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 9 AS mes, 'Septiembre' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 10 AS mes, 'Octubre' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 11 AS mes, 'Noviembre' nombre_mes, year(NOW()) anno\n" +
                "      UNION\n" +
                "      SELECT 12 AS mes, 'Diciembre' nombre_mes, year(NOW()) anno) AS meses\n" +
                "        ON     meses.mes = month(factura.fecha)\n" +
                "           AND meses.anno = year(factura.fecha)\n" +
                "GROUP BY meses.mes\n" +
                "HAVING anno = " + annoEnCurso

        println annoEnCurso

        def db = new Sql(dataSource)
        def result = db.rows(query)
        result.each{fila ->
            resultadoFinal << [fila["nombre_mes"], fila["importe"]]
        }

        db.close()

        render resultadoFinal as JSON
    }

    def pestanaCaso(){
        session["pestanaCaso"] = params.pestana
        return true
    }
}
