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
	String newUserId = request.getParameter("username");   
    String newPwd = request.getParameter("password");
    String newName = request.getParameter("name");
    
    //connect to database then look for username password match
    String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = null;
    Statement st = null;
    Statement innerst = null;
    ResultSet rset = null;
    
    
    try{
    	//Create a connection to database
    	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
    
    	//Create statement and resultset
    	st = con.createStatement();
    	innerst = con.createStatement();
    
    
    	//check to see if the username and password exist already
    	rset = st.executeQuery("select * from customer where customer_user_name='" + newUserId + "' AND customer_password='" + newPwd + "';");
    	if(rset.next()){
    		if(rset.getString("customer_user_name").equals(newUserId) && rset.getString("customer_password").equals(newPwd)){
    			out.println("This username and password already exists. Please select another one.");
    		} else if(rset.getString("username").equals(newUserId)){
    			out.println("This username already exists. Please select another one.");
    		} else if(rset.getString("userPassword").equals(newPwd)){
    			out.println("This password already exists. Please select another one.");
    		} 
    		
    	}
    	
    	 
    
    	//add the username and password to database
    	else 
    	{
    		out.println("check 1");
			int rows;
			
	    	rows = innerst.executeUpdate("INSERT INTO TravelApplication.customer_rep(customer_rep_user_name, customer_rep_password,person_name) " 
			+ "VALUES('" + newUserId + "','" + newPwd + "', '" + newName + "');");
	    	out.println("check 2");
	    		
	    	if(rows>0){
	  			
	    		response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
	    		out.println("Thank you for signing up!");
	    	} else{
	    		out.println("Something went wrong please try again :(");
	    	}
		}
    	
    }catch(Exception e){
    	out.println("error in enterLoginDetails");
    	e.printStackTrace();
    } finally{
    //close resultsets
    try { if (rset != null) rset.close(); } catch (Exception e) {};
	//close statements
	try { if (innerst != null) innerst.close(); } catch(Exception e) {};
	try { if (st != null) st.close(); } catch(Exception e) {};
	//close connection to database
	try { if (con != null) con.close(); } catch(Exception e) {};
    }
	
%>
	<form action="login.jsp">
		
		<input type="submit" value="Login">
			
	</form>
</body>
</html>