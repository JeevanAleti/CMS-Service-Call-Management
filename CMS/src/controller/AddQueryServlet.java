package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Model3;
import dao.Dao3;

/**
 * Servlet implementation class AddCallServlet
 */
public class AddQueryServlet extends HttpServlet {
	private static final long serialVersionUID =1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQueryServlet() {
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
		String queryid=request.getParameter("query_id");
		String querytitle=request.getParameter("query_title");
		String description=request.getParameter("description");
		String customername=request.getParameter("customer_name");
		String customerno=request.getParameter("customer_no");
		String datasubmit=request.getParameter("data_submit");
		String status=request.getParameter("status");
		String sql="INSERT INTO query(query_id,query_title,description,customer_name,customer_no,data_submit,status)  values(?,?,?,?,?,?,?)";
		if(queryid.equals("")||queryid==null||querytitle.equals("")||querytitle==null||description.equals("")||description==null||customername.equals("")||customername==null ||customerno.equals("")||customerno==null||datasubmit.equals("")||datasubmit==null||status.equals("")||status==null){
	     request.setAttribute("msg", "ALL FIELDS MANDATORY !!");	
	getServletContext().getRequestDispatcher("/addquery.jsp").include(request, response);
	}
	else{
		//create object of Model class
		Model3 m=new Model3();
		//set all the model class variables by its object
	
         m.setQuery_id(queryid);
         m.setQuery_title(querytitle);
		 m.setDescription(description);
         m.setCustomer_name(customername);
         m.setCustomer_no(customerno);
         m.setData_submit(datasubmit);
         m.setStatus(status);
         {

        	 try{
        		int i =Dao3.insert(sql,m);
        		if(i!=0){
        			request.setAttribute("msg", "query added succesful!");
        			getServletContext().getRequestDispatcher("/servicecenterh.jsp").forward(request, response);
        	

        		}
        		else
        			getServletContext().getRequestDispatcher("/addquery.jsp").include(request, response);
        	 }
        	 catch(Exception e)
        	 {
        		 e.printStackTrace();
        	 }
         }
         	

	}
	}
}


