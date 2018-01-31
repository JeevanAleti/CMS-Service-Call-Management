
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource url="jdbc:db2://localhost:50000/CMS" driver="com.ibm.db2.jcc.DB2Driver" user="Jeevan Reddy" password="jeevan5005" var="db"/>
<sql:query dataSource="${db}" var="table" >
SELECT * FROM calldata</sql:query>
<sql:query dataSource="${db}" var="tables" >
SELECT * FROM query </sql:query>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="aqua">
<center>
<h2>LIST OF CALLS</h2>
<table border="1" bgcolor="white">
<tr bgcolor="pink">
<th colspan="1">callid</th>
<th colspan="1">customername</th>
<th colspan="1">customerno</th>
<th colspan="1">description</th>
<th colspan="1">title</th>
<th colspan="1">callerid</th>
<th colspan="1">callername</th> 
<th colspan="1">status</th>
<th colspan="1">edit</th>
</tr>
<c:forEach items="${table.rows}" var="r">
<tr>
<td>${r.callid}</td>
<td>${r.customername}</td>
<td>${r.customerno}</td>
<td>${r.description}</td>
<td>${r.title}</td>
<td>${r.callerid}</td>
<td>${r.callername}</td>
<td>${r.status}</td>
<td><a href="changestatus3.jsp? callid=${r.callid }">Update</a></td>
</tr></c:forEach>
</table>
<h2>LIST OF QUERY</h2>
<table border="1" bgcolor="white">
<tr bgcolor="pink">
<th colspan="1">query_id</th>
<th colspan="1">query_title</th>
<th colspan="1">description</th>
<th colspan="1">customer_name</th>
<th colspan="1">customer_no</th>
<th colspan="1">data_submit</th> 
<th colspan="1">status</th>
<th colspan="1">edit</th>
</tr>
<c:forEach items="${table.rows}" var="r">
<tr>
<td>${r.query_id}</td>
<td>${r.query_title}</td>
<td>${r.description}</td>
<td>${r.customer_name}</td>
<td>${r.customer_no}</td>
<td>${r.data_submit}</td>
<td>${r.status}</td>
<td><a href="schangestatus.jsp? query_id=${r.query_id }">Update</a></td>
</tr></c:forEach>
</table>
</center>
</body>
</html>