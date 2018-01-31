
package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model2;
import dao.Dao2;

/**
 * Servlet implementation class AddQueryServlet
 */
public class AddCallServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCallServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		session.invalidate();
		request.setAttribute("msg", "Logged out!!");
		getServletContext().getRequestDispatcher("/callcenerh.jsp").include(request, response);
	
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
		String callerid=request.getParameter("callerid");
		String callername=request.getParameter("callername");
		String status=request.getParameter("status");
		String sql="insert into calldata values(?,?,?,?,?,?,?,?)";
		if(callid.equals("")||callid==null||customername.equals("")||customername==null||customerno.equals("")||customerno==null||description.equals("")||description==null||title.equals("")||title==null ||callerid.equals("")||callerid==null||callername.equals("")||callername==null||callername==null||status.equals("")||status==null){
	     request.setAttribute("msg", "all fields mandatory!!");	
	getServletContext().getRequestDispatcher("/addcall.jsp").include(request, response);
	}
	else{
		//create object of Model class
		Model2 m=new Model2();
		//set all the model class variables by its object
	
         m.setCallid(callid);
         m.setCustomername(customername);
         m.setCustomerno(customerno);
		 m.setDescription(description);
         m.setTitle(title);
         m.setCallerid(callerid);
         m.setCallername(callername);
         m.setStatus(status);
         {

        	 try{
        		int i =Dao2.insert(sql,m);
        		if(i!=0){
        			request.setAttribute("msg", "call added succesful!");
        			getServletContext().getRequestDispatcher("/callcenterh.jsp").forward(request, response);
        	

        		}
        		else
        			getServletContext().getRequestDispatcher("/addcall.jsp").include(request, response);
        	 }
        	 catch(Exception e)
        	 {
        		 e.printStackTrace();
        	 }
         }
         	

	}

	}

}
