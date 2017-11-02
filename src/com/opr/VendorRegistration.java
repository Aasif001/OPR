package com.opr;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VendorRegistration
 */
@WebServlet({ "/VendorRegistration", "/vendorreg" })
public class VendorRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String vname=request.getParameter("vname");
		String address =request.getParameter("address");
		String city =request.getParameter("city");
		String state =request.getParameter("state");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String utype="VENDOR";
		String pass= request.getParameter("pass");
		String repass=request.getParameter("repass");
		java.util.Date date2=new java.util.Date();
		try {
			response.setContentType("text/html");
			Connection conn;
			Statement stmt;

			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
			stmt = conn.createStatement();
			String query = "insert into vendorreg(vname,address,city,state,email,mobile,regdate,utype,pass,repass) values('"+vname+"','"+address+"','"+city+"','"+state+"','"+email+"','"+mobile+"','"+new SimpleDateFormat("YYYY-M-d").format(date2)+"','"+utype+"','"+pass+"','"+repass+"')";
			int status=stmt.executeUpdate(query);
			if(status>0)
			{
				out.println("<script type = 'text/javascript'>alert('You have successfully Registered! Please Login to continue..');</script> ");
				out.println("<script type = 'text/javascript'> window.location='http://localhost:8080/OPR_SYSTEM/vendorLogin.jsp';</script> ");
			}
			else
			{
				out.println("\n <h1 style='color:Red;text-align:center;font-size:16px;'>Couldn't register</h1>");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println("<font color='#e00'>Error: " + e.getMessage() + "</font>");
		}

		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
