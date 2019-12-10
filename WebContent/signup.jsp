<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up Here!</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>


	<br/> Customer Sign Up <br/>
	<form action="enterCustomerLoginDetails.jsp" method="POST">
    	Username: <input type="text" name="username"/> <br/>
    	Password:<input type="password" name="password"/> <br/>
    	Name:<input type="text" name="name"/> <br/>
    	
       	<input type="submit" value="Submit"/>
	</form>


	<br/> Customer Representative Sign Up <br/>
	<form action="enterCustomerRepLoginDetails.jsp" method="POST">
    	Username: <input type="text" name="username"/> <br/>
    	Password:<input type="password" name="password"/> <br/>
    	Name:<input type="text" name="name"/> <br/>
       	<input type="submit" value="Submit"/>
	</form>
<form action="login.jsp">
		
	<input type="submit" value="Login">
			
</form>
</body>
</html>