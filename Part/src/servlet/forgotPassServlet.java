package servlet;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnection;


/**
 * Servlet implementation class forgotPassServlet
 */
@WebServlet("/forgotPassServlet")
public class forgotPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotPassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String npass=request.getParameter("npassword");
		String cpass=request.getParameter("cpassword");
		
		try {
			Connection con=null;
			con=DBConnection.dbconnect();
			if(npass.equals(cpass)) {
				PreparedStatement ps=con.prepareStatement("update userdetails set Password=? where Email=?");
				ps.setString(2,email);
				ps.setString(1,cpass);
				ps.executeUpdate();
				response.sendRedirect("Login.jsp");
		
			}
			else {
				String error="password mismatch";
				request.setAttribute("error",error);
				RequestDispatcher rd =  request.getRequestDispatcher("/ForgotPassword.jsp");
				rd.forward(request, response);
				
				
			}
			
		
		}catch(SQLException e) {
				e.printStackTrace();
			
		
		}
	}

}
