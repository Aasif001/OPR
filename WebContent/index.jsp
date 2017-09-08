<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<!-- Header Stating -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>OPR System Welcome page</title>
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/Footer-with-button-logo.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<!-- Header Closing -->

<body>
	<!-- JSP Decalarion and JSP navigation page include  -->
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
	<%@ include file="nav.jsp"%>

	<!-- JSP include end  -->
	<div class="container-fluid center-block" >
		<div class="row">
			<div class=" col-md-4 col-sm-12">
				<div class="container bg-primary">
					<h3>
						<mark>Product Result</mark>
					</h3>
					<p class="text-justify lead text-capitalize">Best service
						provider for online rental products</p>
				</div>
			</div>
		</div>
	</div>
	<% 
Connection conn;
Statement stmt;

DriverManager.registerDriver(new com.mysql.jdbc.Driver());
conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
stmt = (Statement)conn.createStatement();
%>
	<div class="panel panel-body centere-block">
		<div class="container" style="margin-top: 30px;">

<%
	
	int[] pid=new int[12];
    String[] purl=new String[12];
	String sql = "SELECT pid,purl from product order by pid ASC limit 12";
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
							src="<% out.println(purl[arr_no]); %>" alt="Card image cap">
						<div class="card-body">
							<h4 class="card-title">hello</h4>
							<a href="productinfo.jsp?pid=<% out.println(pid[arr_no]); %>" style="margin-bottom:10px;" class="btn btn-primary">Take On Rent</a>
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

	<%@ include file="footer.html"%>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>