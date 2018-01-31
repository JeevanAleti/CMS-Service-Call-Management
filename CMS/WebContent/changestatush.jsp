
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource url="jdbc:db2://localhost:50000/CMS" driver="com.ibm.db2.jcc.DB2Driver" user="Jeevan Reddy" password="jeevan5005" var="db"/>
<sql:query dataSource="${db}" var="table" >
select * from calldata</sql:query>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head><center>
<body bgcolor="aqua">
<table border="1" bgcolor="white">
<tr bgcolor="pink">
<th colspan="1">callid</th>
<th colspan="1">customername</th>
<th colspan="1">customerno</th>
<th colspan="1">description</th>
<th colspan="1">title</th>
<th colspan="1">callerid</th>
<th colspan="1">callername</th>
<th colspan="2">Status</th> 
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
<td><a href="changestatus3.jsp?callid=${r.callid}">Update</a></td>
</tr></c:forEach>
</table><br></br>

</body>
</html>