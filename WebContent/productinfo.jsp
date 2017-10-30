<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Navigation file included -->

<%@ include file="nav.jsp"%>

<%
		String type = "";
		String id = request.getParameter("pid");
		String query = "select * from product where pid='" + id + "' ";
		rs = stmt.executeQuery(query);
		while (rs.next()) {
			
			type = rs.getString("ptype");
%>

<!-- JDBC connection END -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Product Designing Started from here -->
	<div class="panel panel-body " style="margin-bottom: 10%">
		<div class="containetr fluid center-block">
			<div class="row">
				<div class="col-md-1 col-sm-1 col-lg-1 text-center"></div>


				<div class="col-md-2 col-sm-2 col-lg-2 text-center">
					<div class="card" style="width: auto;">
						<img class="card-img-top img-responsive img-thumbnail"
							src="<%out.println(rs.getString("purl"));%>" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title">
								<%
									out.println(rs.getString("pname"));
								%>
							</h4>
						</div>
					</div>
				</div>

				<div class="col-md-1 col-sm-1 col-lg-1 text-center"></div>

				<div class="col-md-6 col-sm-6 col-lg-6 text-justify">
					<div>
					<h4>Price: <span style="color:#B12704;">&#8377;<% out.println(rs.getString("price")); %></span>P/week</h4>
						<table>
							<tr>
								<td></td>
								<td><a href="payment.jsp?id=<%= id %>" class="btn btn-primary" style="margin:2px;" >Take on rent</a><td>
							</tr>
						</table>
					</div>
					<div>
						<h4>Features</h4>
						<ul>
						<li>HD TV</li>
						<li>1 * USB</li>
						<li>1080p FHD</li>
						<li>Good sound Quality</li>

					</ul>
					</div>
					
					<h4>Description</h4>
					<% out.println(rs.getString("pdesc")); %>				
				</div>
				<div class="col-md-1 col-sm-1 col-lg-1 text-center"></div>

			</div>
		<%
		}
	%>
			<!-- Product Designing ENDS here -->
			
			<!-- Free space for col-2 here -->
			<div class="row">
				<div class="col-md-1 col-sm-1 col-lg-1 text-justify"></div>
				<div class="col-md-10 col-sm-10 col-lg-10 text-justify">
					<h3 style="border-bottom:solid 1px; border-bottom-color:#d8d8d8; background-color:#f7f7f7;">
						Related Items
					</h3>
				</div>
			</div>
			<div class="row">
			<div class="col-md-1 col-sm-1 col-lg-1 text-justify"></div>
			
				<%
					String relate_qry = "select * from product where ptype = '"+type+"' limit 5";
					ResultSet relate_rs = stmt.executeQuery(relate_qry);
					while(relate_rs.next())
					{
						
				%>
						<div class="col-md-2 col-sm-2 col-lg-2 text-justify style="width:auto;" >
                    		<a href="productinfo.jsp?pid=<%= relate_rs.getString("pid") %>" style="text-decoration:none;">
								<div class="card" style="width: 20rem;">
									<img class="card-img-top img-responsive img-thumbnail" src="<%= relate_rs.getString("purl") %>" alt="Card image cap">
									<div class="card-body">
										<h4 class="card-title" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;display: inline-block;max-width: 100%;"><%= relate_rs.getString("pname") %></h4>
										<h4 style="color:#B12704;">&#8377;<%= relate_rs.getString("price") %></h4>
									</div>
								</div>
							</a>
						</div>
				<%
					}
				%>
			</div>
			<div class="col-md-5 col-sm-5 col-lg-5 text-justify"></div>
		</div>
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