<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Custom CSS and JS -->
<link href="/bootstrap/css/logincs.css" rel="stylesheet">
<title>List Product</title>
</head>
<%@ include file="adminnav.jsp"%>
<body>
	<%
		if (session.getAttribute("utype") != "ADMIN") {
			response.sendRedirect("adminlogin.jsp");
		}
		Connection conn;
		Statement stmt;

		DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
		stmt = (Statement) conn.createStatement();
	%>
	<div class="panel panel-body centere-block">
		<div class="container" style="margin-top: 30px;">

			<%
	
	int[] pid=new int[12];
    String[] purl=new String[12];
    String[] pname=new String[12];
	String sql = "SELECT pid,purl,pname from product order by pid ASC limit 12";
	ResultSet rs = stmt.executeQuery(sql);
	double i=0;
	while(rs.next())
	{
		i++;
	}

	if (i>0) {
    // output data of each row
   
    	int j=0;
    	rs = stmt.executeQuery(sql);
       while(rs.next()) {
		pid[j]=rs.getInt("pid");
		purl[j]=rs.getString("purl");
		pname[j]=rs.getString("pname");
		j++;
		
    }
	} else {
		out.println("0 result");
	}
	int arr_no=0;
	double col=4;
	double row_no=Math.ceil(i/col);
	//check double value out.print(i/col);
	int rows=(int)i;
	if(row_no!=0)
	{
		for(i=0;i<row_no;i++)
		{
		
		out.println("<div class='row'>");	
			for(int j=0;j<col;j++)
			{
				if(rows>0)
				{
%>
			<div class="col-md-3 col-sm-12 text-center">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top img-responsive img-thumbnail"
						src="<% out.println("../"+ purl[arr_no]); %>" alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title">
							<% out.println(pname[arr_no]); %>
						</h4>
						<a href="../productinfo.jsp?pid=<% out.println(pid[arr_no]); %>"
							style="margin-bottom: 10px;" class="btn btn-primary">View
							Details</a>
					</div>
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
	</div>

</body>
</html>