<%@page import="java.util.Calendar"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Url"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%  
String imgfld="C:\\Users\\AASIFKHAN\\Documents\\OPR\\WebContent\\bootstrap\\image\\";
MultipartRequest multi = new MultipartRequest(request,imgfld,600000000);
out.println("Files:");
Enumeration files = multi.getFileNames();
while (files.hasMoreElements())
 {
	  
      String name = (String)files.nextElement();
      String filename = multi.getFilesystemName(name);
      String type = multi.getContentType(name);
      out.println("<BR>name: " + filename);
      out.println("<BR>filename: " + filename);
      out.println("<BR>type: " + type);
      File f=new File(imgfld+filename);
      String renamefile="username"+Math.random()+filename;
      File f2=new File(imgfld+renamefile);
      out.println(imgfld+renamefile);
      f.renameTo(f2);
      if(!type.equalsIgnoreCase("image/png") && !type.equalsIgnoreCase("image/jpeg") && !type.equalsIgnoreCase("image/jpg"))
      {
    	  if(f.delete())
    	  out.println("Sucessfully deleted file");
    	  else
    	  out.println("Error in deleting file");
      }
      
      try {
			response.setContentType("text/html");
			Connection conn;
			PreparedStatement stmt;

			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
			stmt = conn.prepareStatement("insert into product(vid,pname,price,qty,entrydate,pdesc,purl,remark,ptype) values(?,?,?,?,?,?,?,?,?)");
			stmt.setInt(1,11);
			stmt.setString(2,"fdiiw");
			stmt.setDouble(3, 100.00);
			stmt.setInt(4,1111);
			Calendar calendar=Calendar.getInstance();
			java.sql.Date startDate = new java.sql.Date(calendar.getTime().getTime());
			stmt.setDate(5,startDate);
			stmt.setString(6, "teri to");
			stmt.setString(7,imgfld+renamefile);
			stmt.setString(8,"sdsd");
			stmt.setString(9,"Ac");
			
			int status=stmt.executeUpdate();
			if(status>0)
			{
				out.println("\n <h1 style='color:green;text-align:center;font-size:16px;'>You have successfully uploaded </h1>");
			}
			else
			{
				out.println("\n <h1 style='color:Red;text-align:center;font-size:16px;'>Not uploaded</h1>");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println("<font color='#e00'>Error: " + e.getMessage() + "</font>");
		}
   }
out.print("successfully uploaded");  
  
%>  
</body>
</html>