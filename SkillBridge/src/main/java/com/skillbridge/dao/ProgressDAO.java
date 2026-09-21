package com.skillbridge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.skillbridge.model.ProgressModel;
import com.skillbridge.model.UserModel;

public class ProgressDAO {

	boolean status=false;
	
	public boolean insertProgress(ProgressModel pm)
	{
			String query="INSERT INTO user_progress(user_id, skill_id, questions_attempted, questions_correct) values (?, ?, ?, ?)";
			
			//try with resource
			//try block finishes, Java automatically closes resources(con,ps)
			try{
				Connection con=DBConnection.getConnection();
			
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,pm.getUserid());
			ps.setInt(2,pm.getSkillId());
			ps.setInt(3, pm.getQuestionsAttempted());
			ps.setInt(4, pm.getQuestionsCorrect());
			
			int rows=ps.executeUpdate();
			if(rows>0)
				status=true;				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
	   return status;
	}
	
	public List<ProgressModel> getProgressByUserId(int userId)
	{
		String query="SELECT u.progress_id, u.user_id,u.skill_id,s.skill_name,u.questions_attempted,u.questions_correct FROM user_progress u JOIN skills s ON u.skill_id = s.skill_id WHERE u.user_id = ?";
		
		List<ProgressModel> list=new ArrayList<>();
		try{
			Connection con=DBConnection.getConnection();
		
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, userId);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			ProgressModel pm=new ProgressModel();
			pm.setProgressId(rs.getInt("progress_id"));
			pm.setUserid(rs.getInt("user_id"));
			pm.setSkillId(rs.getInt("skill_id"));
			pm.setSkillName(rs.getString("skill_name"));
			pm.setQuestionsAttempted(rs.getInt("questions_attempted"));
			pm.setQuestionsCorrect(rs.getInt("questions_correct"));
			
			list.add(pm);
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
		
		return list;
	}
}
