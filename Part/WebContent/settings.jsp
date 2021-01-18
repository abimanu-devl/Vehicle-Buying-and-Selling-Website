<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.user"%>
<%@page import="services.IUserService"%>
<%@page import="services.IUser"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<link rel="stylesheet" type="text/css" href="settings.css">
<script>
function myFunction() {
  alert("Successfullly Updated !!!");
}
function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	}

	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	  document.getElementById("main").style.marginLeft= "0";
	}
</script>
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
</head>
<body class="set">
<%		
		String email=(String)session.getAttribute("email");
		IUser s1=new IUserService();
		user u1=s1.getUserByEmail(email);
		
%>
<jsp:include page="WEB-INF/views/header.jsp"></jsp:include>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <img id="side-img"height="50px" src="images/user.png">
  <h1 id="side-head"><%=u1.getFname()+" "+u1.getLname()%></h1>
  <a href="settings.jsp">Settings</a>
  <a href="Payment.jsp">Payments</a>
  <a href="logoff.jsp">Log off</a>
</div>
<form method="POST" action="updateUserServlet" onsubmit="myFunction()">
<table class="settings">

			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname" 
					value="<%=u1.getFname()%>" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname"
					value="<%=u1.getLname()%>" /></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><input type="text" name="gender"
					value="<%=u1.getGender()%>" /></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="phone"
					value="<%=u1.getPhone()%>" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="pass"
					value="<%=u1.getPassword()%>" /></td>
			</tr>
			
			<tr>
				<td colspan="2">
					
				<input type="hidden" name="email"
					value="<%=u1.getEmail()%>" /> <input type="submit"
					value="Update my profile"/></td>
			</tr>
		</table>
		</form>
		<form method="POST" action="deleteUserServlet">
		<table class="delete">
		<tr>
			<td colspan="2">
				
					<input type="hidden" name="uid"
						value="<%=u1.getId()%>" /> <input type="submit"
						value="Remove my profile"/>
				
			</td>
		</tr>
	</table>
	</form>
	<div class="sidebar11">
  	<input id ="btnh2" onclick="openNav()"type="submit"name="signUp"value="My profile">
  	</div>
<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>