import grails.plugin.springsecurity.annotation.Secured
import net.sf.jasperreports.engine.JRDataSource
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import gestion.abogado.Factura;

@Secured("ROLE_ADMIN")
class ReportController {

    def dataSource
    def consultasService

    def printFactura(Long id){
        String reportName, namaFile, dotJasper
        namaFile = "factura"
        reportName = grailsApplication.mainContext.getResource('reports/MyReports/' + namaFile + '.jrxml').file.getAbsoluteFile()
        dotJasper  = grailsApplication.mainContext.getResource('reports/MyReports/' + namaFile + '.jasper').file.getAbsoluteFile()
        Map<String, String> reportParams = new HashMap<String, String>()

        def yourBeanCollection = consultasService.obtenerDatosFactura(id)

        JRDataSource beanCollectionDataSource = new JRBeanCollectionDataSource(yourBeanCollection);
        // compiles jrxml
        JasperCompileManager.compileReportToFile(reportName);
        // fills compiled report with parameters and a connection
        JasperPrint jasperPrint = JasperFillManager.fillReport(dotJasper,reportParams, beanCollectionDataSource);
        ByteArrayOutputStream  pdfStream = new ByteArrayOutputStream();

        // exports report to pdf
        JRExporter exporter = new JRPdfExporter();
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, pdfStream); // your output goes here

        exporter.exportReport();
        render(file: pdfStream.toByteArray(), contentType: 'application/pdf')
    }

    def print() {
        try {
            String reportName, namaFile, dotJasper
            namaFile = "factura"
            reportName = grailsApplication.mainContext.getResource('reports/MyReports/' + namaFile + '.jrxml').file.getAbsoluteFile()
            dotJasper = grailsApplication.mainContext.getResource('reports/MyReports/' + namaFile + '.jasper').file.getAbsoluteFile()
            println reportName
            // Report parameter
            Map<String, String> reportParam = new HashMap<String, String>()

            // compiles jrxml
            JasperCompileManager.compileReportToFile(reportName);
            // fills compiled report with parameters and a connection
            JasperPrint print = JasperFillManager.fillReport(dotJasper, reportParam, dataSource.getConnection());
            println print
            ByteArrayOutputStream  pdfStream = new ByteArrayOutputStream();

            // exports report to pdf
            JRExporter exporter = new JRPdfExporter();
            exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, pdfStream); // your output goes here

            exporter.exportReport();

        } catch (Exception e) {

            throw new RuntimeException("It's not possible to generate the pdf report.", e);
        } finally {
            render(file: pdfStream.toByteArray(), contentType: 'application/pdf')
        }
    }
}
