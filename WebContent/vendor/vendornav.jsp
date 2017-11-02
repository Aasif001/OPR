<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>          
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">VENDOR</a>
    </div>
    <ul class="nav navbar-nav">
			<li class="active" active><a href="profile.jsp">Profile</a></li>
			<li><a href="#">AddProduct</a></li>
			<li><a href="listproduct.jsp">ListProduct</a></li>
			<li><a href="#">DeleteProduct</a></li>
			<%
				if (session.getAttribute("utype") != null) {
					out.println("<li><a style='font-weight:bold;color:#337ab7;' href='/OPR_SYSTEM/logout.jsp'>Logout</a></li>");
				}
			%>
		</ul>
  </div>
</nav>
