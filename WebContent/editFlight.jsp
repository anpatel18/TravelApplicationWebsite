<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Flight</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>
<%
int flight_id = Integer.parseInt(request.getParameter("flight_id"));
String flight_type = request.getParameter("flight_type");
String dtime = request.getParameter("d_time");
String atime = request.getParameter("a_time");
String faref = request.getParameter("first_fare");
String faree = request.getParameter("economy_fare");
String capacity = request.getParameter("capacity");
String dest = request.getParameter("dest");
String dep = request.getParameter("dep");
%>
<%
//connect to database then look for username password match
String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
Class.forName("com.mysql.jdbc.Driver");

//initialize 
Connection con = null;
CallableStatement cs = null;
ResultSet rs = null;
%>
    <h1>Flight Editted</h1>
    <table border="1">
    <tr>
    <td>Flight ID</td>
    <td>Flight Type</td>
    <td>Departure Time</td>
    <td>Arrival Time</td>
    <td>Fare First Class</td>
    <td>Fare Economy Class</td>
    <td>Airline Capacity</td>
    </tr>
<%
try{
	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
	cs = con.prepareCall("CALL TravelApplication.editFlight("+ flight_id+",'"+flight_type+"','"+dtime+"','"+atime+"',"+faref+","+ faree +","+capacity+",'"+dest+"','"+dep+"')");
	rs = cs.executeQuery();
	ResultSetMetaData metadata = rs.getMetaData();
	int columnCount = metadata.getColumnCount();
	while(rs.next()){
%>
			<tr>
    		<td><%=rs.getString("flight_id") %></td>
    		<td><%=rs.getString("flight_type") %></td>
    		<td><%=rs.getString("depart_time") %></td>
    		<td><%=rs.getString("arrive_time") %></td>
    		<td><%=rs.getString("fare_first") %></td>
    		<td><%=rs.getString("fare_economy") %></td>
    		<td><%=rs.getString("capacity") %></td>
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
<form action="customerRepHome.jsp">
		<input type="submit" value="Home Page">
</form>
<form action="logout.jsp">	
	<input type="submit" value="Logout">		
</form>
</body>
</html>