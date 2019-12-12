<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edited Customer Rep Information</title>
</head>
<body>
<%@ page import ="java.sql.*,javax.servlet.*" %>
<%
response.setHeader("Cache-Control", "no-chache, no-store, must-revalidate");
    if ((session.getAttribute("user") == null)) {
    	response.sendRedirect("login.jsp");
    }
%>
<!--Get all parameters from adminEditInfo page-->
<%
String olduser = request.getParameter("cr_old");
String username = request.getParameter("cr_user");
String password = request.getParameter("cr_pass");
String fullname = request.getParameter("cr_fullname");
%>

<!--Send parameters through a query to add to customer table-->
<%
//connect to database then look for username password match
String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
Class.forName("com.mysql.jdbc.Driver");

//initialize 
Connection con = null;
CallableStatement cs = null;
ResultSet rs = null;
%>
    <h1>Edited Customer Rep Information</h1>
    <table border="1">
    <tr>
    <td>Customer User Name</td>
    <td>Customer Password</td>
    <td>Customer Full Name</td>
    </tr>
<%
try{
	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
	cs = con.prepareCall("CALL TravelApplication.editCustomerRepInfo('"+olduser+"','"+username+"','"+password+"','"+fullname+"')");
	rs = cs.executeQuery();
	ResultSetMetaData metadata = rs.getMetaData();
	int columnCount = metadata.getColumnCount();
	while(rs.next()){
%>
		<tr>
		<td><%=rs.getString("customer_rep_user_name") %></td>
		<td><%=rs.getString("customer_rep_password") %></td>
		<td><%=rs.getString("person_name") %></td>
		</tr>
<%
	}
}catch(Exception e){
	out.println("error in editCustomerRepInfo");
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
<form action="adminHome.jsp">
		<input type="submit" value="Home Page">
</form>
<form action="logout.jsp">	
	<input type="submit" value="Logout">		
</form>
</body>
</html>