<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body  background="registerbg.jpg"  bgcolor="violet">

<center>

<font color="red" size="5">${msg }</font>
<img src="images/Register.jpg" alt="image" width=250 height=100/>
<form action="RegisterServlet" method="post">
<h1>Registration</h1><hr color="red" size="5"><br>


Email:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="email"  name="email"><br></br>
Password:&nbsp&nbsp&nbsp<input type="password" name="pwd" minlength="8" maxlength="15" title="Password should contain minimum 8 letters"><br></br>
User Name:<input type="text" name="uname" pattern="[a-z A-Z]+" title="use only characters!"><br></br>
Contact:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="con" pattern="^[789]\d{9}$" title="9x-xxxx-xxxx or 8x-xxxx-xxxx or 7x-xxxx-xxxx"><br></br>
Address:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="addr"><br></br>


<input type="submit" value="submit">
<input type="reset" value="reset">

</form>

</center>
</body>
</html>