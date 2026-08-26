package com.skillbridge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import com.skillbridge.model.UserModel;

public class UserDAO {

	
	public boolean insertData(UserModel um)throws SQLException
	{
		//DBConnection db = new DBConnection();
		//Connection con = null;
		String query="insert into users(username,first_name,last_name,email,mobile,password) values(?,?,?,?,?,?)";
		boolean status=false;
		
		
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
	public boolean loginUser(String username,String password)throws SQLException
	{
		boolean status=false;
		String query="select username,password from users where username=? and password=?";
		try(Connection con=DBConnection.getConnection();
				
			PreparedStatement ps=con.prepareStatement(query))
			{
				ps.setString(1, username);
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

}
