package gestion.abogado
import com.spring.security.User
import grails.databinding.BindingFormat

class Caso {

    def springSecurityService

    String numAsunto
    @BindingFormat('yyyy-MM-dd')
    Date fechaAlta
    SubtipoAsunto subtipoAsunto
    TipoProcedimiento procedimiento
    Cliente cliente
    String juzgado

    Date dateCreated
    User addedBy
    Date lastUpdated

    static constraints = {
        numAsunto unique:true
        lastUpdated nullable: true
        dateCreated nullable:true
    }

    static hasMany = [actuaciones: Actuacion, facturas: Factura, ficheros: Fichero]

    static transients = ['numActuacionesPendientes','estadoCaso']

    String toString(){"${numAsunto} - ${procedimiento}"}

    def beforeValidate(){
        println springSecurityService.currentUser
        addedBy =  springSecurityService.currentUser
    }

    Integer getNumActuacionesPendientes(){
        Integer numActuacionesPendientes = this.actuaciones.findAll{it.fechaFin != null}.size()
        numActuacionesPendientes
    }

    String getEstadoCaso(){
        if(this.actuaciones.size() == 0){
            "default"
        }
        else{
            if(this.numActuacionesPendientes == this.actuaciones.size()){
                "success"
            }
            else if(this.numActuacionesPendientes == 0){
                "danger"
            }else{
                "warning"
            }
        }

    }

}
