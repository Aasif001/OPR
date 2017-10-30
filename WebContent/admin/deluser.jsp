<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	if (!session.getAttribute("type").equals("ADMIN")) {
		response.sendRedirect("adminlogin.jsp");
	}

	String action = request.getParameter("email").toString();
	int status = stmt.executeUpdate("DELETE FROM registration WHERE email='" + action + "'");

	if (status > 0) {
		response.sendRedirect("/OPR_SYSTEM/admin/listuser.jsp");
	} else {
		out.print("could not delete user");
	}
%>
<body>

</body>
</html>