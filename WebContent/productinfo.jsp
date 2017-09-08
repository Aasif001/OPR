<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
Connection conn;
Statement stmt;

DriverManager.registerDriver(new com.mysql.jdbc.Driver());
conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
stmt = (Statement)conn.createStatement();
String query = "select * from product";
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
     out.println(rs.getString("pid"));	
     out.println(rs.getString("price"));	
     out.println(rs.getString("qty"));	
}
%>

</body>
</html>