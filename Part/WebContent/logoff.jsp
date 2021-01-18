<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>log off</title>
</head>
<body>
<%session.removeAttribute("email");
RequestDispatcher dispathcer=getServletContext().getRequestDispatcher("/home1.jsp");
dispathcer.forward(request, response);

%>

</body>
</html>