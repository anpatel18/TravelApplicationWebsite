<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Information</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>

Edit Flight Information:<br>
<form action = "editFlight.jsp">
	<br>Flight ID:<input type=text placeholder = "Flight ID" name = "flight_id"><br><br>
	<br>Flight Type:<input type=text placeholder = "Flight Type" name = "flight_type"><br><br>
	<br>Departing Time:<input type=text placeholder = "yyyy-mm-dd hh:mm:ss" name = "d_time"><br><br>
	<br>Arrival Time:<input type=text placeholder = "yyyy-mm-dd hh:mm:ss" name = "a_time"><br><br>
	<br>First Class Fare:<input type=text  name = "first_fare"><br><br>
	<br>Economy Fare:<input type=text name = "economy_fare"><br><br>
	<br>Capacity:<input type=text name = "capacity"><br><br>
	<br>Destination:<input type=text  name = "dest"><br><br>
	<br>Departing:<input type=text  name = "dep"><br><br>
	<input type=submit value="Edit Flight">
</form> <br>



Edit Aircraft Information:<br>
<form action = "editAircraft.jsp">
	<br>Old Aircraft ID:<input type="text" placeholder="Aircraft ID" name="oldAC_id">
	<br>Old Airline ID:<input type="text" placeholder="2 Letter ID" name="oldAL_id">
	<br>New Aircraft ID:<input type="text" placeholder="Aircraft ID" name="aircraft_id">
	<br>New Airline ID:<input type="text" placeholder="2 Letter ID" name="airline_id">
	<input type=submit value="Edit Aircraft">
</form><br>
Edit Airport Information:<br>
<form action = "editAirport.jsp">
	<br>Old Airport ID:<input type="text" placeholder="3 Letter ID" name="oldAP_id">
	<br>Airport ID:<input type="text" placeholder="3 Letter ID" name="airport_id">
	<input type=submit value="Edit Airport">
</form>
<form action="customerRepHome.jsp">
		<input type="submit" value="Home Page">
</form>
<form action="logout.jsp">	
	<input type="submit" value="Logout">		
</form>
</body>
</html>