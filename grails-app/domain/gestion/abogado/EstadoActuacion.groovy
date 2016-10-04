package gestion.abogado

class EstadoActuacion {

    String codigo
    String descripcion

    static constraints = {
        codigo unique:true
    }

    String toString(){"${descripcion}"}


}
