<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		if(session.getAttribute("type")!=null)
		{
			if(session.getAttribute("type").equals("user"))
			{
				 session.invalidate();
				  out.println("<li><a href='profile.jsp''>Profile</a></li>"); 
				 response.sendRedirect("index.jsp");
			}
			else
			{
				session.invalidate();
				response.sendRedirect("vendorLogin.jsp");
			}
		}
		else
		{
			session.invalidate();
			out.println("<script type = 'text/javascript'>alert('You have successfully Logged-out..');</script> ");
			out.println("<script type = 'text/javascript'> window.location='http://localhost:8080/OPR_SYSTEM/vendorLogin.jsp';</script> ");
		}
%>					 

</body>
</html>