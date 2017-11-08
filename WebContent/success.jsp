<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.apple.dnssd.TXTRecord"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/nav.jsp"%>	
<%@ include file="/db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%  
//amt=1.00&cc=USD&item_name=VOLTAS%202%20Ton%20Window%20AC&item_number=1&st=Completed&tx=8EH11777FN058940L
  String amt = request.getParameter("amt");
  String cc=request.getParameter("cc");
  String pname=request.getParameter("item_name");
  String pid=request.getParameter("item_number");
  String status=request.getParameter("st");
  String tnxid=request.getParameter("tx");
  String email=session.getAttribute("email").toString();
  String fname=session.getAttribute("fname").toString();
  java.util.Date date2=new java.util.Date();
  
  String sql="INSERT INTO ordertbl(pid,pname,odate,email,fname,status,tnxid,amt,cc) values('"+pid+"','"+pname+"','"+new SimpleDateFormat("YYYY-M-d").format(date2)+"','"+email+"','"+fname+"','"+status+"','"+tnxid+"',"+amt+",'"+cc+"')";
  stmt=conn.createStatement();
  int res=stmt.executeUpdate(sql);
  
  if(res>0)
  {
	  %>
	<div class="container center-block">
		<table class="table active table-responsive table-bordered">
			<thead>
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Transaction Id</th>
					<th>Amount</th>
					<th>Status</th>

				</tr>
			</thead>
			<tbody>
				<tr class="success">
					<td><%=pid %></td>
					<td><%=pname %></td>
					<td><%=tnxid %></td>
					<td><%=amt %></td>
					<td><%=status %></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%	      
  }
  else
  {
	  out.println("<h1 style='color:red;text-align:center;'>Trnasaction failed due to some error!</h1>");  
  }
  
%>
<div style="margin-bottom:150px;"></div>	
<%@ include file="footer.html"%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>	

</body>
</html>