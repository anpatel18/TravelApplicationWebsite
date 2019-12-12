<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="makeReservationRep.jsp" method="POST">
		Make Flight Reservation 
    	<input type="submit" value="Select"/> 
    	
    	</form>
    	
	<br />Edit Reservations<br />
	
	<form action="editReservationsRep.jsp" method="POST">
	
		Ticket ID: <input type="text" name="ticketID"/> <br/>
		
		<b>Change Flight Type:</b> <br>
			<input type="radio" name="flightType" value="OneWay"> One-way<br>
			<input type="radio" name="flightType" value="Round trip"> Round trip<br>
			
		<b>Change Seat Type:</b> <br>
			<input type="radio" name="seatType" value="Economy"> Economy<br>
			<input type="radio" name="seatType" value="First"> First/Business<br>
			
		Number of Tickets: <input type="text" name="numTickets"/> <br/>
			
    	<input type="submit" value="Select"/>	
    	</form>
    	<br/>
        
     <form action=AddEditDeleteReservationRep.jsp method="POST">
		Add, Edit, Delete Information <br/>
    	<input type="submit" value="Select"/> 
    	
    	</form>
    	<br/>
    	
    	<form action=listReservationsRep.jsp method="POST">
		View Waiting List
		<br/>
		Flight ID: <input type="text" name="flightID"/> <br/>
    	<input type="submit" value="Edit"/> 
    	
    	</form>
    	
    	<br/>
	
	
    
    	<form action="logout.jsp">	
		<input type="submit" value="Logout">		
	</form>
    	


</body>
</html>