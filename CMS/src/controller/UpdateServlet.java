package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Dao2;

import model.Model2;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String callid=request.getParameter("callid");
		String customername=request.getParameter("customername");
		String customerno=request.getParameter("customerno");
		String description=request.getParameter("description");
		String title=request.getParameter("title");
		String callerid=request.getParameter("callerid");
		String callername=request.getParameter("callername");
		String status=request.getParameter("status");
		String sql="UPDATE calldata SET(customername,customerno,description,title,callerid,callername,status) values=(?,?,?,?,?,?,?) where callid=?";
		if(callid.equals("")||callid==null||customername.equals("")||customername==null||customerno.equals("")||customerno==null||description.equals("")||description==null||title.equals("")||title==null||callerid.equals("")||callerid==null||callername.equals("")||callername==null||status.equals("")||status==null)
			
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
		m.setCallerid(callerid);
		m.setCallername(callername);
		m.setStatus(status);
	
			try{
		   boolean b=Dao2.update(sql,m);
		   if(b){ 
			      /*HttpSession session=request.getSession();
			    session.setAttribute("email", email);
			    session.setAttribute("pwd", pwd);
			    session.setAttribute("uname", uname);
			    session.setAttribute("con", con);
			    
			    session.setAttribute("add", add);*/
				request.setAttribute("callid", "updation successful");
				getServletContext().getRequestDispatcher("/callchange.jsp").forward(request, response);
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
