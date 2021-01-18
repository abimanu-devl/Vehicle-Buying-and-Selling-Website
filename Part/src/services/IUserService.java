package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.user;
import util.DBConnection;



public class IUserService implements IUser{
	
	private static Connection con;
	
	private static PreparedStatement ps;
	
	public static final Logger log = Logger.getLogger(IUserService.class.getName());
	
	
	private ArrayList<user> actionUser(String email) {
		ArrayList<user> UserList = new ArrayList<user>();
		ResultSet rs;
		try {
			
			con=DBConnection.dbconnect();
			
			if (email!= null && !email.isEmpty()) {
				
				ps=con.prepareStatement("select * from userdetails where Email=?");
				ps.setString(1, email);
				rs=ps.executeQuery();
				
			}else {
				ps=con.prepareStatement("select * from userdetails");
				rs=ps.executeQuery();
				
				
			}
			while(rs.next()) {
				user u1=new user();
				u1.setId(rs.getInt(1));
				u1.setFname(rs.getString(2));
				u1.setLname(rs.getString(3));
				u1.setGender(rs.getString(4));
				u1.setEmail(rs.getString(5));
				u1.setPhone(rs.getString(6));
				u1.setPassword(rs.getString(7));
				UserList.add(u1);
				
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
		return UserList;
		
		
	}
	
	@Override
	public user getUserByEmail(String email) {
		
		return actionUser(email).get(0);
	}

	@Override
	public void DeleteUserDetails(String id) {
		if (id != null && !id.isEmpty()) {
			try {
				
				con=DBConnection.dbconnect();
				ps=con.prepareStatement("delete from userdetails where id=?");
				ps.setString(1,id);
				ps.executeUpdate();
				
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
		}
		
	}

	@Override
	public user UpdateUserDetails(String email, user u1) {
		
		if (email != null && !email.isEmpty()) {
		try {
			
			con=DBConnection.dbconnect();
			ps=con.prepareStatement("update userdetails set Fname=?,Lname=?,Gender=?,Phone=?,Password=? where Email=?");
			
			ps.setString(1,u1.getFname());
			ps.setString(2,u1.getLname());
			ps.setString(3,u1.getGender());
			ps.setString(4,u1.getPhone());
			ps.setString(5,u1.getPassword());
			ps.setString(6,u1.getEmail());
			
			ps.executeUpdate();
			
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
	  }
		
		return getUserByEmail(email);
	}
	

}
