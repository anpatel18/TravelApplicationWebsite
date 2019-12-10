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
	<form action="flightSearchResult.jsp" method="POST">
	
		//add fields 
		
    	<input type="submit" value="Select"/> 
    	
    	
    	</form>
        

    	
    	
	<br />View Past Reservations<br />
	<form action="viewPastReservations.jsp" method="POST">
		Account Number: <input type="text" name="account_number"/> <br/>
    	<input type="submit" value="Search"/> 
    	
    	</form>
    	
    	<br />View Upcoming Reservations<br />
	<form action="viewUpcomingReservations.jsp" method="POST">
		Account Number: <input type="text" name="account_number"/> <br/>
    	<input type="submit" value="Search"/> 
    	
    	</form>
    	
    	


</body>
</html>