package com.opr;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VendorRegistration
 */
@WebServlet("/VendorLogin")

public class VendorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String em = request.getParameter("em");
		String pass = request.getParameter("pass");
		
		try {
			response.setContentType("text/html");
			Connection conn;
			ResultSet rs;
			Statement stmt;
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
			stmt = conn.createStatement();
			String query = "select email,pass from vendorreg where email='" + em + "' AND pass='"+pass+"' ";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				String email=rs.getString("email");
				String password=rs.getString("pass");
				
				if (email.equals(em) && password.equals(pass)) {

					session.setAttribute("utype","VENDOR");
					session.setAttribute("email",email);
					response.sendRedirect("vendor/profile.jsp");
					// out.println("\n <h1
					// style='color:green;text-align:center;font-size:16px;'>
					// Logged-IN </h1>");
				} else {
					out.println("\n <h1 style='color:red;text-align:center;font-size:16px;'>Please Enter Valid Email Or Password </h1> ");
				}
			}

			stmt.close();
			conn.close();

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
