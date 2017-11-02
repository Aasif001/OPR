<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/db.jsp" %>
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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>OPR System Welcome page</title>
<!-- Bootstrap -->
<link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/Footer-with-button-logo.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%@ include file="vendornav.jsp" %> 	
<%
 stmt=conn.createStatement();
 rs=stmt.executeQuery("SELECT * FROM vendorreg WHERE email='"+session.getAttribute("email")+"' ");
 
 while(rs.next())
 {
%>

<h1 class="text-center text-primary"><i>Vendor Profile Page</i></h1>
   <div style="margin-bottom:50px;"></div>	
	<div class="container">
	   <form action="" >
		<div class="row">
			<div class="col=sm-12 col-md-6 col-ld-6">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-user"></i>
						</span> <input class="form-control" placeholder="Vendor Id"
							name="fname" type="text" readonly value="<%=rs.getString("vid") %>" >
					 </div>
				</div>
				</div>
				
				<div class="col=sm-12 col-md-6 col-ld-6">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-user"></i>
						</span> <input class="form-control" placeholder="Vendor Name"
							name="lname" type="text"  readonly value="<%=rs.getString("vname") %>">
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
</body>
</html>