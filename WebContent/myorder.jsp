<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="nav.jsp"%>
<%@ include file="db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
h4:hover{color:}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OPR My Order</title>
</head>
<body>
	<h1 class="text-center text-primary">
		<u><i>My Orders</i></u>
	</h1>
	<div class="container" style="margin-top: 30px;">

		<%
			int[] oid = new int[100];
			int[] amt = new int[100];
			String[] purl = new String[100];
			String[] odate = new String[100];
			String[] pname = new String[100];
			String[] status = new String[100];
			String[] tnxid = new String[100];
			String sql = "SELECT ord.oid,ord.pname,ord.odate,ord.status,ord.amt,ord.tnxid,prod.purl FROM ordertbl ord INNER JOIN product prod ON ord.pid = prod.pid  WHERE ord.email='"
					+ session.getAttribute("email") + "' order by ord.odate ASC limit 100";
			/* String sql = "SELECT oid,pname,odate,status,tnxid,amt from ordertbl WHERE email='"+session.getAttribute("email")+"' order by pid ASC limit 12"; */
			rs = stmt.executeQuery(sql);
			double i = 0;
			while (rs.next()) {
				i++;
			}

			if (i > 0) {
				// output data of each row

				int j = 0;
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					oid[j] = rs.getInt("oid");
					purl[j] = rs.getString("purl");
					pname[j] = rs.getString("pname");
					odate[j] = rs.getString("odate");
					status[j] = rs.getString("status");
					tnxid[j] = rs.getString("tnxid");
					amt[j] = rs.getInt("amt");
					j++;

				}
			} else {
				out.println("0 result");
			}
			int arr_no = 0;
			double col = 4;
			double row_no = Math.ceil(i / col);
			//check double value out.print(i/col);
			int rows = (int) i;
			if (row_no != 0) {
				for (i = 0; i < row_no; i++) {

					out.println("<div class='row'>");
					for (int j = 0; j < col; j++) {
						if (rows > 0) {
		%>
		<div class="col-md-6 col-ld-6 col-sm-6 text-center">
			<div class="card" style="width: 20rem;">
				<img class="card-img-top img-responsive img-thumbnail"
					src="<%out.println(purl[arr_no]);%>">
			</div>
		</div>
		<div class="col-md-6 col-ld-6 col-sm-6 text-left">
			<div class="card-body">
				<h4 class="card-title"
					style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: inline-block; max-width: 100%;">Product Name
					<%
					   
						out.println(pname[arr_no]);
					%>
				</h4>
				<h5>
					Price: <span style="color: black">&#36;<%
					out.println(amt[arr_no]);
				%></span>
				</h5>
				<h6>
					Status: <span style="color: #388e3c;"> <%
							out.println(status[arr_no]);
						%>
					</span>
				</h6>
				<h6>
					Transaction Id: <span style="color: #878787;"> <%
							out.println(tnxid[arr_no]);
						%>
					</span>
				</h6>
				<h6>
					Order Date: <span style="color: #878787;"> <%
							out.println(odate[arr_no]);
						%>
					</span>
				</h6>
				<a href="productinfo.jsp?pid=<%out.println(oid[arr_no]);%>"
					style="margin-bottom: 10px;" class="btn btn-primary">View
					Product</a>
				<a href="https://www.bluedart.com/maintracking.html"
					style="margin-bottom: 10px;margin-left:30px;" class="btn btn-info">
					<i	class="glyphicon glyphicon-screenshot"></i> Track Order</a>	
			</div>
		</div>

		<%
			rows--;
							arr_no++;
						}
					}

					out.println("</div>");
				}
			}
		%>
	</div>

	<%@ include file="footer.html"%>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>