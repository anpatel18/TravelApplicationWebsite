<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>
Welcome ${user}
	<form action="flightSearch.jsp">
		<input type="submit" value = "Search for Flight!">
	</form>
	<form action="logout.jsp">	
		<input type="submit" value="Logout">		
	</form>
</body>
</html>