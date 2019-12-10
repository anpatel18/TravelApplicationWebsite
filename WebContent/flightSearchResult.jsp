<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Search</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
//makes sure that the person is logged into an account. If not then will redirect to login page
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
if ((session.getAttribute("user") == null)) {
	response.sendRedirect("login.jsp");
}
%>
<%
	String airport_dep = request.getParameter("airport_dep");
	String airport_dest = request.getParameter("airport_dest");
	String fdate = request.getParameter("fdate");
	String flightType = request.getParameter("flightType");
	//need to include flexibility here
	double low_price = Double.parseDouble(request.getParameter("priceMin"));
	double high_price = Double.parseDouble(request.getParameter("priceMax"));
	int numOfStops = Integer.parseInt(request.getParameter("numOfStops"));
	String airlineID = request.getParameter("airlineID");
	int roundtrip = 0;
	if(flightType.equals("One-way")){
		roundtrip = 0;
	} else {
		roundtrip = 1;
	}
	//need to add sort options here
	String parameter = request.getParameter("parameter");
	String sort_type = request.getParameter("order");
	
	
	//connect to database then look for username password match
    String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
    Class.forName("com.mysql.jdbc.Driver");
    
    //initialize 
    Connection con = null;
    CallableStatement cs = null;
    ResultSet rs = null;
    %>
    <h1>Search Results</h1>
    <table border="1">
    <tr>
    <td>Flight ID</td>
    <td>Flight Type</td>
    <td>Departure Time</td>
    <td>Arrival Time</td>
    <td>Fare First Class</td>
    <td>Fare Economy Class</td>
    <td>Departing Airport</td>
    <td>Destination Airport</td>
    <td>Airline ID</td>
    </tr>
    <%
    try{
    	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
    	cs = con.prepareCall("CALL TravelApplication.searchflight('"+ airport_dep +"','"+ airport_dest + "','" +
				  fdate +"',"+ low_price + ","+ high_price +","+ numOfStops +",'"+ airlineID +"',"+ 
    			  roundtrip +","+ 0 + ",'"+ parameter +"','" + sort_type +"')");
    	rs = cs.executeQuery();
    	ResultSetMetaData metadata = rs.getMetaData();
    	int columnCount = metadata.getColumnCount();
    	while(rs.next()){
    		%>
    		<tr>
    		<td><%=rs.getString("flight_id") %></td>
    		<td><%=rs.getString("flight_type") %></td>
    		<td><%=rs.getString("depart_time") %></td>
    		<td><%=rs.getString("arive_time") %></td>
    		<td><%=rs.getString("fare_first") %></td>
    		<td><%=rs.getString("fare_economy") %></td>
    		<td><%=rs.getString("airports_departing_airport_id") %></td>
    		<td><%=rs.getString("airports_destination_airport_id") %></td>
    		<td><%=rs.getString("airline_id") %></td>
    		<%-- <td><a href="update.jsp?id=<%=rs.getString("flight_id")%>">update</a></td> --%>
    		</tr>
    		<%
    	}
    }catch(Exception e){
    	out.println("error in flightSearchResult");
    }finally{
        //close resultsets
        try { if (rs != null) rs.close(); } catch (Exception e) {};
    	//close statement
    	try { if (cs != null) cs.close(); } catch(Exception e) {};
    	//close connection to database
    	try { if (con != null) con.close(); } catch(Exception e) {};
        }
			%>

</table>
	<br>
	<form action="reserveFlight.jsp">
		<input type="submit" value = "Reserve a Flight!">
	</form>
	<br>
	<form action="flightSearch.jsp">
		<input type="submit" value = "Search for Flight!">
	</form>
	<br>
	<form action="logout.jsp">	
		<input type="submit" value="Logout">		
	</form>
</body>
</html>