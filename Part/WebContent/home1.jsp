<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.user" %>
<%@page import="services.IUserService"%>
<%@page import="services.IUser"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="home.css">
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-image:url("images/sidenav.jpg");
  background-size:cover;
  background-repeat:no-repeat;
  background-position:center;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  font-family:Impact;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
  background-color:black;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
}
#side-head{
color:grey;
}
#side-img{
margin-left:90px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body class="home">
<%String mail=(String)session.getAttribute("email");
if(mail!=null){
IUser s1=new IUserService();
user u1=s1.getUserByEmail(mail);
String first=u1.getFname();
String last=u1.getLname();

%>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <img id="side-img"height="50px" src="images/user.png">
  <h1 id="side-head"><%=first+" "+last%></h1>
  <a href="settings.jsp">Settings</a>
  <a href="Payment.jsp">Payments</a>
  <a href="logoff.jsp">Log off</a>
</div>
<%} %>

<div id="main">
<jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

<div id="m">
<h1 id="head1"> WELCOME TO METRO</h1>
<h1 id="head2">AUTOCARE CENTER</h1>
</div>

<div class="btn">
<%if(mail==null){ %>
<form action="register.jsp"id="btn-form">
<input id ="btnh1" type="submit"name="signUp"value="Sign Up">
</form>
<form action="Login.jsp" id="btn-form">
<input id ="btnh2" type="submit"name="signUp"value="Sign In">
</form>
<%} %>
</div>

<%if(mail!=null){ %>
  <div class="sidebar11">
  <input id ="btnh2" onclick="openNav()"type="submit"name="signUp"value="My profile">
  </div>
  <%} %>
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
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}
</script>
</body>
</html>