package gestion.abogado

import grails.test.mixin.*
import spock.lang.*

@TestFor(TipoProcedimientoController)
@Mock(TipoProcedimiento)
class TipoProcedimientoControllerSpec extends Specification {

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
            !model.tipoProcedimientoList
            model.tipoProcedimientoCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.tipoProcedimiento!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def tipoProcedimiento = new TipoProcedimiento()
            tipoProcedimiento.validate()
            controller.save(tipoProcedimiento)

        then:"The create view is rendered again with the correct model"
            model.tipoProcedimiento!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            tipoProcedimiento = new TipoProcedimiento(params)

            controller.save(tipoProcedimiento)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/tipoProcedimiento/show/1'
            controller.flash.message != null
            TipoProcedimiento.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def tipoProcedimiento = new TipoProcedimiento(params)
            controller.show(tipoProcedimiento)

        then:"A model is populated containing the domain instance"
            model.tipoProcedimiento == tipoProcedimiento
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def tipoProcedimiento = new TipoProcedimiento(params)
            controller.edit(tipoProcedimiento)

        then:"A model is populated containing the domain instance"
            model.tipoProcedimiento == tipoProcedimiento
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/tipoProcedimiento/index'
            flash.message != null

        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def tipoProcedimiento = new TipoProcedimiento()
            tipoProcedimiento.validate()
            controller.update(tipoProcedimiento)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.tipoProcedimiento == tipoProcedimiento

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            tipoProcedimiento = new TipoProcedimiento(params).save(flush: true)
            controller.update(tipoProcedimiento)

        then:"A redirect is issued to the show action"
            tipoProcedimiento != null
            response.redirectedUrl == "/tipoProcedimiento/show/$tipoProcedimiento.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/tipoProcedimiento/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def tipoProcedimiento = new TipoProcedimiento(params).save(flush: true)

        then:"It exists"
            TipoProcedimiento.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(tipoProcedimiento)

        then:"The instance is deleted"
            TipoProcedimiento.count() == 0
            response.redirectedUrl == '/tipoProcedimiento/index'
            flash.message != null
    }
}
