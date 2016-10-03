package gestion.abogado

class SubtipoAsunto {

    TipoAsunto tipoAsunto
    String descripcion

    static constraints = {
        tipoAsunto fetch: 'join'
    }

    String toString(){ "${descripcion}" }
}
