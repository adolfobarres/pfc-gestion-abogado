package gestion.abogado

class ConceptoFactura {

    String descripcion
    Float importe

    static belongsTo = [factura:Factura]
    static constraints = {
    }
}
