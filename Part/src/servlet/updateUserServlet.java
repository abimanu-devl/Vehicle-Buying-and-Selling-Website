package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.user;
import services.IUser;
import services.IUserService;

/**
 * Servlet implementation class updateUserServlet
 */
@WebServlet("/updateUserServlet")
public class updateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserServlet() {
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
		user uu=new user();
		String eml=request.getParameter("email");

		uu.setEmail(eml);
		uu.setFname(request.getParameter("fname"));
		uu.setLname(request.getParameter("lname"));
		uu.setGender(request.getParameter("gender"));
		uu.setPhone(request.getParameter("phone"));
		uu.setPassword(request.getParameter("pass"));
		
		IUser ir=new IUserService();
		ir.UpdateUserDetails(eml, uu);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/settings.jsp");
		dispatcher.forward(request, response);
	}

}
