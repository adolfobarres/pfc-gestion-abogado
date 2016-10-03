package gestion.abogado

class TipoProcedimiento {

    String descripcion

    static constraints = {
        descripcion unique:true
    }

    String toString(){"${descripcion}"}
}
