<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="nav.jsp"%>
<%@ include file="db.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.footer {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  background-color: #efefef;
  text-align: center;
}
</style>

</head>
<body>

<%
 stmt=conn.createStatement();
 rs=stmt.executeQuery("SELECT * FROM registration WHERE email='"+session.getAttribute("email")+"' ");
 
 while(rs.next())
 {
%>

<h1 class="text-center text-primary"><i>Profile Page</i></h1>
   <div style="margin-bottom:50px;"></div>	
	<div class="container">
	   <form action="" >
		<div class="row">
			<div class="col=sm-12 col-md-6 col-ld-6">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-user"></i>
						</span> <input class="form-control" placeholder="First Name"
							name="fname" type="text" readonly value="<%=rs.getString("fname") %>" >
					 </div>
				</div>
				</div>
				
				<div class="col=sm-12 col-md-6 col-ld-6">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-user"></i>
						</span> <input class="form-control" placeholder="Last Name"
							name="lname" type="text"  readonly value="<%=rs.getString("lname") %>">
					 </div>
				</div>
				</div>
			</div>	
			
			
			
			<div class="row">
			<div class="col=sm-12 col-md-6 col-ld-6">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-envelope"></i>
						</span> <input class="form-control" placeholder="Email Address"
							name="em" type="text" readonly value="<%=rs.getString("email") %>" >
					 </div>
				</div>
				</div>
				
				<div class="col=sm-12 col-md-6 col-ld-6">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-earphone"></i>
						</span> <input class="form-control" placeholder="Contact No"
							name="mobile" type="text" value="<%=rs.getString("mobile") %>" >
					 </div>
				</div>
				</div>
			</div>	
			
			
			<div class="row">
			<div class="col=sm-12 col-md-6 col-ld-6">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-lock"></i>
						</span> <input class="form-control" placeholder="New Password"
							name="pass" type="password"  >
					 </div>
				</div>
				</div>
				
				<div class="col=sm-12 col-md-6 col-ld-6">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-lock"></i>
						</span> <input class="form-control" placeholder="Re-type Password"
							name="rpass" type="password" >
					 </div>
				</div>
				</div>
			</div>	
			
			
			<div class="row">
				<div class="col=sm-12 col-md-6 col-ld-6">	
				<div class="form-group">
					<input type="submit" class="btn btn-lg btn-primary btn-block"
						value="Update">
				 </div>
			   </div>
			   
			   <div class="col=sm-12 col-md-6 col-ld-6">	
				<div class="form-group">
					<input type="reset" class="btn btn-lg btn-danger btn-block"
						value="Clear">
				 </div>
			   </div>
			</div>
		</form>	
		</div>
	<% } %>
	

<div style="margin-bottom:150px;"></div>	
<%@ include file="footer.html"%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>	
</body>
</html>