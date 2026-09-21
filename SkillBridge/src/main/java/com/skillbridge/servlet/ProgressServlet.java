package com.skillbridge.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.skillbridge.dao.ProgressDAO;
import com.skillbridge.dao.UserDAO;
import com.skillbridge.model.ProgressModel;
import com.skillbridge.model.UserModel;


@WebServlet("/ProgressServlet")
public class ProgressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("email") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");

        UserDAO ud=new UserDAO();
        UserModel um=ud.findUserbByemail(email);
        
        
        ProgressDAO pd=new ProgressDAO();
        List<ProgressModel> list= pd.getProgressByUserId(um.getUserId());
        
        System.out.println("Progress details: ");
        System.out.println(list);
        
        request.setAttribute("progresslist", list);
        
        RequestDispatcher rd = request.getRequestDispatcher("progress.jsp");
        rd.forward(request, response);
	}

}
