<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="home.css">
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body class="home">

<div id="main">
<jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

<div id="m">
<h1 id="head1"> WELCOME TO METRO</h1>
<h1 id="head2">AUTOCARE CENTER</h1>
</div>

<div class="btn">

<form action="register.jsp"id="btn-form">
<input id ="btnh1" type="submit"name="signUp"value="Sign Up">
</form>
<form action="Login.jsp" id="btn-form">
<input id ="btnh2" type="submit"name="signUp"value="Sign In">
</form>

</div>

<br><br>
<div class="our">
<h2 id="value">WHY CHOOSE US</h2>
<div class=images>
<img id="i1"src="images/s1.png">
<img id="i2"src="images/s2.png">
<img id="i3"src="images/s5.png">
</div>

<div class="title">
<ul class="a">
<li><h4 id="t1">BEST MATIERIALS</h4></li>
<li><h4 id="t2">WELL TRAINED STAFF</h4></li>
<li><h4 id="t2">GOOD CUSTOMER SERVICE</h4></li>
</ul>
<input id ="btnh3" type="button"name="Read"value="Read More">
</div>
</div>
</div>
<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>