package gestion.abogado

class Prioridad {

    String codigo
    String descripcion

    static constraints = {
        codigo unique:true
    }

    String toString(){"${codigo +' - '+descripcion}"}
}
