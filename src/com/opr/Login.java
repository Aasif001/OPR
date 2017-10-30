package com.opr;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		out = response.getWriter();
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
			String query = "select email,pass,fname from registration where email='" + em + "' ";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				String email=rs.getString("email");
				String password=rs.getString("pass");
				String fname=rs.getString("fname");
				
				if (em.equals(email) && password.equals(pass)) {

					session.setAttribute("type", "user");
					session.setAttribute("email", email);
					session.setAttribute("fname", fname);
					response.sendRedirect("index.jsp");
					// out.println("\n <h1
					// style='color:green;text-align:center;font-size:16px;'>
					// Logged-IN </h1>");
				} else {
					out.println("\n <h1 style='color:red;text-align:center;font-size:16px;'> Sorry </h1> ");
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
