package gestion.abogado

class MainInfo {

    String nombreDespacho
    String tituloDespacho
    String subtituloDespacho
    String cif
    String direccion
    String telefono
    String fax
    String movil
    String email

    Integer iva
    Integer irpf

    static constraints = {
        fax nullable: true
        tituloDespacho nullable: true
        subtituloDespacho nullable: true
        iva range: 0..100
        irpf range: 0..100
    }
}
