package com.skillbridge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.skillbridge.model.QuestionModel;

public class QuestionDAO {
	
	public List<QuestionModel> getAllQuestions()
	{
		
		String query="select * from questions";
		List<QuestionModel> list=new ArrayList<>();
	
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				QuestionModel qm=new QuestionModel();
				
				qm.setQuestionId(rs.getInt("question_id"));
				qm.setSkillId(rs.getInt("skill_id"));
				qm.setQuestionText(rs.getString("question_text"));
				qm.setOptionA(rs.getString("option_a"));
				qm.setOptionB(rs.getString("option_b"));
				qm.setOptionC(rs.getString("option_c"));
				qm.setOptionD(rs.getString("option_d"));
				qm.setCorrectAnswer(rs.getString("correct_answer"));
				list.add(qm);
			}
				
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public List<QuestionModel> getQuestionsBySkillId(int skillId)
	{
		
		String query="select * from questions where skill_id=?";
		List<QuestionModel> list=new ArrayList<>();
	
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, skillId);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				QuestionModel qm=new QuestionModel();
				
				qm.setQuestionId(rs.getInt("question_id"));
				qm.setSkillId(rs.getInt("skill_id"));
				qm.setQuestionText(rs.getString("question_text"));
				qm.setOptionA(rs.getString("option_a"));
				qm.setOptionB(rs.getString("option_b"));
				qm.setOptionC(rs.getString("option_c"));
				qm.setOptionD(rs.getString("option_d"));
				qm.setCorrectAnswer(rs.getString("correct_answer"));
				list.add(qm);
			}
				
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return list;
	}

}
