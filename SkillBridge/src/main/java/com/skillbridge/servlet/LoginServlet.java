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
import com.skillbridge.model.UserModel;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		  
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		 System.out.println(email);
	     System.out.println(password);

	    // out.println("<h2>Login data received</h2>");
	     try {
	    	 
	    	 UserDAO uo=new UserDAO();
	    	 UserModel um=new UserModel();
	    	 
	    	
	    	 boolean status=uo.loginUser(email, password);

    		// request.setAttribute("email", email);
	    	 if(status)
	    	 {
	    		 um=uo.findUserbByemail(email);
	    		 System.out.println("Login Successful");
	    		 HttpSession session=request.getSession();
	    		 session.setAttribute("email", email);
	    		 session.setAttribute("username", um.getUsername());
	    		 response.sendRedirect("dashboard.jsp");
	    	 } else {
	    	        out.println("<h2>Invalid Email or Password</h2>");
	    	    }
	    	 
	    	 
	     }
	     catch (SQLException e) {
	    	    e.printStackTrace();
	    	    out.println("Database error occurred");
	    	}
	
	}

}
