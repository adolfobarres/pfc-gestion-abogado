package gestion.abogado

import org.grails.databinding.BindingFormat

class Actuacion {
    @BindingFormat('yyyy-MM-dd')
    Date fechaAlta
    @BindingFormat('yyyy-MM-dd')
    Date fechaVencimiento
    @BindingFormat('yyyy-MM-dd')
    Date fechaFin
    EstadoActuacion estadoActuacion
    Prioridad prioridad
    String descripcion
    Caso caso
    String notas

    static constraints = {
        fechaFin nullable: true
        notas nullable:true
        fechaVencimiento nullable: true
    }

    static transients = ['clase']

    String toString(){"${descripcion}"}

    def getClase(){
        if(fechaFin){
            "success"
        }else{
            if(fechaVencimiento){
                if(fechaVencimiento.compareTo(new Date())<0){
                    "danger"
                }
            }

        }

    }
}
