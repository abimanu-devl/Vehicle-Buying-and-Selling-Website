package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.user;
import util.DBConnection;

public class loginService {
	
	private static Connection con;
	
	private static PreparedStatement ps;
	
	public static final Logger log = Logger.getLogger(loginService.class.getName());
	
	public String userlogin(user user1) {
		
		String email=user1.getEmail();
		String pass=user1.getPassword();
		String logemail=null;
		String logpass=null;
		try {
			
			con=DBConnection.dbconnect();
			String sql="select Email,Password from userdetails";
			ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
		
			while(rs.next()) {
				logemail=rs.getString(1);
				logpass=rs.getString(2);
			
			
				if(email.equals(logemail)&&pass.equals(logpass)) {
					return "Logged";
			
				}
			}
			}catch(SQLException e) {
				log.log(Level.SEVERE, e.getMessage());
				
			}finally {
				/*
				 * Close Prepared statement and database connectivity at the end of
				 * transaction
				 */
				try {
					if (ps != null) {
						ps.close();
					}
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					log.log(Level.SEVERE, e.getMessage());
				}
			}
		return "email or password mismatch";
		
	}
}
