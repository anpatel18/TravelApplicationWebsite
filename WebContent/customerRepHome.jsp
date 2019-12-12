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
    	<input type="submit" value="Select"/>	
    	</form>
    	<br/>
        
     <form action=AddEditDeleteReservationRep.jsp method="POST">
		Add, Edit, Delete Information <br/>
    	<input type="submit" value="Select"/> 
    	
    	</form>
    	<br/>
    Add Flight, Aircraft or Aircraft Information
    <form action="addFAAInfo.jsp" method="post">
    	<input type="submit" value="Add">
    </form><br>
    Delete Flight, Aircraft or Aircraft Information
    <form action="deleteFAAInfo.jsp" method="post">
    	<input type="submit" value="Delete">
    </form><br>
    Edit Flight, Aircraft or Aircraft Information
    <form action="editFAAInfo.jsp" method="post">
    	<input type="submit" value="Edit">
    </form><br>
    	<form action=listReservationsRep.jsp method="POST">
		View Waiting List
		<br/>
		Flight ID: <input type="text" name="flightID"/> <br/>
    	<input type="submit" value="Select"/> 
    	
    	</form>
    	
    	<br/>
	
	
    
    	<form action="logout.jsp">	
		<input type="submit" value="Logout">		
	</form>
    	


</body>
</html>