package com.skillbridge.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.skillbridge.dao.UserDAO;
import com.skillbridge.model.UserModel;


@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email= request.getParameter("email");
		
		UserDAO ud=new UserDAO();
		UserModel um= ud.findUserbByemail(email);
		
		request.setAttribute("userdata", um);
		//request.setAttribute("userId", um.getUserId());
		
		System.out.println(um);
		RequestDispatcher rd = request.getRequestDispatcher("editprofileform.jsp");
		rd.forward(request, response);
	
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String userid=request.getParameter("userid");
	int userid1= Integer.parseInt(userid);
	String username= request.getParameter("username");
	String firstname=request.getParameter("firstname");
	String lastname=request.getParameter("lastname");
	String mobile=request.getParameter("mobile");
	String email=request.getParameter("email");
	
	System.out.println(username+" "+firstname+" "+lastname+" "+email+" "+mobile);
	
	UserModel um=new UserModel(username, firstname, lastname, email, mobile, email);
	um.setUserId(userid1);
	UserDAO ud=new UserDAO();
	boolean status= ud.updateProfile(um);
	if(status)
	{
		System.out.println("updated");
		response.sendRedirect("ProfileServlet");
		 
	}
	else
	{
		System.out.println("not updated");
	}
	}

}
