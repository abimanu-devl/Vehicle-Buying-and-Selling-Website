<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.user"%>
<%@page import="services.IUserService"%>
<%@page import="services.IUser"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Details</title>
<link rel="stylesheet" type="text/css" href="payment.css">
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
<body class="pay">
<%		
		String email=(String)session.getAttribute("email");
		IUser s1=new IUserService();
		user u1=s1.getUserByEmail(email);
		
%>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <img id="side-img"height="50px" src="images/user.png">
  <h1 id="side-head"><%=u1.getFname()+" "+u1.getLname()%></h1>
  <a href="settings.jsp">Settings</a>
  <a href="Payment.jsp">Payments</a>
  <a href="logoff.jsp">Log off</a>
</div>
<jsp:include page="WEB-INF/views/header.jsp"></jsp:include>

<form method="post" action="paymentServlet">
<div class="payment">
			<h3 class="head">Checkout Information</h3><br>
			
			<p>Accepted Cards</p>
			<img src="images/visa.png" width="100px" height="50px">
			<img src="images/m.jpg" width="100px" height="50px">
			<img src="images/amarican.png" width="100px" height="50px">
			<br>
			<p>Total Price : 17000.00 LKR</p><br><!-- After Cart confirmation total price return to the payments -->
			<p>Credit/Debit Card No</p>
			<input type="text" name="cardno" maxlength="12" placeholder="Credit/Debit Card No" required>
			<p>Expire Date</p>
			<input type="text" name="exp" maxlength="5" placeholder="YY/MM" required>
			<p>CV Code</p>
			<input type="text" name="cvv" maxlength="4" placeholder="CVV" required ><br>
			
			<input type="submit" value="Confirm Payment" >
	</div>
	</form>	
	<div class="sidebar11">
  	<input id ="btnh2" onclick="openNav()"type="submit"name="signUp"value="My profile">
  	</div>
<jsp:include page="WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>