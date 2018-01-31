package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Model2;

public class Dao2 {
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
	
	public static int insert(String sql,Model2 m){
		int i=0;
		try{
			
			connect();
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, m.getCallid());
			ps.setString(2, m.getCustomername());
			ps.setString(3, m.getCustomerno());
			ps.setString(4, m.getDescription());
			ps.setString(5, m.getTitle());
			ps.setString(6, m.getCallerid());
			ps.setString(7, m.getCallername());
			ps.setString(8, m.getStatus());
			i=ps.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return i;
		}
	public static ResultSet validate(String sql, Model2 m) {
		ResultSet rs=null;
		try
		{
			connect();
			PreparedStatement ps=con.prepareStatement(sql);
			// in dao we always get the values of model variable
			ps.setString(1, m.getCallid());
			ps.setString(2, m.getCustomername());
			rs=ps.executeQuery();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rs;
}

	public static boolean update(String sql1, Model2 m) {
	    boolean status=false;
		try {
			connect();
			PreparedStatement ps=con.prepareStatement(sql1);
			ps.setString(1, m.getCustomername());
			ps.setString(2, m.getCustomerno());
			ps.setString(3, m.getDescription());
			ps.setString(4, m.getTitle());
			ps.setString(5, m.getCallerid());
			ps.setString(6, m.getCallername());
			ps.setString(7, m.getStatus());
			ps.setString(8, m.getCallid());
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
