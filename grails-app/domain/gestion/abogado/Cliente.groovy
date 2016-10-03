package gestion.abogado

class Cliente {

    String nombre
    String apellidos
    String nif
    String email
    String telefono
    String movil
    String poblacion
    String direccion
    String provincia
    String cp
    String pais


    static constraints = {
        nombre()
        apellidos()
        nif unique:true
        email email:true

    }

    String toString(){"${nombre + " " + apellidos + " - " + nif}"}
}
