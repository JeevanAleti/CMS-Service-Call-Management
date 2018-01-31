package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model3;
import dao.Dao3;

/**
 * Servlet implementation class ServiceCenterServlet1
 */
public class ServiceCenterServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceCenterServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query_id=request.getParameter("query_id");
		String query_title=request.getParameter("query_title");
		String description=request.getParameter("description");
		String customer_name=request.getParameter("customer_name");
		String customer_no=request.getParameter("customer_no");
		String data_submit=request.getParameter("data_submit");
		String status=request.getParameter("status");
		System.out.println(query_id+query_title+description+customer_name+customer_no+data_submit+status);

		String sql="update query set(query_title,description,customer_name,customer_no,data_submit,status)=(?,?,?,?,?,?) where query_id=?";
	
		if(query_id.equals("")||query_id==null||query_title.equals("")||query_title==null||description.equals("")||description==null||customer_name.equals("")||customer_name==null||customer_no.equals("")||customer_no.equals("")||status.equals(""))
			
		{
			request.setAttribute("msg", "plz fill all the fields!!");
			getServletContext().getRequestDispatcher("/schangestatus.jsp").include(request, response);	
		}	
		
		else
		{
			System.out.println(query_id+query_title+description+customer_name+customer_no+data_submit+status);
			Model3 m=new Model3();
		m.setQuery_id(query_id);
		m.setQuery_title(query_title);
		m.setDescription(description);
		m.setCustomer_name(customer_name);
		m.setCustomer_no(customer_no);
		m.setData_submit(data_submit);
		m.setStatus(status);
	
			try{
		   boolean b=Dao3.update(sql,m);
		   if(b){ 
			     
				request.setAttribute("query_id", "updation successful");
				getServletContext().getRequestDispatcher("/servicecenterh.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "updation Failed");
				getServletContext().getRequestDispatcher("/schangestatus.jsp").include(request, response);
				
			}
		}catch(Exception e){
			e.printStackTrace();}
		}
		

	}

}
