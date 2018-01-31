package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model1;
import dao.Dao1;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		session.invalidate();
		request.setAttribute("msg", "Logged out!!");
		getServletContext().getRequestDispatcher("/login.jsp").include(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("pwd");
		String sql="select * from register where email=? and pwd=?";
	
		if(email.equals("")||email==null||password.equals("")||password==null)
		{
			request.setAttribute("msg", "all fields are mandatory");
			getServletContext().getRequestDispatcher("/callcenter.jsp").include(request, response);
		}
		// First create a model class object
		else 
		{
			Model1 m=new Model1();
			//set the model variable by setter method
			//always remember that in servlet we always set the model VARIABLES and get them in DAO
			m.setEmail(email);
			m.setPwd(password);
			// create the dao class
			try
			{
			ResultSet rs=Dao1.validate(sql,m);
		if(rs.next())
		{
			HttpSession session=request.getSession();
		
			session.setAttribute("email", email);
			/*session.setAttribute("pwd", rs.getString(2));
			session.setAttribute("uname", rs.getString(3));
			session.setAttribute("con", rs.getString(4));
			session.setAttribute("addr", rs.getString(5));*/
			
			
			getServletContext().getRequestDispatcher("/callcenterh.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "Something went wrong, Please try again");
			getServletContext().getRequestDispatcher("/callcenter.jsp").include(request, response);
		}
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
		
	}
	}

	

}
