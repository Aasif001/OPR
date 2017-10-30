<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="db.jsp" %>	
<%@ include file="nav.jsp"%>

<!-- function -->

<%
		String pid = request.getParameter("id");
		String query = "select * from product where pid='" + pid + "' ";
		rs = stmt.executeQuery(query);
		while (rs.next()) {
			
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" >
	function modify_qty(val) {
    var qty = document.getElementById('qty').value;
    var new_qty = parseInt(qty,10) + val;
    
    if (new_qty < 1) {
        new_qty = 1;
    }
    
    document.getElementById('qty').value = new_qty;
    return new_qty;
}
	
	function modify_week_qty(wval) {
	    var wqty = document.getElementById('wqty').value;
	    var new_wqty = parseInt(wqty,10) + wval;
	    
	    if (new_wqty < 1) {
	        new_wqty = 1;
	    }
	    
	    document.getElementById('wqty').value = new_wqty;
	    return new_wqty;
	}
	</script>

</head>
<body>
	<!-- Product Designing Started from here -->
	<div class="panel panel-body " style="margin-bottom: 10%">
		<div class="containetr fluid center-block">
			<div class="row" >
				<div class="col-md-1 col-sm-1 col-lg-1 text-center"></div>
				<div class="col-md-3 col-sm-3 col-lg-3 text-justfy" style="border-right:solid 1px; border-right-color:#d8d8d8;" >
					<div class="row" style="background-color:#f7f7f7; border-bottom:solid 1px; border-bottom-color:#d8d8d8;">
						<h4>Shipping Address</h4>
					</div>
					<div
						style="margin-top: 2%; margin-bottom: 2%; font-style: oblique;">
						<address>Debra Becker Sr. Marketing Director IDG World
							Expo/IDG Enterprise Events Phone: 508-766-5452</address>
					</div>

					<div>
						<a href='#'  style="width:100%; margin-top:3%;" class="btn btn-warning" >Edit</a>
						<a href="#" class="btn btn-primary" style="width:100%; margin-top:3%;">Deliver to this address </a>
					</div>		
				</div>
				<div class="col-md-7 col-sm-7 col-lg-7 text-center">
					<div class="row"   style="background-color:#f7f7f7; border-bottom:solid 1px; border-bottom-color:#d8d8d8;">
						<div class="col-md-1 col-sm-1 col-lg-1 text-center"></div>
						<div class="col-md-4 col-sm-4 col-lg-4 text-justify">
							<h4>Item</h4>
						</div>
						<div class="col-md-1 col-sm-1 col-lg-1 text-justify" style="border-left:solid 1px; border-left-color:#d8d8d8;">
							<h4>Price</h4>
						</div>
						<div class="col-md-2 col-sm-2 col-lg-2 text-center">
							<h4>Qty</h4>
						</div>
						<div class="col-md-2 col-sm-2 col-lg-2 text-center">
							<h4>Week</h4>
						</div>
						<div class="col-md-1 col-sm-1 col-lg-1 text-justify">
							<h4>Total_Amount</h4>
						</div>
					</div>
					<div class="row" style="margin-top:2%; margin-bottom:2%;">
						<!-- Released one column space -->
						<div class="col-md-1 col-sm-1 col-lg-1 text-center"></div>
						<div class="col-md-3 col-sm-3 col-lg-3 text-justify">
							<div class="card" style="width: auto;">
								<img class="card-img-top img-responsive img-thumbnail" src="<%out.println(rs.getString("purl"));%>" alt="Card image cap">
							</div>
							<div class="card-body">
								<h4 class="card-title">
									<%
										out.println(rs.getString("pname"));
									%>
								</h4>
							</div>
						</div>
						<div class="col-md-1 col-sm-1 col-lg-1 text-center"></div>
						<div class="col-md-1 col-sm-1 col-lg-1 text-center" style="color:#B12704; font-weight:bold;">
							&#8377;<%=rs.getString("price") %>
						</div>
						<!-- Quantity -->
						<div class="col-md-2 col-sm-2 col-lg-2 text-center" style="font-weight:bold;">
							<button id="btnsub" style="width:30%; height:4%;" onclick="modify_qty(-1)">&#45; </button><input type="text" style="width:35%; height:4%;" id="qty" value="1" /><button id="btnadd" style="width:30%; height:4%;" onclick="modify_qty(+1)" >&#43; </button>
						</div>
						<!-- Weeks -->
						<div class="col-md-2 col-sm-2 col-lg-2 text-center" style="font-weight:bold;">
							<button id="wbtnsub" style="width:30%; height:4%;" onclick="modify_week_qty(-1)">&#45; </button><input type="text" style="width:35%; height:4%;" id="wqty" value="1" /><button id="wbtnadd" style="width:30%; height:4%;" onclick="modify_week_qty(+1)" >&#43; </button>
						</div>
						<div class="col-md-1 col-sm-1 col-lg-1 text-center"  style="color:#B12704; font-weight:bold; ">
							
							<%
								float qty = 1, weeks = 2;
								float price = Integer.parseInt(rs.getString("price"));
								float total;
								total = qty * weeks * price;
								out.println("&#8377;"+total);
							%>
						</div>
					</div>	
				</div>
			</div>
			<div class="row" style="margin-top:4%;">
				<div class="col-md-1 col-sm-1 col-lg-1"></div>
				<div class="col-md-10 col-sm-10 col-lg-10 text-justify" style="border-bottom:solid 1px; border-bottom-color:#d8d8d8; background-color:#f7f7f7;" >
					<h4>
						Secondary Address
					</h4>
				</div>
				<div class="col-md-1 col-sm-1 col-lg-1"></div>
			</div>
			<div class="row" style="margin-top:2%;">
				<div class="col-md-1 col-sm-1 col-lg-1"></div>
				<div class="col-md-4 col-sm-4 col-lg-4 text-justify">
					<div>
						<h5>Full Name:</h5>
					</div>
					<div>
						<input type="text" id="txtnm" style="width:100%; height:5%;" />
					</div>
					<div>
						<h5>Mobile Number:</h5>
					</div>
					<div>
						<input type="text" id="txtnm" style="width:100%; height:5%;" />
					</div>
					<div>
						<h5>Pincode:</h5>
					</div>
					<div>
						<input type="text" id="txtpcode" style="width:100%; height:5%;" />
					</div>
					<div>
						<h5>Colony/Street/Society:</h5>
					</div>
					<div>
						<input type="text" id="txtsociety" style="width:100%; height:5%;" />
					</div>
					<div>
						<h5>Town/City</h5>
					</div>
					<div>
						<input type="text" id="txtcity" style="width:100%; height:5%;" />
					</div>
					<div>
						<h5>State:</h5>
					</div>
					<div>
						<input type="text" id="txtstate" style="width:100%; height:5%;" />
					</div>
					 <div>
					 	<a href="#" class="btn btn-primary" style="width:100%; margin-top:3%;">Deliver to this address </a>			
					 </div>
				</div>
				<div class="col-md-6 col-sm-6 col-lg-6 text-justify"></div>
			</div>
					
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
	<!-- Footer ENDS here -->
</body>
</html>