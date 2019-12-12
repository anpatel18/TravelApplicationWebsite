<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
    String flightID = request.getParameter("flightID");  


    
    //connect to database then look for username password match
    String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
    Class.forName("com.mysql.jdbc.Driver");
    
    //initialize 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    %>
    <html>
    <body>
    <h1>Revenue From Flight</h1>
    <table border="1">
    <tr>
    <td>Flight ID</td>
    <td>Ticket ID</td>
    <td>Revenue ($)</td>
    
    
    </tr>
    <%
    
    
    try{
    	
    	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
    	st = con.createStatement();
    	String sql ="CALL revenueFromFlight(" + flightID + ");";
    	rs = st.executeQuery(sql);
    	while(rs.next()){
    		%>
    		<tr>
    		<td><%=rs.getString("flight_id") %></td>
    		<td><%=rs.getString("ticket_id") %></td>
    		<td><%=rs.getString("total_fare") %></td>
    		
    		
    		</tr>
    		<%
    	
    	}
    	con.close();
    	}catch(Exception e){
    	out.println("error in checkLoginDetails");
    	e.printStackTrace();
    	
    }finally{
        //close resultsets
        try { if (rs != null) rs.close(); } catch (Exception e) {};
    	//close statement
    	try { if (st != null) st.close(); } catch(Exception e) {};
    	//close connection to database
    	try { if (con != null) con.close(); } catch(Exception e) {};
        }
    
%>
</table>
<form action="summaryListingRevenue.jsp">
		
		<input type="submit" value="Back">
			
	</form>
</body>
</html>