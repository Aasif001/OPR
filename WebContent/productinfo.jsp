<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="nav.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("pid");
		Connection conn;
		Statement stmt;
		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
		stmt = (Statement) conn.createStatement();
		String query = "select * from product where pid='" + id + "' ";
		ResultSet rs = stmt.executeQuery(query);
		while (rs.next()) {
	%>
	<div class="panel panel-body " style="margin-bottom: 30%">
		<div class="containetr fluid center-block">
			<div class="row">
				<div class="col-md-1 col-sm-1 col-lg-1 text-center"></div>


				<div class="col-md-2 col-sm-2 col-lg-2 text-center">
					<div class="card" style="width: 20rem;">
						<img class="card-img-top img-responsive img-thumbnail"
							src="<%out.println(rs.getString("purl"));%>" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title">
								<%
									out.println("Rs." + rs.getString("price")+" /week");
								%>
							</h4>
							<a
								href="productinfo.jsp?pid=<%out.println("http://paypal.com");%>"
								style="margin-bottom: 10px;" class="btn btn-primary">Take On
								Rent</a>
						</div>
					</div>
				</div>



				<div class="col-md-6 col-sm-6 col-lg-6 text-justify">
					<% out.println(rs.getString("pdesc")); %>
                   <br> <br> <br>
					<ul>
						<li>HD TV</li>
						<li>1 * USB</li>
						<li>1080p FHD</li>
						<li>Good sound Quality</li>
						
					</ul>
				</div>
			</div>


			<div class="col-md-2 col-sm-2 col-lg-2 text-center"></div>
		</div>
	</div>

	<%
		}
	%>
	<%@ include file="footer.html"%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>