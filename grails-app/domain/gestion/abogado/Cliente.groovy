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

    static transients = ['nifYNombre']

    static hasMany = [casos:Caso, ficheros:Fichero]

    String toString(){"${nombre + " " + apellidos + " - " + nif}"}

    String getNifYNombre(){
        return nif + " - " + apellidos + ", " + nombre
    }
}
