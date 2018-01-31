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
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		session.invalidate();
		request.setAttribute("msg", "Logged out!!");
		getServletContext().getRequestDispatcher("/login.jsp").include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("pwd");
		String sql="select * from admin where email=? and pwd=?";
		if(email.equals("")||email==null||password.equals("")||password==null)
		{
			request.setAttribute("msg", "all fields are mandatory");
			getServletContext().getRequestDispatcher("/adminlogin.jsp").include(request, response);
		}
		
		else 
		{
			Model1 m=new Model1();
			
			m.setEmail(email);
			m.setPwd(password);
			
			try
			{
			ResultSet rs=Dao1.validate(sql,m);
		if(rs.next())
		{
			HttpSession session=request.getSession();
		
			session.setAttribute("email", email);
			getServletContext().getRequestDispatcher("/adminhome.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "Something went wrong, Please try again");
			getServletContext().getRequestDispatcher("/adminlogin.jsp").include(request, response);
		}
		}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
		
	}
	
	}

}
