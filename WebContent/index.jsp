<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@ include file="nav.jsp"%>
<%@ include file="db.jsp"%>
<body>
	<!-- JSP Decalarion and JSP navigation page include  -->
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>

	<div class="container-fluid center-block" >
		<div class="row">
			<div class=" col-md-4 col-sm-12">
				<div class="container bg-primary">
					<h3>
						<mark>OPR System</mark>
					</h3>
					<p class="text-justify lead text-capitalize">Best service
						provider for online rental products</p>
				</div>
			</div>
		</div>
	</div>
	<% 
/* Connection conn;
Statement stmt;
DriverManager.registerDriver(new com.mysql.jdbc.Driver());
conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", ""); 
stmt = (Statement)conn.createStatement(); */
%>
	<div class="panel panel-body centere-block">
		<div class="container" style="margin-top: 30px;">

<%
	
	int[] pid=new int[100];
    int[] price=new int[100];
    String[] purl=new String[100];
    String[] pname=new String[100];
	String sql = "SELECT pid,purl,pname,price from product order by pid ASC limit 100";
    rs = stmt.executeQuery(sql);
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
		price[j]=rs.getInt("price");
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
							<h4 class="card-title" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;display: inline-block;max-width: 100%;"><% out.println(pname[arr_no]); %></h4>
							<a href="productinfo.jsp?pid=<% out.println(pid[arr_no]); %>" style="margin-bottom:10px;" class="btn btn-primary">Take On Rent</a>
							<h4>Price: <span style="color:#B12704;">&#36;<% out.println(price[arr_no]); %></span></h4>
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