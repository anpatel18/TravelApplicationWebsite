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
<br />Customer/Customer Rep Information: <br />
<br />Add Information <br />
	<form action="adminAddInfo.jsp" method="POST">
     	<input type="submit" value="Select"/> 	
    </form>
<br />Edit Information <br />
	<form action="adminEditInfo.jsp" method="POST">
		<input type="submit" value="Select"/> 
    </form>
<br />Delete Information <br />
	<form action="adminDeleteInfo.jsp" method="POST">
		<input type="submit" value="Select"/> 
    </form>
<br />Sales Information for Month <br />
	<form action="salesInfoForMonth.jsp" method="POST">
		Month: <input type="text" name="month"/> <br/>
    	<input type="submit" value="Select"/> 
    </form>
    	<br />Reservation List By Name<br />
	<form action="reservationListByName.jsp" method="POST">
	
    	<input type="submit" value="Search"/> 
    	
    	</form>
    	
    	<br />Reservation List By Flight Number<br />
	<form action="reservationListByNum.jsp" method="POST">
	
    	<input type="submit" value="Search"/> 
    	
    	</form>
    	
    	<br />Summary Listing of Revenue<br />
	<form action="summaryListingRevenue.jsp" method="POST">
	
    	<input type="submit" value="Search"/> 
    	
    	</form>
    	
    	<br />Customer : Most Revenue<br />
	<form action="customerMaxRevenue.jsp" method="POST">
	
    	<input type="submit" value="Search"/> 
    	
    	</form>
	<br />Most Active Flight <br />
	<form action="mostActiveFlight.jsp" method="POST">
		
    	<input type="submit" value="Search"/> 
    	
    	</form>
    	
    	<br />Flights from: <br />
	<form action="flightFrom.jsp" method="POST">
		Airport: <input type="text" name="airport"/> <br/>
    	<input type="submit" value="Search"/> 
    	
    </form>
	<form action="logout.jsp">	
		<input type="submit" value="Logout">		
	</form>


</body>
</html>