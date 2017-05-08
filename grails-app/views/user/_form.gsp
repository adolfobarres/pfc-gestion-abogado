<div class="row">
    <div class="col-lg-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-globe" aria-hidden="true"></i> <g:message code="user.datos.label"/></h3>
            </div>
            <div class="panel-body" style="height: 258px;">
                <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="nombre"><g:message code="usuario.nombre"/> <span class="required-indicator">*</span></label>
                        <input type="text" class="form-control input-sm" id="nombre"  name="nombre" required="" value="${user?.nombre}"   >
                    </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="apellidos"><g:message code="usuario.apellidos"/> <span class="required-indicator">*</span></label>
                            <input type="text" class="form-control input-sm" id="apellidos"  name="apellidos" required="" value="${user?.apellidos}"   >
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="apellidos"><g:message code="usuario.email"/> <span class="required-indicator">*</span></label>
                            <input type="email" class="form-control input-sm" id="email"  name="email" required="" value="${user?.email}"   >
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-lock" aria-hidden="true"></i> <g:message code="usuario.contraseña.label"/></h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="username"><i class="fa fa-user"></i> <g:message code="user.username"/> <span class="required-indicator">*</span></label>
                            <input type="text" title="Introduce un nombre de usuario" class="form-control input-sm" id="username" pattern="\w+"  name="username" required="" value="${user?.username}"   >
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="password"><i class="fa fa-lock"></i> <g:message code="user.password"/> <span class="required-indicator">*</span></label>
                            <input  class="form-control input-sm" id="password" title="La contraseña debe contener al menos 6 carácteres(1 número y 1 letra minúscula y 1 mayúscula)" type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="password" onchange="
                                this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
                                if(this.checkValidity()) form.pwd2.pattern = this.value;
                            ">
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="pw2"><i class="fa fa-lock"></i> <g:message code="user.password.repetir"/> <span class="required-indicator">*</span></label>
                            <input  class="form-control input-sm" title="Las contraseñas no coinciden" type="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="pwd2" onchange="
                                this.setCustomValidity(this.validity.patternMismatch ? this.title : '');">
                        </div>
                    </div>
                </div>
                <hr>
                <label>Roles</label><br>
                <label class="checkbox-inline">
                    <input type="checkbox" name="roles" id="ROLE_ADMIN" value="ROLE_ADMIN"> <g:message code="usuario.role.administrador"/>
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" name="roles" id="ROLE_ABOGADO" value="ROLE_ABOGADO">  <g:message code="usuario.role.abogado"/>
                </label>
                <label class="checkbox-inline">
                    <input type="checkbox" name="roles" id="ROLE_ADMINISTRATIVO" value="ROLE_ADMINISTRATIVO">  <g:message code="usuario.role.administrativo"/>
                </label>

            </div>
        </div>
    </div>


</div>

