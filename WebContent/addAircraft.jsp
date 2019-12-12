<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Aircraft</title>
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
int aircraft_id =Integer.parseInt(request.getParameter("aircraft_id"));
String airline_id = request.getParameter("airline_id");

//connect to database then look for username password match
String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
Class.forName("com.mysql.jdbc.Driver");

//initialize 
Connection con = null;
CallableStatement cs = null;
ResultSet rs = null;
%>
<h1>Aircraft Added</h1>
    <table border="1">
    <tr>
    <td>Aircraft ID</td>
    <td>Airline ID</td>
    </tr>
<%
try{
	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
	cs = con.prepareCall("CALL TravelApplication.addAircraft("+aircraft_id+",'"+airline_id+"')");
	rs = cs.executeQuery();
	while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString("aircraft_id") %></td>
		<td><%=rs.getString("airline_id") %></td>
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