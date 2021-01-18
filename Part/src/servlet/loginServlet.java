package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user;
import services.loginService;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		user user1=new user();
		user1.setEmail(request.getParameter("email"));
		user1.setPassword(request.getParameter("password"));
		
		loginService log1=new loginService();
		String message=log1.userlogin(user1);
		
		if(message.equals("Logged")) {
			HttpSession session=request.getSession();  
	        session.setAttribute("email",user1.getEmail());  
	        response.sendRedirect("home1.jsp");
			
		}else {
			
			request.setAttribute("error",message);
			RequestDispatcher rd =  request.getRequestDispatcher("/Login.jsp");
			rd.forward(request, response);
			
		}
		
		
	}

}
