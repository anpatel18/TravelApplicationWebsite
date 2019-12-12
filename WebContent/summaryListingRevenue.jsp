<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>

<br />Revenue From Flight<br />
	<form action="revenueFromFlight.jsp" method="POST">
		Flight ID: <input type="text" name="flightID"/> <br/>
    	<input type="submit" value="Select"/> 
    </form>
    
    <br />Revenue From Airline<br />
	<form action="revenueFromAirline.jsp" method="POST">
		Airline: <input type="text" name="airlineName"/> <br/>
    	<input type="submit" value="Select"/> 
    </form>
    
    <br />Revenue From Customer<br />
	<form action="revenueFromCustomer.jsp" method="POST">
		Customer ID: <input type="text" name="customerID"/> <br/>
    	<input type="submit" value="Select"/> 
    </form>
    	
    	<form action="adminHome.jsp">
		
		<input type="submit" value="Home">
			
	</form>
</body>
</html>