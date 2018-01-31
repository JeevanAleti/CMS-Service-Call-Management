
package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Model1;
import dao.Dao1;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		String uname=request.getParameter("uname");
		String contact=request.getParameter("con");
		String address=request.getParameter("addr");
		String sql="insert into register(email,pwd,uname,con,addr) values(?,?,?,?,?)";
	if(email.equals("")||email==null||pwd.equals("")||pwd==null||uname.equals("")||uname==null||contact.equals("")||contact==null||address.equals("")||address==null){
	     request.setAttribute("msg", "all fields mandatory!!");	
	getServletContext().getRequestDispatcher("/register.jsp").include(request, response);
	}
	else{
		//create object of Model class
		Model1 m=new Model1();
		//set all the model class variables by its object
	
         m.setEmail(email);
         m.setPwd(pwd);
         m.setUname(uname);
		 m.setCon(contact);
         m.setAddr(address);
         {
        	 try{
        		int i =Dao1.insert(sql,m);
        		if(i!=0){
        			request.setAttribute("msg", "registration succesful!");
        			getServletContext().getRequestDispatcher("/login.jsp?msg=Registered Successfully...").forward(request, response);
        	

        		}
        		else
        			getServletContext().getRequestDispatcher("/register.jsp").include(request, response);
        	 }
        	 catch(Exception e)
        	 {
        		 e.printStackTrace();
        	 }
         }
         
	}
	}

}
