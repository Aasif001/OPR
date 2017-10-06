<%@ include file="nav.jsp"%>
<%@ include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-md-1 col-sm-1 col-lg-1 text-justify"></div>

		<%
			String ptype = request.getParameter("ptype");
			stmt = (Statement) conn.createStatement();
			String query = "select * from product where ptype like '%" + ptype + "%'";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
		%>
		<div class="col-md-2 col-sm-2 col-lg-2 text-justify style="width:auto">
			<a href="productinfo.jsp?pid=<%=rs.getString("pid")%>"
				style="text-decoration: none;">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top img-responsive img-thumbnail"
						src="<%=rs.getString("purl")%>" alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title"
							style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: inline-block; max-width: 100%;"><%=rs.getString("pname")%></h4>
						<h4 style="color: #B12704;">
							&#8377;<%=rs.getString("price")%></h4>
					</div>
				</div>
			</a>
		</div>
		<%
			}
		%>
	</div>
	<!-- While loop ends here -->


	<!-- Footer started from here -->
	<%@ include file="footer.html"%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Footer ENDS here -->
</body>
</html>