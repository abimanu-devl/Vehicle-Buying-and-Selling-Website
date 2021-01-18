<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.payment"%>
<%@page import="model.user"%>
<%@page import="services.IUserService"%>
<%@page import="services.IUser"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Successful</title>
<style>
.sucss{
	
	background-image:url("images/Top.jpg");
	background-size:cover;
	background-repeat:no-repeat;
    background-attachment:fixed;
    background-position:center;
}
#head2{
	color:yellow;
	
}
#m{
	font-size:25px;
	font-family:Impact;
	text-align:center;
	
}
.btn{
	width:250px;
	margin-left:650px;
	border:none;
	outline:none;
	height:40px;
	background:#000000;
	font-size:21px;
	color:#ffffff;
	cursor:pointer;
	opacity: 0.8;
}
</style>
</head>
<body class="sucss">
<%		
		String email=(String)session.getAttribute("email");
		IUser s1=new IUserService();
		user u1=s1.getUserByEmail(email);
		
%>
<div id="m">
<h1 id="head1">Dear <%=u1.getFname()+" "+u1.getLname()%></h1>
<h1 id="head1">Your Payment is Successfully Received</h1>
<h1 id="head1"> METRO</h1>
<h1 id="head2">AUTOCARE CENTER</h1>
<img src="images/log2.png">
</div>
<a href="home1.jsp"><button class="btn">Continue</button></a>
</body>
</html>