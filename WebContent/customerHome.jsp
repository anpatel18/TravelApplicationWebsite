<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<br />Your Info<br />
	<form action="customerInfo.jsp" method="POST">
		Username: <input type="text" name="userName"/> <br/>
    	<input type="submit" value="Select"/> 
    	
    	</form>
	<br />Search Flights<br />
	<form action="flightSearch.jsp" method="POST">
	
		
		
    	<input type="submit" value="Select"/> 
    	
    	
    	</form>
    	<br/>
        
     <form action=reserveFlight.jsp method="POST">
		Make Reservation: 
    	<input type="submit" value="Select"/> 
    	
    	</form>
    	<br/>
    	
    	<form action=cancelFlight.jsp method="POST">
		Cancel Reservation: (FLIGHT MUST BE FIRST/BUSINESS CLASS)<br/>
		<br/>
		Ticket ID: <input type="text" name="ticketID"/> <br/>
    	<input type="submit" value="Select"/> 
    	
    	</form>
    	
    	<br/>
	<br />View Past Reservations<br />
	<form action="viewPastReservations.jsp" method="POST">
		Account Number: <input type="text" name="account_number"/> <br/>
    	<input type="submit" value="Search"/> 
    	
    	</form>
    	<br/>
    	<br />View Upcoming Reservations<br />
	<form action="viewUpcomingReservations.jsp" method="POST">
		Account Number: <input type="text" name="account_number"/> <br/>
    	<input type="submit" value="Search"/> 
    		
	</form>
    
    	<form action="logout.jsp">	
		<input type="submit" value="Logout">		
	</form>
    	


</body>
</html>