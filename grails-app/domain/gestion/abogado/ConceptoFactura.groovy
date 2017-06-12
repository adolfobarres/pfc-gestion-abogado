package gestion.abogado

class ConceptoFactura {

    String descripcion
    Float importe
    Boolean esSuplido = false

    static belongsTo = [factura:Factura]
    static constraints = {
    }

    static transients = ['importeConIva']

    def getImporteConIva(){
        if(this.esSuplido){
            return this.importe
        }
        else{
            return this.importe + (this.importe * this.factura.iva/100)
        }

    }
}
