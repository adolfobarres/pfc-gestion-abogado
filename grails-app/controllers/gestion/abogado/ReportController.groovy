import grails.plugin.springsecurity.annotation.Secured

import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.JasperReport
import net.sf.jasperreports.engine.JasperCompileManager
import net.sf.jasperreports.engine.*
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import net.sf.jasperreports.engine.export.*
import gestion.abogado.Factura;

import gestion.abogado.MainInfo

@Secured("ROLE_ADMIN")
class ReportController {

    def consultasService

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
