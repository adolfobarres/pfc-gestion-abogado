package gestion.abogado

import org.grails.databinding.BindingFormat

class Factura {

    String numero
    Caso caso
    @BindingFormat('yyyy-MM-dd')
    Date fecha
    Integer iva
    Integer irpf


    static constraints = {
        numero unique: true
        iva range: 0..100
        irpf range: 0..100, nullable:true
    }

    static hasMany = [conceptos: ConceptoFactura]


}
