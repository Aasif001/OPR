package com.opr;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    PrintWriter out = response.getWriter();
		String fname=request.getParameter("fname");
		String lname =request.getParameter("lname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String pass= request.getParameter("pass");
		String repass=request.getParameter("repass");
		String gender=request.getParameter("gender");
		String country=request.getParameter("country");
		try {
			response.setContentType("text/html");
			Connection conn;
			Statement stmt;

			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
			stmt = conn.createStatement();
			String query = "insert into registration values('"+fname+"','"+lname+"','"+email+"','"+mobile+"','"+pass+"','"+repass+"','"+gender+"','"+country+"','Normal')";
			int status=stmt.executeUpdate(query);
			if(status>0)
			{
				out.println("<script type = 'text/javascript'>alert('You have successfully Registered! Please Login to continue..');</script> ");
				out.println("<script type = 'text/javascript'> window.location='http://localhost:8080/OPR_SYSTEM/index.jsp';</script> ");
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
