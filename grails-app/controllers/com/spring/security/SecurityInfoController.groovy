package com.spring.security
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class SecurityInfoController extends grails.plugin.springsecurity.ui.SecurityInfoController {
}
