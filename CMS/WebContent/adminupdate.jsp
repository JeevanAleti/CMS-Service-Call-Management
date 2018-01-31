
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource url="jdbc:db2://localhost:50000/CMS" driver="com.ibm.db2.jcc.DB2Driver" user="Jeevan Reddy" password="jeevan5005" var="db"/>
<sql:query dataSource="${db}" var="table">
select * from register where email=?
<sql:param value="${param.email }"></sql:param>
</sql:query>
<c:if test="${param.action eq 'update'}">
<sql:update dataSource="${db}">
update register set(pwd,uname,con,addr)=(?,?,?,?) where email=?
<sql:param value="${param.pwd}"></sql:param>
<sql:param value="${param.uname}"></sql:param>
<sql:param value="${param.con}"></sql:param>
<sql:param value="${param.addr}"></sql:param>
<sql:param value="${param.email}"></sql:param>
</sql:update>
<c:redirect url="adminhome.jsp"></c:redirect>
</c:if>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lightyellow">
<center>
<img src="images/adminupdate.jpg" alt="image" width=150 height=100/>
</br><br/>
<form action="adminupdate.jsp" method="get">
<label>Email:</label>&nbsp;<label>${table.rowsByIndex[0][0]}</label><input type="hidden" name="email" value="${table.rowsByIndex[0][0]}"><br/><br></br>
<label>Password:</label><input type="password" name="pwd" value="${table.rowsByIndex[0][1]}"><br/><br><br>
<label>Uname:</label><input type="text" name="uname" value="${table.rowsByIndex[0][2]}"><br/><br><br>
<label>Contact:</label><input type="text" name="con" value="${table.rowsByIndex[0][3]}"><br/><br><br>
<label>Address:</label><input type="text" name="addr" value="${table.rowsByIndex[0][4]}"><br/><br><br>


<input type="submit" name="action" value="update">

</form>
</center>
</body>
</html>