<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%
            Connection conn;
			Statement stmt;
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
			stmt = (Statement) conn.createStatement();
		%>	