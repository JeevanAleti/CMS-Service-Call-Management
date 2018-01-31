
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource url="jdbc:db2://localhost:50000/CMS" driver="com.ibm.db2.jcc.DB2Driver" user="Jeevan Reddy" password="jeevan5005" var="db"/>
<sql:query dataSource="${db}" var="table" >
select * from query</sql:query>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head><center>
<body bgcolor="aqua">
<table border="1" bgcolor="white">
<tr bgcolor="pink">
<h1>List of Queries</h1>
<th colspan="1">Query_id</th>
<th colspan="1">Query_title</th>
<th colspan="1">Description</th>
<th colspan="1">Customer_name</th>
<th colspan="1">Customer_no</th>
<th colspan="1">Data_submit</th>
<th colspan="2">Status</th> 
</tr>
<c:forEach items="${table.rows}" var="r">
<tr>
<td>${r.query_id}</td>
<td>${r.query_title}</td>
<td>${r.description}</td>
<td>${r.customer_name}</td>
<td>${r.customer_no}</td>
<td>${r.data_submit}</td>
<td>${r.status}</td><br></br>
<td><a href="schangestatus.jsp?query_id=${r.query_id}">Update</a></td>
</tr></c:forEach>
</table><br></br>
<a href="adminhome.jsp">Click Here to go Back</a>

</body>
</html>