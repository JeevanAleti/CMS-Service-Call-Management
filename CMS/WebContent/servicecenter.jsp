<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type = "text/javascript" >
    history.pushState(null, null, 'servicecenter.jsp');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'login.jsp');
    });
    </script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>service login</title>
</head>
<body bgcolor="orange">
<center>
<h2>SERVICE CENTER OPERATORS LOGIN</h2>
<font color="red" size=6>${msg }</font><br/><br/>
<img src="images/login.jpg" alt="image" width=350 height=210/>
<form method="post" action="ServiceCenterServlet">
<br/>
<font color=" black" >
Email:&nbsp&nbsp&nbsp&nbsp&nbsp<input type="email" name="email" size=30><br><br>
Password:<input type="password" name="pwd" size=30><br><br>

<input type="Submit" value="Submit">
<input type="reset" value="reset"></font></form><br></br>
<a href="ForgetPassword.jsp">Forgot Password?</a>
</center>

</body>
</html>