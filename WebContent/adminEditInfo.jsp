<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Information</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>
Insert Customer Information: (Will need account number!)
<form action = "editCustomerInfo.jsp" method="post">
	<br><input type=text placeholder ="Customer's Account #" name = "acc_num"><br><br>
	<br><input type=text placeholder = "Customer's username" name = "c_user"><br><br>
	<br><input type=text placeholder = "Customer's password" name = "c_pass"><br><br>
	<br><input type=text placeholder = "Customer's Full Name" name = "c_fullname"><br><br>
	<input type=submit value="Edit Customer Info">
</form> <br>
Find Account Number:
<form action="customerInfo2.jsp" method="POST">
	<input type="text" placeholder = "Customer's username" name="userName"/> <br/>
    <input type="submit" value="Find"/>	
</form>
Insert Customer Representative Information:
<form action = "editCustomerRepInfo.jsp" method="post">
	<br><input type=text placeholder = "Old username" name = "cr_old"><br><br>
	Insert Changes: (Do not have to change every field.)
	<br><input type=text placeholder = "New username" name = "cr_user"><br><br>
	<br><input type=text placeholder = "New password" name = "cr_pass"><br><br>
	<br><input type=text placeholder = "New Full Name" name = "cr_fullname"><br><br>
	<input type=submit value="Edit CustomerRep Info">
</form><br>
<form action="adminHome.jsp">
	<input type="submit" value="Home Page">
</form>
<form action="logout.jsp">	
	<input type="submit" value="Logout">		
</form>
</body>
</html>