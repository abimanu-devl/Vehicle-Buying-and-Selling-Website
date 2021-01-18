<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<script type="text/javascript">
function myFunction() {
	  var x = document.getElementById("myInput");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}

</script>
<link rel="stylesheet" type="text/css" href="log.css">
</head>
<body class="lgbody">
<jsp:include page="WEB-INF/views/header.jsp"></jsp:include>
<div class="login">
	<h3 class="head">Login</h3>
		<form method="post" action="loginServlet">
			<p>Email :</p><br>	
			<input type="text" name="email" placeholder="Email" required><br><br>
			
			<p>Password :</p><br>
			<input type="password" name="password" placeholder="Password" required id="myInput"><br>
			
			<input type="checkbox" onclick="myFunction()">Show Password<br><br>
			
			<input type="submit" value="Sign In">
			
			<p style="color:red"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error")%></p>
			<a href="ForgotPassword.jsp" target="_blank">Forgot password</a><br><br>
		
		    <a href="Register.jsp" target="_blank">Create an account</a>
			<br>
		</form>
	</div>
<br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br>
<br><br><br><br><br>
<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>