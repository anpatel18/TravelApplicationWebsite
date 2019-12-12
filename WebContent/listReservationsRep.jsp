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
    


    
    //connect to database then look for username password match
    String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
    Class.forName("com.mysql.jdbc.Driver");
    String flightID = request.getParameter("flightID");  
    //initialize 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    %>
    <html>
    <body>
    <h1>Waiting List</h1>
    <table border="1">
    <tr>
    <td>Passenger Name</td>
    <td>Flight ID</td>
    <td>Waiting List ID</td>
    <td>Account Number</td>
   
    
    </tr>
    <%
    
    
    try{
    	
    	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
    	st = con.createStatement();
    	String sql ="CALL viewWaitingListByFlightID(" + flightID + ");" ;
    	rs = st.executeQuery(sql);
    	while(rs.next()){
    		%>
    		<tr>
    		<td><%=rs.getString("person_name") %></td>
    		<td><%=rs.getString("flight_id") %></td>
    		<td><%=rs.getString("waiting_list_id") %></td>
    		<td><%=rs.getString("account_num") %></td>
    		
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
<form action="customerRepHome.jsp">
		
		<input type="submit" value="Home">
			
	</form>
</body>
</html>