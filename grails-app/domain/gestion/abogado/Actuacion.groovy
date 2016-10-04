package gestion.abogado

class Actuacion {

    Date fechaAlta
    Date fechaVencimiento
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
            if(fechaVencimiento.compareTo(new Date())<0){
                "danger"
            }
        }

    }
}
