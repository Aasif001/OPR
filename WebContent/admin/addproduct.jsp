<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
<style type="text/css">
.panel-heading {
	padding: 5px 15px;
}

.panel-footer {
	padding: 1px 15px;
	color: #A0A0A0;
}

.profile-img {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}
</style>


</head>
<body>
	<%@ include file="adminnav.jsp"%>
	<div class="container">
		<form class="form-horizontal">
			<div class="form-group">
				<div class="row">
					<div class="col-sm-12 col-md-6 col-ld-6">
						<input type="text" class="form-control" placeholder="Product Name"
							aria-describedby="basic-addon1">
					</div>

					<div class="col-sm-12 col-md-6 col-ld-6">
						<input type="text" class="form-control"
							placeholder="Product Price" aria-describedby="basic-addon1">
					</div>
				</div>
				<br>


				<div class="row">
					<div class="col-sm-12 col-md-6 col-ld-6">
						<input type="text" class="form-control" placeholder="Quantity"
							aria-describedby="basic-addon1">
					</div>

					<div class="col-sm-12 col-md-6 col-ld-6">
						<input type="date" class="form-control" placeholder="Entry Date"
							aria-describedby="basic-addon1">
					</div>
				</div>
				<br>

				<div class="row">
					<div class="col-sm-12 col-md-6 col-ld-6">
						<input type="text" class="form-control" placeholder="Remark"
							aria-describedby="basic-addon1">
					</div>
                    <div class="col-sm-12 col-md-6 col-ld-6">
					<div class="dropdown">
						<button class="btn btn-default dropdown-toggle" type="button"
							id="menu1" data-toggle="dropdown">
							Product Type <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Air conditioner</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Television</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Refrigerator</a></li>
							<li role="presentation" class="divider"></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#">Washing Machine</a></li>
						</ul>
					</div>
					</div>
				</div>
				<br>

			</div>
		</form>
	</div>
</body>
</html>