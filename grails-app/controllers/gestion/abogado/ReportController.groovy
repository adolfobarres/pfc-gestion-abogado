import grails.plugin.springsecurity.annotation.Secured
import groovy.sql.Sql
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.JasperReport
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.*
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import net.sf.jasperreports.engine.export.*
import gestion.abogado.Factura;

import gestion.abogado.MainInfo

@Secured(["ROLE_ADMIN","ROLE_ABOGADO","ROLE_ADMINISTRATIVO"])
class ReportController {

    def consultasService
    def dataSource

    def index(){}

    def listaFacturas(){
        def sql = new Sql(dataSource)
        def rows = sql.rows('select distinct(date_format(fecha,"%Y")) as anno from factura order by 1 desc')

        ['annos':rows]
    }

    def reportListaFacturas(){
        def datos = consultasService.listaFacturas(params)
        def realPath = servletContext.getRealPath("/reports/MyReports/")
        MainInfo infoGeneral = MainInfo.list().first()
        params.tituloDespacho = infoGeneral.tituloDespacho
        params.nifDespacho = infoGeneral.cif
        params.emailDespacho = infoGeneral.email
        params.filtro = "\nmes: "+params.mes + "\naño: " + params.anno

        JasperReport jasperReport = JasperCompileManager.compileReport(realPath+"/lista_facturas.jrxml");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, new JRBeanCollectionDataSource(datos));
        response.contentType = "application/pdf"
        response.setHeader("Content-disposition", "attachment;filename=listaFacturas"+params.mes+"_"+params.anno+".pdf")
        JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());
    }

    def graficaFacturacionMensual(){}

    def listaClientes(){}

    def reportListaClientes(def params){
        def datos = consultasService.listaClientes(params)
        def realPath = servletContext.getRealPath("/reports/MyReports/")
        MainInfo infoGeneral = MainInfo.list().first()
        params.tituloDespacho = infoGeneral.tituloDespacho
        params.nifDespacho = infoGeneral.cif
        params.emailDespacho = infoGeneral.email
        params.filtro = "\norden: "+params.orden

        JasperReport jasperReport = JasperCompileManager.compileReport(realPath+"/lista_clientes.jrxml");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, new JRBeanCollectionDataSource(datos));
        response.contentType = "application/pdf"
        response.setHeader("Content-disposition", "attachment;filename=listaClientes"+"_"+params.orden+".pdf")
        JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());
    }

    def printFactura(Long id){

        Factura factura = Factura.get(id)

        def datos = consultasService.obtenerDatosFactura(id)
        def realPath = servletContext.getRealPath("/reports/MyReports/")
        MainInfo infoGeneral = MainInfo.list().first()

        params.iva = factura.iva.toFloat()
        params.irpf = factura.irpf ? factura.irpf.toFloat() : 0.toFloat()
        params.nombreCliente = factura.caso.cliente.nombre + " " + factura.caso.cliente.apellidos
        params.cif = factura.caso.cliente.nif
        params.ciudadDespacho = infoGeneral.direccion
        params.domicilio = factura.caso.cliente.direccion
        params.tituloDespacho = infoGeneral.tituloDespacho
        params.nifDespacho = infoGeneral.cif
        params.emailDespacho = infoGeneral.email



        JasperReport jasperReport = JasperCompileManager.compileReport(realPath+"/factura.jrxml");
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, new JRBeanCollectionDataSource(datos));
        response.contentType = "application/pdf"
        response.setHeader("Content-disposition", "attachment;filename=factura_"+datos[0]['numero']+".pdf")
        JasperExportManager.exportReportToPdfStream(jasperPrint,response.getOutputStream());


    }

}
