<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
   String action=request.getParameter("email").toString();
	Connection conn;
	Statement stmt;
	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
	stmt = (Statement) conn.createStatement();
	int status= stmt.executeUpdate("DELETE FROM registration WHERE email='"+action+"'");
	
	if(status>0)
	{
		response.sendRedirect("/OPR_SYSTEM/admin/listuser.jsp");
	}
	else
	{
		out.print("could not delete user");
	} 
%>
<body>

</body>
</html>