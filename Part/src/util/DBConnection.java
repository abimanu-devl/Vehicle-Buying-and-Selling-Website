package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection dbconnect() {
		 Connection con=null;
		 String connurl = "jdbc:mysql://localhost:3306/testjava"; 
		 String username = "root";
		 String password = "";
		 
		 try {
			 
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(connurl, username, password);
			
			 
		 }catch(ClassNotFoundException e) {
			 e.printStackTrace();
			 
			 
		 }catch(SQLException e) {
			 
			 e.printStackTrace();
			 
			 
		 }
		 
		return con;
	}

}
