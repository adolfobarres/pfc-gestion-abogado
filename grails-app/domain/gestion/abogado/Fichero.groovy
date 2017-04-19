package gestion.abogado

class Fichero {
    String nombre
    String descripcion
    String notas
    String idAlfresco

    static constraints = {
        notas nullable: true
    }
}
