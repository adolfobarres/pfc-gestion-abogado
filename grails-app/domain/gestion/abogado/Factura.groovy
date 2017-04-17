package gestion.abogado

import grails.databinding.BindingFormat


class Factura {

    String numero
    Caso caso
    @BindingFormat('yyyy-MM-dd')
    Date fecha
    Integer iva
    Integer irpf
    Boolean abonada


    static constraints = {
        numero unique: true
        iva range: 0..100
        irpf range: 0..100, nullable:true
        abonada nullable: true
    }

    static hasMany = [conceptos: ConceptoFactura]


}
