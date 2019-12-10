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
	<form action="flightSearchResult.jsp"> 
		<b>Departing Airport:</b> <input type = "text" placeholder = "3 Letter ID" name = "airport_dep"> <br> <br>
		<b>Destination Airport:</b> <input type="text" placeholder = "3 Letter ID" name = "airport_dest"> <br> <br>
		<b>Date of Flight:</b> <input type = "text" placeholder = "yyyy-mm-dd" name = "fdate"> <br> <br>
		<b>Flight Type:</b> <br>
			<input type="radio" name="flightType" value="One-way"> One-way<br>
			<input type="radio" name="flightType" value="Round trip"> Round trip<br>
		<b>Flexibility:</b> <br>
			Days: <input type="range" name="flightDays" min="0" max="20" value="0"><br>
			Hours: <input type="range" name="flightHours" min="0" max="23" value="0"><br>
		<br><b>Filter:</b> <br>
			Price minimum: <input type="text" name="priceMin"><br>
			Price maximum: <input type="text" name="priceMax"><br>
			Number of Stops: <input type="range" name="numOfStops" min="0" max="10" value="0"><br>
			Airline (2 letter ID): <input type="text" name="airlineID"><br>
		<br><b>Sort:</b> <br>
			Parameter: <br>
			<input type= "radio" name="parameter" value="fare_economy"> Price - First Class<br>
			<input type="radio" name="parameter" value="fare_first"> Price - Economy<br>
			<input type="radio" name="parameter" value="depart_time"> Take-off Time<br>
			<input type="radio" name="parameter" value="arive_time"> Landing Time<br>
			Order: <br>
			<input type="radio" name="order" value="ASC"> Ascending<br>
			<input type="radio" name="order" value="DESC"> Descending<br>
		<input type="submit" value="Search">
	</form> <br>
	<form action="logout.jsp">	
		<input type="submit" value="Logout">		
	</form>
</body>
</html>