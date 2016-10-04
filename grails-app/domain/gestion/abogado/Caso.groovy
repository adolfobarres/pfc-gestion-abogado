package gestion.abogado
import org.grails.databinding.BindingFormat

class Caso {

    String numAsunto
    @BindingFormat('yyyy-MM-dd')
    Date fechaAlta
    SubtipoAsunto subtipoAsunto
    TipoProcedimiento procedimiento
    Cliente cliente
    String juzgado

    static constraints = {
        numAsunto unique:true
    }

    static hasMany = [actuaciones: Actuacion]

    String toString(){"${numAsunto}"}
}
