package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;
import java.util.logging.Level;

import model.payment;
import util.DBConnection;

public class IPaymentService implements IPayment{
	
	private static Connection con;
	
	private static PreparedStatement ps;
	
	public static final Logger log = Logger.getLogger(IPaymentService.class.getName());

	@Override
	public void addPayment(payment p1) {
			try {
				
				con=DBConnection.dbconnect();
				String sql="insert into payment(cardno,expd,cvv) values(?,?,?)";
				ps=con.prepareStatement(sql);
				
				ps.setString(1,p1.getCardno());
				ps.setString(2,p1.getExpiredate());
				ps.setString(3,p1.getCvv());
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

