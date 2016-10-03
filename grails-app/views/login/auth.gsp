<html>
<head>
	<meta name="layout" content="login"/>
	<title><g:message code='springSecurity.login.title'/></title>
	<style type="text/css" media="screen">
</head>
<body>


<div class="container">
	<div class="card card-container">
		<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
		<img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
		<p id="profile-name" class="profile-name-card"></p>
														 <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm"  autocomplete="off">
			<span id="reauth-email" class="reauth-email"></span>
			<input type="text"  name="${usernameParameter ?: 'username'}" id="username" class="form-control"/>
			<input type="password"  name="${passwordParameter ?: 'password'}" id="password" class="form-control"/>
			<div id="remember" class="checkbox">
				<label>
					<input type="checkbox" value="remember-me"> Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
		</form><!-- /form -->
		<a href="#" class="forgot-password">
			Forgot the password?
		</a>
	</div><!-- /card-container -->
</div><!-- /container -



<script>
(function() {
	document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
})();
</script>
</body>
</html>
