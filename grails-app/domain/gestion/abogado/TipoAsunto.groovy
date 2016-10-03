package gestion.abogado

class TipoAsunto {

    String descripcion

    static constraints = {
        descripcion unique: true
        subtipos lazy:false
    }

    static hasMany = [subtipos:SubtipoAsunto]

    String toString(){"${descripcion}"}
}
