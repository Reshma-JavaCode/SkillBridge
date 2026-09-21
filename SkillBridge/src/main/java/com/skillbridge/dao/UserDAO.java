package com.skillbridge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import com.skillbridge.model.UserModel;

public class UserDAO {

	boolean status=false;
	
	
	public boolean insertData(UserModel um)throws SQLException
	{
		//DBConnection db = new DBConnection();
		//Connection con = null;
		String query="insert into users(username,first_name,last_name,email,mobile,password) values(?,?,?,?,?,?)";
		
		
		//try with resource
		//try block finishes, Java automatically closes resources(con,ps)
		try(Connection con=DBConnection.getConnection();
		
		PreparedStatement ps=con.prepareStatement(query))
		{
		ps.setString(1, um.getUsername());
		ps.setString(2, um.getFirstname());
		ps.setString(3, um.getLastname());
		ps.setString(4, um.getEmail());
		ps.setString(5, um.getMobile());
		ps.setString(6, um.getPassword());
		
		int rows=ps.executeUpdate();
		if(rows>0)
			status=true;
			
		}
	return status;

	}
	

	//Login method
	public boolean loginUser(String email,String password)throws SQLException
	{
		//boolean status=false;
		String query="select email,password from users where email=? and password=?";
		try(Connection con=DBConnection.getConnection();
				
			PreparedStatement ps=con.prepareStatement(query))
			{
				ps.setString(1, email);
				ps.setString(2, password);
				try(ResultSet rs=ps.executeQuery()){
				if(rs.next())
				{
					status=true;
					//return rs.next();
				}
				}
			}
		
		return status;
	}
	
	public UserModel findUserbByemail(String email) 
	{
		String query="select * from users where email=?";
		UserModel u=null;
		try{
			Connection con=DBConnection.getConnection();
		
				
			PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, email);
				
				
			ResultSet rs=ps.executeQuery();
			
				if(rs.next())
				{
					u=new UserModel();
					u.setUserId(rs.getInt("user_id"));
					u.setUsername(rs.getString("username"));
					u.setFirstname(rs.getString("first_name"));
					u.setLastname(rs.getString("last_name"));
					u.setMobile(rs.getString("mobile"));
					u.setEmail(email);
					u.setPassword(rs.getString("password"));
					
				}
				
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return u;
	}

	
	public boolean updateProfile(UserModel um)
	{
		String query="update users set username=?,first_name=?,last_name=?,email=?,mobile=? where user_id=?";
		
		try{
			Connection con=DBConnection.getConnection();
		
				
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, um.getUsername());
			ps.setString(2,um.getFirstname());
			ps.setString(3, um.getLastname());
			ps.setString(4, um.getEmail());
			ps.setString(5, um.getMobile());
			ps.setInt(6, um.getUserId());
			
			int row= ps.executeUpdate();
			if(row>0)
			{
				status=true;
			}
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return status;
	}
}
