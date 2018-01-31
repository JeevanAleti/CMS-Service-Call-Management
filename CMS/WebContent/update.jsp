<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
String email=(String)session.getAttribute("email");
System.out.println(email);
try
{
Class.forName("com.ibm.db2.jcc.DB2Driver");
Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/CMS", "Jeevan Reddy", "jeevan5005");
PreparedStatement ps=con.prepareStatement("select * from project.register where email=?");
ps.setString(1, email);
ResultSet rs=ps.executeQuery();
%>
<body bgcolor="navyblue">
<%
while (rs.next()){
	%>
<center>
<font color="red" size="6">${msg}</font><br>
<h2>Registration</h2><hr color="red">

<form method="post" action="UpdateServlet">

<label>Email</label><input type="text" name="email" value="<%=rs.getString(1) %>" readonly><br><br>
<label>Password</label><input type="text" name="pwd" value="<%=rs.getString(2) %>"><br><br>
<label>Uname</label><input type="text" name="uname" value="<%=rs.getString(3) %>"><br><br>
<label>Contact</label><input type="text" name="con" size="20" value="<%=rs.getString(4) %>"><br><br>
<label>Address</label><input type="text" name="addr" value="<%=rs.getString(5) %>"><br><br>

<input type="submit" value="submit"> 
<input type="reset" value="reset"> 
</form>
<form action="profile.jsp">
<input type="submit" value="back">
</form>
</center>
<%
}}catch(Exception e)
{
e.printStackTrace();	
}

%>
</body>
</html>