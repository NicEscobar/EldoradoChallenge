package com.SQLite;

import java.sql.*;

public class Connect{
	
	//create a connection to the database
	public Connection connection() {
		
		Connection conn = null;
		
		try {
			
			String url = "jdbc:sqlite:database/eldorado.db";	
					
			conn = DriverManager.getConnection(url);
			
			System.out.println("Connection to SQLite has been established.");
			
			return conn;
			
		}catch(SQLException e){
			
			System.out.println(e.getMessage());
			
		}
		return conn;
		
	}
	
	//create a disconnection to the database
	public void disconnection(Connection conn) {
		
		try {
			
			if (conn != null) {
				
				conn.close();
				
				System.out.println("SQLite disconnected.");
				
			}
			
		}catch(SQLException e){
			
			System.out.println(e.getMessage());
			
		}
		
	}
	
}
