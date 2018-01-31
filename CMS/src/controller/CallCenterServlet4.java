package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao2;
import model.Model2;
/**
 * Servlet implementation class CallCenterServlet4
 */
public class CallCenterServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CallCenterServlet4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGekjt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String callid=request.getParameter("callid");
		String customername=request.getParameter("customername");
		String customerno=request.getParameter("customerno");
		String description=request.getParameter("description");
		String title=request.getParameter("title");
		String callerid=request.getParameter("callerid");
		String callername=request.getParameter("callername");
		String status=request.getParameter("status");
		System.out.println(callerid+customername+customerno+description+title+callid+callername+status);

		String sql="update calldata set(customername,customerno,description,title,callerid,callername,status)=(?,?,?,?,?,?,?) where callid=?";
	
		if(callid.equals("")||callid==null||customername.equals("")||customername==null||customerno.equals("")||customerno==null||description.equals("")||description==null||title.equals("")||title==null||callerid.equals("")||callername.equals("")||status.equals(""))
			
		{
			request.setAttribute("msg", "plz fill all the fields!!");
			getServletContext().getRequestDispatcher("/changestatus3.jsp").include(request, response);	
		}	
		
		else
		{
			System.out.println(callerid+customername+customerno+description+title+callid+callername+status);
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
			     
				request.setAttribute("callid", "updation successful");
				getServletContext().getRequestDispatcher("/callcenterh.jsp").forward(request, response);
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
