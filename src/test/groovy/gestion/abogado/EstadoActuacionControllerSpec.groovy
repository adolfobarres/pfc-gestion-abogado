package gestion.abogado

import grails.test.mixin.*
import spock.lang.*

@TestFor(EstadoActuacionController)
@Mock(EstadoActuacion)
class EstadoActuacionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.estadoActuacionList
            model.estadoActuacionCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.estadoActuacion!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def estadoActuacion = new EstadoActuacion()
            estadoActuacion.validate()
            controller.save(estadoActuacion)

        then:"The create view is rendered again with the correct model"
            model.estadoActuacion!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            estadoActuacion = new EstadoActuacion(params)

            controller.save(estadoActuacion)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/estadoActuacion/show/1'
            controller.flash.message != null
            EstadoActuacion.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def estadoActuacion = new EstadoActuacion(params)
            controller.show(estadoActuacion)

        then:"A model is populated containing the domain instance"
            model.estadoActuacion == estadoActuacion
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def estadoActuacion = new EstadoActuacion(params)
            controller.edit(estadoActuacion)

        then:"A model is populated containing the domain instance"
            model.estadoActuacion == estadoActuacion
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/estadoActuacion/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def estadoActuacion = new EstadoActuacion()
            estadoActuacion.validate()
            controller.update(estadoActuacion)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.estadoActuacion == estadoActuacion

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            estadoActuacion = new EstadoActuacion(params).save(flush: true)
            controller.update(estadoActuacion)

        then:"A redirect is issued to the show action"
            estadoActuacion != null
            response.redirectedUrl == "/estadoActuacion/show/$estadoActuacion.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/estadoActuacion/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def estadoActuacion = new EstadoActuacion(params).save(flush: true)

        then:"It exists"
            EstadoActuacion.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(estadoActuacion)

        then:"The instance is deleted"
            EstadoActuacion.count() == 0
            response.redirectedUrl == '/estadoActuacion/index'
            flash.message != null
    }
}
