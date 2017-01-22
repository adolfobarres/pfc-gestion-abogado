package gestion.abogado

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "caso", action: "index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
