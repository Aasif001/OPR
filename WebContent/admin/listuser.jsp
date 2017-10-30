<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/db.jsp" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Custom CSS and JS -->
<link href="/bootstrap/css/logincs.css" rel="stylesheet">
<script src="/bootstrap/js/loginjs.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Total User</title>
<style type="text/css">
th{text-align: center;}
</style>
</head>
<%@ include file="adminnav.jsp"%>
<body>
	<%
	    
          if(session.getAttribute("utype")!="ADMIN")
          {
        	  response.sendRedirect("adminlogin.jsp");
          }
         rs = stmt.executeQuery("select * from registration");
	%>
	<div class="container-fluide center-block">
		<div class="row center-block">
			<div class="col-md-2 col-sm-2 col-ld-2 "></div>
			<div class="col-md-8 col-sm-8 col-ld-8">
				<table class="table text-center table-hover">
					<thead>
						<tr>
							<th>Firstname</th>
							<th>Lastname</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Password</th>
							<th>Gender</th>
							<th>Country</th>
							<th colspan="3">Action</th>
						</tr>
					</thead>
					<tbody>

						<%
							while (rs.next()) {
								if(rs.getString("utype").equalsIgnoreCase("ADMIN"))
								{
									continue;
								}
						%>
						<tr class="active">
							<td><%=rs.getString("fname")%></td>
							<td><%=rs.getString("lname")%></td>
							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("mobile")%></td>
							<td><%=rs.getString("pass")%></td>
							<td><%=rs.getString("gender")%></td>
							<td><%=rs.getString("country")%></td>
							<td><input type="radio" name="deluser"></td>
							<td><a class="btn btn-danger" href="deluser.jsp?<%=rs.getString("email")%>">Delete</a></td>
							<td><a class="btn btn-info" href="updateuser.jsp?email=<%=rs.getString("email")%>">Update</a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<div class="col-md-2 col-sm-2 col-ld-2 "></div>
		</div>
	</div>

</body>
</html>