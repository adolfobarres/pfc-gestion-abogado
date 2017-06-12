<html>
<head>
	<meta name="layout" content="login"/>
	<title><g:message code='springSecurity.login.title'/></title>
	<style type="text/css" media="screen">
</head>
<body>
<g:if test="${flash.message}">
<div class="alert alert-info" role="status">${flash.message}</div>
															  </g:if>

<div class="container">
	<div class="card card-container">

<g:img dir="images" file="logo.png" class="profile-img-card" id="profile-img"/>
		<p id="profile-name" class="profile-name-card"></p>
                                                         <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm"  autocomplete="off">
			<span id="reauth-email" class="reauth-email"></span>
<div style="margin-bottom:10px;">
			<input type="text"  name="${usernameParameter ?: 'username'}" id="username" class="form-control" placeholder="user"/>
</div>
			<input type="password"  name="${passwordParameter ?: 'password'}" id="password" class="form-control" placeholder="contraseña"/>
<hr>
 <g:if test="${params.login_error}">
	<div class="alert alert-danger">
<i class="fa fa-frown-o" aria-hidden="true"></i> Error de autenticacion, introduzca un usuario y contraseña válidos.
    </div>
</g:if>
			<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit"><g:message code="user.entrar"/></button>
		</form><!-- /form -->
		<div style="margin-top:10px;text-align:right;">
		<g:link controller="user" action="rememberPassword"><g:message code="olvide.password"/></g:link>
		</div>
	</div><!-- /card-container -->
</div><!-- /container -



<script>
(function() {
	document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
})();
</script>
</body>
</html>
