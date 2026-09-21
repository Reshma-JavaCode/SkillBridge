package com.skillbridge.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.skillbridge.dao.SkillDAO;
import com.skillbridge.model.SkillModel;

/**
 * Servlet implementation class SkillsServlet
 */
@WebServlet("/SkillsServlet")
public class SkillsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//SkillModel sm=new SkillModel();
		SkillDAO sd=new SkillDAO();
		
		 List<SkillModel> list = sd.getAllSkills();
		 System.out.println("Skills are:");
		 System.out.println(list);
		 System.out.println();
		
		request.setAttribute("skillsList", list);
		RequestDispatcher rd=request.getRequestDispatcher("skills.jsp");
		rd.forward(request, response);
		
	
	}

}
