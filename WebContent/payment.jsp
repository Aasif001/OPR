<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="db.jsp"%>
<%@ include file="nav.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment OF OPR</title>
</head>
<body>

	<!-- function -->

	<%
		String pid = request.getParameter("id");
		String query = "select * from product where pid='" + pid + "' ";
	     rs = stmt.executeQuery(query);
		while (rs.next()) {
	
			if(session.getAttribute("email")!=null &&session.getAttribute("fname")!=null )
			{
   %>
   
     
	<form action="https://www.sandbox.paypal.com/cgi-bin/webscr"
		method="post">

		<button name="submit" type="submit"
			class="btn btn-primary">Buy Now</button>
		<input type="hidden" name="business" value="payment@bookreader.ml" />

		<!-- Specify a Buy Now button. -->
		<input type="hidden" name="cmd" value="_xclick" />
		<input type="hidden" name="item_name" value="<%=rs.getString("pname")%>"> <input
			type="hidden" name="item_number" value="<%=rs.getString("pid")%>"> <input
			type="hidden" name="amount" value="<%=rs.getString("price")%>"> <input
			type="hidden" name="currency_code" value="USD">

		<!-- Specify URLs -->
		<input type='hidden' name='cancel_return'
			value='http://localhost:8080/OPR_SYSTEM/cancel.jsp' /> <input
			type='hidden' name='return'
			value='http://localhost:8080/OPR_SYSTEM/success.jsp' />
	</form>

<%	
}
else
{
	out.println("<div style='text-align:center;color:green;'>Please Login to Continue..<a href='index.jsp'> Click Here </a></div>");
}
}
%>
</body>
</html>