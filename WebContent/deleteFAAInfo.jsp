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
Delete Flight Information:<br>
<form action = "deleteFlight.jsp">
	<br>Flight ID:<input type=text placeholder = "Flight ID" name = "flight_id">
	<input type=submit value="Delete Flight">
</form> <br>



Delete Aircraft Information:<br>
<form action = "deleteAircraft.jsp">
	<br>Aircraft ID:<input type="text" placeholder="Aircraft ID" name="aircraft_id">
	<input type=submit value="Delete Aircraft">
</form><br>
Delete Airport Information:<br>
<form action = "deleteAirport.jsp">
	<br>Airport ID:<input type="text" placeholder="3 Letter ID" name="airport_id">
	<input type=submit value="Delete Airport">
</form>
<form action="customerRepHome.jsp">
		<input type="submit" value="Home Page">
</form>
<form action="logout.jsp">	
	<input type="submit" value="Logout">		
</form>
</body>
</html>