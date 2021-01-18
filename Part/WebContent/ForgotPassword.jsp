<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<link rel="stylesheet" type="text/css" href="fpass.css">
</head>
<body class="forg">
<div class="Forpass">
	<h3 class="head">Change Your Password</h3><br>
		<form method="post" action="forgotPassServlet">
			<p>Email :</p><br>	
			<input type="text" name="email" placeholder="Email" required><br>
			
			<p>New Password :</p><br>
			<input type="password" name="npassword" placeholder="New Password" required><br>
			
			<p>Confirm Password :</p><br>
			<input type="password" name="cpassword" placeholder="Confirm Password" required><br>
			
			<p style="color:red"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error")%></p><br>
			
			<input type="submit" value="Confirm">
			
			<br>
		</form>
	</div>
	
</body>
</html>