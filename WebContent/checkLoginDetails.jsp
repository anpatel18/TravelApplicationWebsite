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
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    
    //connect to database then look for username password match
    String url = "jdbc:mysql://db1.csi7nfhadku4.us-east-2.rds.amazonaws.com:3306/TravelApplication";
    Class.forName("com.mysql.jdbc.Driver");
    
    //initialize 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    try{
    	con = DriverManager.getConnection(url,"shaanparikh", "Abdabfece!1");
    	st = con.createStatement();
    	rs = st.executeQuery("select * from admin where admin_user_name='" + userid + "' and admin_password='" + pwd + "'");
    	if (rs.next()) {
    		session = request.getSession();
        	session.setAttribute("user", userid); // the username will be stored in the session
        	response.sendRedirect("adminHome.jsp");
    	} 
		else 
		{
			response.sendRedirect("login.jsp");
		}
    }catch(Exception e){
    	out.println("error in checkLoginDetails");
    }finally{
        //close resultsets
        try { if (rs != null) rs.close(); } catch (Exception e) {};
    	//close statement
    	try { if (st != null) st.close(); } catch(Exception e) {};
    	//close connection to database
    	try { if (con != null) con.close(); } catch(Exception e) {};
        }
    
%>
</body>
</html>