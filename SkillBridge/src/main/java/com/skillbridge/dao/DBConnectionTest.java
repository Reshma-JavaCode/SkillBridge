package com.skillbridge.dao;

import java.sql.Connection;

public class DBConnectionTest {

	 public static void main(String[] args) {

	        Connection con = DBConnection.getConnection();

	        if (con != null) {
	            System.out.println("Database connected successfully");
	        } else {
	            System.out.println("Database connection failed");
	        }
	    }
	
}
