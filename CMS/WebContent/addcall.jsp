<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<font color="red" size="5">${msg }</font>
<form action="AddCallServlet" method="post">
<table border="1" bgcolor="aqua">

<h1>ADD CALL</h1><hr color="red" size="5"><br>
<tr>
<td>Call id:</td>
<td><input type="text" name="callid"></td>
</tr>

<tr>
<td>Customer Name:</td>
<td><input type="text" name="customername" pattern="[a-z A-Z]+" title="use only characters!"></td>
</tr>

<tr>
<td>Customer no:</td>
<td><input type="text" name="customerno" pattern="^[789]\d{9}$" title="9x-xxxx-xxxx or 8x-xxxx-xxxx or 7x-xxxx-xxxx"></td>
</tr>

<tr>
<td>Description:</td>
<td><input type="text" name="description" pattern="[a-z A-Z]+" title="use only characters!"></td>
</tr>

<tr>
<td>Title:</td>
<td><input type="text" name="title" pattern="[a-z A-Z]+" title="use only characters!"></td>
</tr>

<tr>
<td>Caller id:</td>
<td><input type="text" name="callerid"></td>
</tr>

<tr>
<td>Caller Name:</td>
<td><input type="text" name="callername" pattern="[a-z A-Z]+" title="use only characters!"></td>
</tr>

<tr>
<td>Status:</td>
<td><input type="text" name="status" pattern="[a-z A-Z]+" title="use only characters!"></td>
</tr>

 <tr align="center">

<td><input type="Reset" value="Reset"></td>
<td><input type="Submit" value="Submit"></td>
</tr>

</table>

</form>
</center>
</body>
</html>