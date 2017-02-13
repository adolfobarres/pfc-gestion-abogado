package gestion.abogado
import org.grails.databinding.BindingFormat

class Caso {

    String numAsunto
    @BindingFormat('yyyy-MM-dd')
    Date fechaAlta
    SubtipoAsunto subtipoAsunto
    TipoProcedimiento procedimiento
    Cliente cliente
    String juzgado

    static constraints = {
        numAsunto unique:true
    }

    static hasMany = [actuaciones: Actuacion]

    static transients = ['numActuacionesPendientes','estadoCaso']

    String toString(){"${numAsunto} - ${procedimiento}"}

    Integer getNumActuacionesPendientes(){
        Integer numActuacionesPendientes = this.actuaciones.findAll{it.fechaFin != null}.size()
        numActuacionesPendientes
    }

    String getEstadoCaso(){
        if(this.actuaciones.size() == 0){
            "default"
        }
        else{
            if(this.numActuacionesPendientes == this.actuaciones.size()){
                "success"
            }
            else if(this.numActuacionesPendientes == 0){
                "danger"
            }else{
                "warning"
            }
        }

    }

}
