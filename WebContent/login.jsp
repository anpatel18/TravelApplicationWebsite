<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
		
		<br />Admin Login <br />
	<form action="checkLoginDetails.jsp" method="POST">
		Username: <input type="text" name="username"/> <br/>
    	Password:<input type="password" name="password"/> <br/>
    	<input type="submit" value="Login as Admin"/> 
    	
    	</form>
    	
    	<br />Customer Login <br />
    	
		<form action="checkCustomerDetails.jsp" method="POST">
		Username: <input type="text" name="username"/> <br/>
    	Password:<input type="password" name="password"/> <br/>
    	<input type="submit" value="Login as Customer"/> 
    	
    	</form>
    	
    	<br />Customer Representative Login <br />
    	
		<form action="checkCustomerRepDetails.jsp" method="POST">
		Username: <input type="text" name="username"/> <br/>
    	Password:<input type="password" name="password"/> <br/>
    	<input type="submit" value="Login as Customer Representative"/> 
    	
    	</form>
    	


	<form action="signup.jsp">
		
		<input type="submit" value="Sign Up!">
			
	</form>
</body>
</html>