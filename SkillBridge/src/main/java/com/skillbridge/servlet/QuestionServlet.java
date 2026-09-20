package com.skillbridge.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.skillbridge.dao.QuestionDAO;
import com.skillbridge.model.QuestionModel;


@WebServlet("/QuestionServlet")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String skillId = (request.getParameter("skillId"));
		int skillId1=Integer.parseInt(skillId);
	QuestionDAO qd=new QuestionDAO();
	List<QuestionModel> list= qd.getQuestionsBySkillId(skillId1);
	System.out.println(list);
	
	request.setAttribute("questions", list);
	RequestDispatcher rd=request.getRequestDispatcher("questions.jsp");
	rd.forward(request, response);

		
	}

}
