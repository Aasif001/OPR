<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../db.jsp"%>
<%@ include file="../nav.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <% session.invalidate(); %>
 
  <h1 style="margin-bottom:50px;" class="text-center text-primary"><i>Vendor Registration Page</i></h1>
	<div class="container center-block">
	   <form action="VendorRegistration">
			<div class="row">
				<div class="col-sm-6 col-md-6 col-ld-6">
			      <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-user"></i>
						</span> <input class="form-control" placeholder="Enter Your Name"
							name="vname" type="text" pattern="[a-z A-Z \s]+" required>
					 </div>
				</div>
				</div>
				
				<div class="col-sm-6 col-md-6 col-ld-6">
			      <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-envelope"></i>
						</span> <input class="form-control" placeholder="Enter Your Email"
							name="email" type="email" required>
					 </div>
				</div>
				</div>	
			</div>	
			
			<div class="row">
				<div class="col-sm-6 col-md-6 col-ld-6">
			      <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-earphone"></i>
						</span> <input class="form-control" placeholder="Enter Your Mobile Number"
							name="mobile" pattern="\d*" maxlength="10" minlength="10" required>
					 </div>
				</div>
				</div>
				
				<div class="col-sm-6 col-md-6 col-ld-6">
			      <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-home"></i>
						</span> <input class="form-control" placeholder="Enter Your Address"
							name="address" type="text" required>
					 </div>
				</div>
				</div>	
			</div>	
			
			<div class="row">
				<div class="col-sm-6 col-md-6 col-ld-6">
			      <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-home"></i>
						</span> <input class="form-control" placeholder="Enter Your City Name "
							name="city" type="text"   pattern="[a-zA-Z]+" required>
					 </div>
				</div>
				</div>
				
				<div class="col-sm-6 col-md-6 col-ld-6">
			      <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-home"></i>
						</span> <input class="form-control" placeholder="Enter Your State Name"
							name="state" type="text" pattern="[a-zA-Z]+" required>
					 </div>
				</div>
				</div>	
			</div>	
			
			
			<div class="row">
				<div class="col-sm-6 col-md-6 col-ld-6">
			      <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-lock"></i>
						</span> <input class="form-control" placeholder="Enter Your Your Password "
							name="pass" type="password"  required>
					 </div>
				</div>
				</div>
				
				<div class="col-sm-6 col-md-6 col-ld-6">
			      <div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"> 
						<i	class="glyphicon glyphicon-lock"></i>
						</span> <input class="form-control" placeholder="Confirm Entred Password"
							name="repass" type="password" required>
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

<div style="margin-bottom:100px;"></div>	
<%@ include file="../footer.html"%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>	
</body>
</html>