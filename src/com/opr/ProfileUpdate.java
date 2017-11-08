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
 * Servlet implementation class ProfileUpdate
 */
@WebServlet({"/ProfileUpdate", "/profileupdate" })
public class ProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String pass=request.getParameter("pass");
		String repass =request.getParameter("repass");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		try {
			response.setContentType("text/html");
			Connection conn;
			Statement stmt;

			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "");
			stmt = conn.createStatement();
			String query = "UPDATE registration SET pass='"+pass+"',repass='"+repass+"',mobile='"+mobile+"' WHERE email='"+email+"' ";
			int status=stmt.executeUpdate(query);
			if(status>0)
			{
				out.println("<script type = 'text/javascript'>alert('Information Successfully Changed !');</script> ");
				out.println("<script type = 'text/javascript'> window.location='http://localhost:8080/OPR_SYSTEM/index.jsp';</script> ");
			}
			else
			{
				out.println("<script type = 'text/javascript'>alert('Information Couldn't be updated due to some error..');</script> ");
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
