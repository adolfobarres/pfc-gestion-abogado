<html>
<head>
	<meta name="layout" content="login"/>
	<title><g:message code='springSecurity.login.title'/></title>
	<style type="text/css" media="screen">
</head>
<body>


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
			<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit"><g:message code="user.entrar"/></button>
		</form><!-- /form -->

	</div><!-- /card-container -->
</div><!-- /container -



<script>
(function() {
	document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
})();
</script>
</body>
</html>
