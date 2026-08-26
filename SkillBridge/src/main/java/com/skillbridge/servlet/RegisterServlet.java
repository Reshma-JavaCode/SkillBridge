package com.skillbridge.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.skillbridge.dao.DBConnection;
import com.skillbridge.dao.UserDAO;
import com.skillbridge.model.UserModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//for testing, printing on console
		System.out.println("Servlet is working");
		
		String username=request.getParameter("username");
		String firstname=request.getParameter("fname");
		String lastname=request.getParameter("lname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		//for testing, printing data on console
		System.out.println(username+" : "+firstname+" : "+lastname);
		System.out.println(email+" : "+mobile);
		
		//To send response back to browser
		//response either in text/html format
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
	
		
		//Server side Validations: Check empty fields
		if (username == null || username.trim().isEmpty()) {
		    out.println("Username is required");//response in text format
		    return;
		}

		if (firstname == null || firstname.trim().isEmpty()) {
		    out.println("First name is required");
		    return;
		}

		if (lastname == null || lastname.trim().isEmpty()) {
		    out.println("Last name is required");
		    return;
		}

		if (email == null || email.trim().isEmpty()) {
		    out.println("Email is required");
		    return;
		}

		if (mobile == null || mobile.trim().isEmpty()) {
		   out.println("Mobile number is required");
		    return;
		}

		if (password == null || password.trim().isEmpty()) {
		   out.println("Password is required");
		    return;
		}
		
		//Validate Email id:
		//[A-Za-z0-9]+([._-][A-Za-z0-9]+)*@ :ex->Reshma@
		//[A-Za-z0-9]+: one or more 1st char accept only digits Or upper Or Lower case letters
		//([._-][A-Za-z0-9]+)*: zero / more from 2nd it can be .,_,- ,any digit,alphabets,then one @
		//[A-Za-z0-9]+(-[A-Za-z0-9]+)*: same like above ex:gmail 
		//\\.[A-Za-z]{2,}: .atleast 2 characters-->ex:.com or .co.in etc
		// *  → 0 or more  , +  → 1 or more , ?  → 0 or 1
		 String regex =
	                "^[A-Za-z0-9]+([._-][A-Za-z0-9]+)*@"
	              + "[A-Za-z0-9]+(-[A-Za-z0-9]+)*"
	              + "(\\.[A-Za-z]{2,})+$";

	        if (!email.matches(regex)) {
	            
	            out.println("Invalid Email");
	            return;
	        }
		
		// Validate mobile number
		if (!mobile.matches("[6-9][0-9]{9}")) {
		    out.println("Invalid mobile number");
		    return;
		}
		
		//  Check password matching
		/*if(password.matches(confirmPassword))
			System.out.println("Password matched");
		else
			out.println("Password not matched");*/
		
		if(!password.matches(confirmPassword)) {
			out.println("Password not matched");
			return;
		}
		
		try {
				UserModel um=new UserModel(username,firstname,lastname,email,mobile,password);
				UserDAO ud=new UserDAO();
				boolean status=ud.insertData(um);
				if(status)
				{
					//out.println("<h2>Registration Successful</h2>");//response in html format
					
					    out.println("<div class='container mt-5 text-center'>");
					    out.println("<h2 class='text-success'>Registration Successful!</h2>");
					    out.println("<p>You can now login to SkillBridge.</p>");
					    out.println("<a href='login.html' class='btn btn-primary'>Go to Login</a>");
					    out.println("</div>");
					
					
				}	
		}
		//Duplicate username,email,mobile number handling
		//specific
		catch (SQLIntegrityConstraintViolationException e) {

		    String message = e.getMessage();

		    if (message.contains("users.username")) {
		        out.println("Username already exists");

		    } else if (message.contains("users.email")) {
		        out.println("Email already registered");

		    } else if (message.contains("users.mobile")) {
		        out.println("Mobile number already registered");

		    } else {
		       out.println("Duplicate value already exists");
		    }

		}
		//General exception
		catch(SQLException e)
		{
			e.printStackTrace();
			out.println("Database error occurred");
		}
	
		
		
	}

}
