package com.skillbridge.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;

import com.skillbridge.dao.ProgressDAO;
import com.skillbridge.dao.QuestionDAO;
import com.skillbridge.dao.UserDAO;
import com.skillbridge.model.ProgressModel;
import com.skillbridge.model.UserModel;


@WebServlet("/PracticeServlet")
public class PracticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Enumeration<String> parameterNames = request.getParameterNames();//q1,2,3,...
		
		int score=0;
		int totalQuestions=0;
		QuestionDAO qd=new QuestionDAO();
		String skillId=request.getParameter("skillId");	
		String email= request.getParameter("email");
		
		while(parameterNames.hasMoreElements())
		{
			String parameterName= parameterNames.nextElement();//qn-1,qn-2,....
			if(parameterName.equals("skillId") || parameterName.equals("email"))
			{
			    continue;
			}
			String answer= request.getParameter(parameterName);//qn-1's selected answers , qn-2's selected answers,...
			String questionId=parameterName.substring(8);
		    int questionId1 = Integer.parseInt(questionId);
		    
		    System.out.println("Question ID = " + questionId1);
		    System.out.println("Answer = " + answer);
		//	System.out.println(parameterName + " = " + answer);
		    
			String correctAnswer=qd.getCorrectAnswerByQuestionId(questionId1);
			
			if(correctAnswer.equals(answer))
			{
				score++;
			}
			totalQuestions++;
		}
		
		
		UserDAO ud=new UserDAO();
		UserModel um=ud.findUserbByemail(email);
		
		//System.out.println("Email= "+email);
		request.setAttribute("userId", um.getUserId());
		request.setAttribute("skillId", skillId);
		request.setAttribute("score", score);
		request.setAttribute("totalQuestions", totalQuestions);
		
		System.out.println("User id= "+um.getUserId());
		System.out.println("Skill id= "+skillId);
		System.out.println("Total qns= "+totalQuestions);
		System.out.println("Score= "+score);
		
		ProgressDAO pd=new ProgressDAO();
		int skillId1=Integer.parseInt(skillId);
		
		ProgressModel pm=new ProgressModel(um.getUserId(),skillId1, totalQuestions,score);
		boolean status=pd.insertProgress(pm);
		
		if(status)
		{
		RequestDispatcher rd=request.getRequestDispatcher("practicescore.jsp");
		rd.forward(request, response);
		}
		else
		{
			System.out.println("Something went wrong in practicing questions!!!");
		}
			
	}
	

}
