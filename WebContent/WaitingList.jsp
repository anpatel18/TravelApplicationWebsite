<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Search</title>
</head>
<body>
<%@page import ="java.sql.*,javax.servlet.*" %>
<%
/* The code below makes sure that only someoone who is logged in can access this webpage.
Please use it for evety page that needs login access.
*/
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>
	<form action="EnterWaitingList.jsp"> 
		<b>Flight ID:</b> <input type = "text" name = "flightID"> <br> <br>
		<b>Account Number:</b> <input type = "text"  name = "accountNum"> <br> <br>
		<b>Flight Type:</b> <br>
			<input type="radio" name="flightType" value="OneWay"> One-way<br>
			<input type="radio" name="flightType" value="Round trip"> Round trip<br>
			
		<b>Flight Seat:</b> <br>
			<input type="radio" name="flightSeat" value="Economy"> Economy<br>
			<input type="radio" name="flightSeat" value="First Class"> First Class<br>
	<input type="submit" value="Enter">
	</form> <br>
	<form action="customerHome.jsp">
		
		<input type="submit" value="Home">
			
	</form>
</body>
</html>