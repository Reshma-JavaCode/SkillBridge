package com.skillbridge.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection getConnection() {

		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skillbridge", "root", "root");
		}

		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			//System.out.println(e.toString());
		}
		return con;
	}

}
