package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Model1;

public class Dao1 {
	//craete a method for database connection
	static Connection con=null;
	public static Connection connect(){
		try{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			con=DriverManager.getConnection("jdbc:db2://localhost:50000/CMS","Jeevan Reddy","jeevan5005");
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return con;}
	
	public static int insert(String sql,Model1 m){
		int i=0;
		try{
			
			connect();
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, m.getEmail());
			ps.setString(2, m.getPwd());
			ps.setString(3, m.getUname());
			ps.setString(4, m.getCon());
			ps.setString(5, m.getAddr());
			i=ps.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return i;
		}
	public static ResultSet validate(String sql, Model1 m) {
		ResultSet rs=null;
		try
		{
			connect();
			PreparedStatement ps=con.prepareStatement(sql);
			// in dao we always get the values of model variable
			ps.setString(1, m.getEmail());
			ps.setString(2, m.getPwd());
			rs=ps.executeQuery();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rs;
}

	public static boolean update(String sql, Model1 m) {
	    boolean status=false;
		try {
			connect();
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, m.getPwd());
			ps.setString(2, m.getUname());
			ps.setString(3, m.getCon());
			ps.setString(4, m.getAddr());
			ps.setString(5, m.getEmail());
			
			int i=ps.executeUpdate();
			if(i==0)
				status = false;
			else 
			status=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}}
