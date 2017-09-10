<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>OPR System Welcome page</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
<title>Insert title here</title>
</head>	
	
<div class="container" style="width:100%">
	<div class="row">
		<div class="col-xl-* col-sm-12">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="index.jsp"> <img
							style="width: 55px; height: 35px;" src="bootstrap/logo.png"
							alt="OPR System Logo" />
						</a>
					</div>
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<%
						  if(session.getAttribute("email")!=null)
						  {
							  out.println("<li><a href='profile.jsp''>Profile</a></li>"); 
						  }
						  else
						  { 
						    out.println("<li><a href='#' data-target='#myModal' data-toggle='modal'>Login</a></li>");
						    out.println("<li><a href='#' data-target='#myModel2' data-toggle='modal'>Registration</a></li>");
						  }
						%>		
						<li><a href="#">Product</a></li>
						<li><a href="#">AboutUs</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Vendor</a></li>
						<%
						  if(session.getAttribute("email")!=null)
						  {
						     out.println("<li><a style='font-weight:bold;color:#337ab7;' href='logout.jsp'>Logout</a></li>");
						  }
						%>
						
					</ul>
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>

				</div>
			</nav>
		</div>
	</div>
</div>



<!-- Modal -->

<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Login</h4>
			</div>
			<div class="modal-body">

				<form action="/OPR_SYSTEM/Login" method="POST">
					<div style="margin-left: 20px; margin-right: 20px;" class="row">
						<div class="col-sd-2">
							<div class="form-group">
								<label for="email">Email address:</label> <input type="email"
									class="form-control" id="email" name="em">
							</div>
						</div>
						<div class="col-sd-2">
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" id="pwd" name="pass">
							</div>
						</div>
						<div class="row" style="margin-bottom:4%;">
							<div class="col-md-6 col-sd-6 text-center">
								<button type="submit" style="width:100%" class="btn btn-default"><strong>LOGIN</strong></button>
							</div>


							<div class="col-md-6 col-sd-6 text-center">
								<button type="reset" style="width:100%" class="btn btn-default"><strong>CLEAR</strong></button>
							</div>
						</div>


					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<!-- SignUp Model -->
<div id="myModel2" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Registration</h4>
			</div>
			<div class="modal-body">

				<form action="/OPR_SYSTEM/Registration" method="POST">
					<div style="margin-left: 20px; margin-right: 20px;" class="row">
						<div class="col-sd-2">
							<div class="form-group">
								<label for="firstName">First Name</label> <input type="text" pattern="[a-zA-Z\s]+"
									class="form-control" id="firstName" name="fname" required>
							</div>
						</div>
						<div class="col-sd-1">
							<div class="form-group">
								<label for="lastName">Last Name</label> <input type="text" pattern="[a-zA-Z \s]+"
									class="form-control" id="lastName" name="lname" required>
							</div>
						</div>

						<div class="col-sd-1">
							<div class="form-group">
								<label for="email">Email address:</label> <input type="email"
									class="form-control" id="email" name="email" required>
							</div>
						</div>

						<div class="col-sd-1">
							<div class="form-group">
								<label for="mobile">Mobile</label> <input type="tel"
									pattern="\d*" maxlength="10" minlength="10" class="form-control" id="mobile"
									name="mobile" required>
							</div>
						</div>

						<div class="col-sd-1">
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" id="pwd" name="pass" required>
							</div>
						</div>
						<div class="col-sd-1">
							<div class="form-group">
								<label for="pwd2">Re-Password:</label> <input type="password"
									class="form-control" id="pwd2" name="repass" required>
							</div>
						</div>



						<div class="row text-center" style="margin-bottom:4%">
							<div class="col-md-6 col-sd-6 text-center">
								<select class="custom-select" name="gender" required>
									<option value="male" selected>Male</option>
									<option value="female">Female</option>
									<option value="others">Others</option>
								</select>
							</div>
							<div class="col-md-6 col-sd-6 text-center">
								<select class="custom-select" name="country" required>
									<option value="India" selected>India</option>
									<option value="US">US</option>
									<option value="Australia">Australia</option>
								</select>
							</div>



						</div>
						<div class="row" style="margin-bottom:4%;">
							<div class="col-md-6 col-sd-6 text-center">
								<button type="submit" style="width:100%" class="btn btn-default"><strong>REGISTRATION</strong></button>
							</div>


							<div class="col-md-6 col-sd-6 text-center">
								<button type="reset" style="width:100%" class="btn btn-default"><strong>CLEAR</strong></button>
							</div>
						</div>

					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>
