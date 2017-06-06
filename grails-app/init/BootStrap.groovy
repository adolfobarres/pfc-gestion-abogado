import com.spring.security.Role
import com.spring.security.User
import com.spring.security.UserRole
import grails.util.Holders
import groovy.sql.Sql

class BootStrap {

    def dataSource

    def init = { servletContext ->

        /*def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def userRole = new Role(authority: 'ROLE_USER').save()

        def testUser = new User(username: 'me', password: 'password').save()

        UserRole.create testUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }*/

        /*println "----Cargando vistas----"
        String sqlString = new File("${System.properties['user.dir']}/grails-app/data/vistas.sql").text
        Sql sql = Sql.newInstance(dataSource)
        sql.execute(sqlString)
        println "----vistas cargadas con éxito----"*/

    }
}