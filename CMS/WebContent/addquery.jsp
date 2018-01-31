<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="navyblue">
<center>
<font color="red" size="4">${msg }</font>
<form action="AddQueryServlet" method="post">
<h1>ADD QUERY</h1><hr color="red" size="5"><br>
<table border=""2>
<tr>
<td>Query id:</td>
<td><input type="text" name="query_id"></td>
</tr>

<tr>
<td>Query title:</td>
<td><input type="text" name="query_title" pattern="[a-z A-Z]+" title="use only characters!"></td>
</tr>

<tr>
<td>Description:</td>
<td><input type="text" name="description" pattern="[a-z A-Z]+" title="use only characters!"></td>
</tr>

<tr>
<td>Customer name:</td>
<td><input type="text" name="customer_name" pattern="[a-z A-Z]+" title="use only characters!"></td>
</tr>

<tr>
<td>Customer no:</td>
<td><input type="text" name="customer_no" pattern="^[789]\d{9}$" title="9x-xxxx-xxxx or 8x-xxxx-xxxx or 7x-xxxx-xxxx"></td>
</tr>

<tr>
<td>Data Submitted on:</td>
<td>
  <input type="integer" name="data_submit" pattern="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d" title="mm/dd/yyyy"><br>
 </td>


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