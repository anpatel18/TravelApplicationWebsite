<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Information</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>
Insert Customer Information:
<form action = "addCustomer.jsp">
	<br><input type=text placeholder = "Customer's username" name = "c_user"><br><br>
	<br><input type=text placeholder = "Customer's password" name = "c_pass"><br><br>
	<br><input type=text placeholder = "Customer's Full Name" name = "c_fullname"><br><br>
	<input type=submit value="Add Customer">
</form> <br>
Insert Customer Representative Information:
<form action = "addCustomerRep.jsp">
	<br><input type=text placeholder = "Customer Rep's username" name = "cr_user"><br><br>
	<br><input type=text placeholder = "Customer Rep's password" name = "cr_pass"><br><br>
	<br><input type=text placeholder = "Customer Rep's Full Name" name = "cr_fullname"><br><br>
	<input type=submit value="Add CustomerRep">
</form>
<form action="adminHome.jsp">
	<input type="submit" value="Home Page">
</form>
<form action="logout.jsp">	
	<input type="submit" value="Logout">		
</form>

</body>
</html>