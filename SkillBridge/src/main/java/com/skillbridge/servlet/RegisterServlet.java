package com.skillbridge.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Servlet is working");
		
		String username=request.getParameter("username");
		String firstname=request.getParameter("fname");
		String lastname=request.getParameter("lname");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");

		
		System.out.println(username+" : "+firstname+" : "+lastname);
		System.out.println(email+" : "+mobile);
		
		//Server side Validations: Check empty fields
		if (username == null || username.trim().isEmpty()) {
		    System.out.println("Username is required");
		    return;
		}

		if (firstname == null || firstname.trim().isEmpty()) {
		    System.out.println("First name is required");
		    return;
		}

		if (lastname == null || lastname.trim().isEmpty()) {
		    System.out.println("Last name is required");
		    return;
		}

		if (email == null || email.trim().isEmpty()) {
		    System.out.println("Email is required");
		    return;
		}

		if (mobile == null || mobile.trim().isEmpty()) {
		    System.out.println("Mobile number is required");
		    return;
		}

		if (password == null || password.trim().isEmpty()) {
		    System.out.println("Password is required");
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

	        if (email.matches(regex)) {
	            System.out.println("Valid Email");
	        } else {
	            System.out.println("Invalid Email");
	        }
		
		// Validate mobile number
		if (!mobile.matches("[7-9][0-9]{9}")) {
		    System.out.println("Invalid mobile number");
		    return;
		}
		
		//  Check password matching
		if(password.matches(confirmPassword))
			System.out.println("Password matched");
		else
			System.out.println("Password not matched");
		
		
	
	}

}
