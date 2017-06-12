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
    String formaDePago


    static constraints = {
        numero unique: true
        iva range: 0..100
        irpf range: 0..100, nullable:true
        abonada nullable: true
    }

    static transients = ['totalBase','totalIva','totalIrpf']

    static hasMany = [conceptos: ConceptoFactura]

    def getTotalBase(){
        if(this.conceptos){
            return this.conceptos.importe.sum()
        }
        else{
            return 0
        }
    }

    def getTotalIva(){
        if(this.conceptos){
            return this.conceptos.importeConIva.sum()
        }
        else{
            return 0
        }
    }

    def getTotalIrpf(){
        if(this.irpf){
            return this.totalBase * (this.irpf / 100)
        }
        else {
            return 0
        }
    }




}
