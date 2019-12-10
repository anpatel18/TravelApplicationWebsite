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
    String userMonth = request.getParameter("month");  


    
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
    <h1>Sales Report</h1>
    <table border="1">
    <tr>
    <td>ticket_id</td>
    <td>round_trip</td>
    <td>booking_fee</td>
    <td>issue_date</td>
    <td>total_fare</td>
    
    </tr>
    <%
    
    
    try{
    	
    	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
    	st = con.createStatement();
    	String sql ="CALL salesForMonth(" + userMonth + ");";
    	rs = st.executeQuery(sql);
    	while(rs.next()){
    		%>
    		<tr>
    		<td><%=rs.getString("ticket_id") %></td>
    		<td><%=rs.getString("round_trip") %></td>
    		<td><%=rs.getString("booking_fee") %></td>
    		<td><%=rs.getString("issue_date") %></td>
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
</body>
</html>