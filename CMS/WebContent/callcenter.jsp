<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>caller login</title>
</head>
<body bgcolor="pink">
<center>
<h2>CALL CENTER OPERATORS LOGIN</h2>
<font color="red" size=6>${msg }</font><br/><br/>
<img src="images/login.jpg" alt="image" width=350 height=210/>
<form method="post" action="CallCenterServlet3">
<br/>
<font color=" black" >
Email:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="email" name="email" size=30><br><br>
Password:<input type="password" name="pwd" size=30><br><br>

<input type="Submit" value="Submit">
<input type="reset" value="reset"></font></form><br></br>
<a href="ForgetPassword.jsp">Forgot Password?</a>
</center>

</body>
</html>