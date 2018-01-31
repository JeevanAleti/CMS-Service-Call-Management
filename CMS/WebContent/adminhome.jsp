
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource url="jdbc:db2://localhost:50000/CMS" driver="com.ibm.db2.jcc.DB2Driver" user="Jeevan Reddy" password="jeevan5005" var="db"/>
<sql:query dataSource="${db}" var="table" >
select * from register </sql:query>

<html>
<head>
<script type = "text/javascript" >
    history.pushState(null, null, 'adminhome.jsp');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'login.jsp');
    });
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head><center>
<body bgcolor="aqua">
<table border="1" bgcolor="white">
<tr bgcolor="pink">
<p><strong>Employee Details</strong>
<th colspan="1">Email</th>
<th colspan="1">Pwd</th>
<th colspan="1">Uname</th>
<th colspan="1">Con</th>
<th colspan="1">Addr</th>
<th colspan="2">Status</th> 
</tr>
<c:forEach items="${table.rows}" var="r">
<tr>
<td>${r.email}</td>
<td>${r.pwd}</td>
<td>${r.uname}</td>
<td>${r.con}</td>
<td>${r.addr}</td>
<td><a href="adminupdate.jsp?email=${r.email }">Update</a></td><td><a href="admindelete.jsp?email=${r.email }">Delete</a></td>
</tr></c:forEach>



</table><br></br>
<a href="changestatush.jsp">View Calls</a><br></br>

<a href="schangestatush.jsp">View Queries</a><br></br>
<form action="login.jsp" method="get">
 <input type="submit" value="Logout">

</body>
</html>