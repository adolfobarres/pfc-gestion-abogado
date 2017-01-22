package gestion.abogado

class TipoCita {

    String codigo
    String descripcion
    Integer duracionMediaHoras
    Integer duracionMediaMinutos


    static constraints = {
    }

    String toString(){"${codigo} - ${descripcion} (aprox ${duracionMediaHoras} h, ${duracionMediaMinutos} m )"}
}
