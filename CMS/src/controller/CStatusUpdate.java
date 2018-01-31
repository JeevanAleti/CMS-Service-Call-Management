package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model2;
import dao.Dao2;

/**
 * Servlet implementation class CStatusUpdate
 */
public class CStatusUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CStatusUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String callid=request.getParameter("callid");
		String customername=request.getParameter("customername");
		String customerno=request.getParameter("customerno");
		String description=request.getParameter("description");
		String title=request.getParameter("title");
		String sql="update calldata set(customername,customerno,description,title)=(?,?,?,?) where callid=?";
	
		if(callid.equals("")||callid==null||customername.equals("")||customername==null||customerno.equals("")||customerno==null||description.equals("")||description==null||title.equals("")||title==null)
			
		{
			request.setAttribute("msg", "plz fill all the fields!!");
			getServletContext().getRequestDispatcher("/changestatus3.jsp").include(request, response);	
		}	
		
		else
		{
			
			Model2 m=new Model2();
		m.setCallid(callid);
		m.setCustomername(customername);
		m.setCustomerno(customerno);
		m.setDescription(description);
		m.setTitle(title);
	
			try{
		   boolean b=Dao2.update(sql,m);
		   if(b){ 
			     
				request.setAttribute("callid", "updation successful");
				getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "updation Failed");
				getServletContext().getRequestDispatcher("/changestatus3.jsp").include(request, response);
				
			}
		}catch(Exception e){
			e.printStackTrace();}
		}
		


	}

}
