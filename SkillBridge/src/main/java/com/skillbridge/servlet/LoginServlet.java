package com.skillbridge.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.skillbridge.dao.UserDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		  
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		 System.out.println(username);
	     System.out.println(password);

	    // out.println("<h2>Login data received</h2>");
	     try {
	    	 
	    	 UserDAO uo=new UserDAO();
	    	 boolean status=uo.loginUser(username, password);
	    	 if(status)
	    	 {
	    		 out.println("<h2>Login Successful</h2>");
	    		// HttpSession session=request.getSession();
	    		 //session.setAttribute("username", username);
	    	 } else {
	    	        out.println("<h2>Invalid Username or Password</h2>");
	    	    }
	    	 
	    	 
	     }
	     catch (SQLException e) {
	    	    e.printStackTrace();
	    	    out.println("Database error occurred");
	    	}
	
	}

}
