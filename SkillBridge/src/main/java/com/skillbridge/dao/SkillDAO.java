package com.skillbridge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.skillbridge.model.SkillModel;

public class SkillDAO {
	
	public List<SkillModel> getAllSkills()
	{
		
		String query="select * from skills";
		List<SkillModel> list=new ArrayList<>();
	
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				SkillModel sk=new SkillModel();
				sk.setSkillId(rs.getInt("skill_id"));
				sk.setSkillName(rs.getString("skill_name"));
				sk.setDescription(rs.getString("description"));
				list.add(sk);
			}
				
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return list;
	}

}
