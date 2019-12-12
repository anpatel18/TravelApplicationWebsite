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
/* The code below makes sure that only someoone who is logged in can access this webpage.
Please use it for evety page that needs login access.
*/
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>
<% 
	String ticketID = request.getParameter("ticketID");   
    
    
    //connect to database then look for username password match
    String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    Statement st = null;
    Statement innerst = null;
    ResultSet rset = null;
		try{
    	
    	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
    	st = con.createStatement();
    	String sql ="CALL cancelReservation( " + ticketID + ");";
    	rset = st.executeQuery(sql);
    	
    	con.close();
    	}catch(Exception e){
    	out.println("error in checkLoginDetails");
    	e.printStackTrace();
    	}
     finally{
    //close resultsets
    try { if (rset != null) rset.close(); } catch (Exception e) {};
	//close statements
	try { if (innerst != null) innerst.close(); } catch(Exception e) {};
	try { if (st != null) st.close(); } catch(Exception e) {};
	//close connection to database
	try { if (con != null) con.close(); } catch(Exception e) {};
    }
	
%>
	<form action="success.jsp">
		
		<input type="submit" value="Login">
			
	</form>
	<form action="customerHome.jsp">
		
		<input type="submit" value="Home">
			
	</form>
</body>
</html>