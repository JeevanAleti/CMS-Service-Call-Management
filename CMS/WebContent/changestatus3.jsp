<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource url="jdbc:db2://localhost:50000/CMS" driver="com.ibm.db2.jcc.DB2Driver" user="Jeevan Reddy" password="jeevan5005" var="db"/>
<sql:query dataSource="${db}" var="table">
select * from calldata where callid=?
<sql:param value="${param.callid }"></sql:param>
</sql:query>
<c:if test="${param.action eq 'update'}">
<sql:update dataSource="${db}">
update calldata set(customername,customerno,description,title,callerid,callername,status)=(?,?,?,?,?,?,?) where callid=?
<sql:param value="${param.customername}"></sql:param>
<sql:param value="${param.customerno}"></sql:param>
<sql:param value="${param.description}"></sql:param>
<sql:param value="${param.title}"></sql:param>
<sql:param value="${param.callerid}"></sql:param>
<sql:param value="${param.callername}"></sql:param>
<sql:param value="${param.status}"></sql:param>
<sql:param value="${param.callid}"></sql:param>




</sql:update>
<c:redirect url="changestatush.jsp"></c:redirect>
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
<img src="images/callupdate.jpg" alt="image" width=150 height=100/>
</br><br/>
<form action="changestatus3.jsp" method="get">
<label>Callid:</label>&nbsp;<label>${table.rowsByIndex[0][0]}</label><input type="hidden" name="callid" value="${table.rowsByIndex[0][0]}"><br/><br></br>
<label>Customername:</label><input type="text" name="customername" value="${table.rowsByIndex[0][1]}"><br/><br><br>
<label>Customerno:</label><input type="text" name="customerno" value="${table.rowsByIndex[0][2]}"><br/><br><br>
<label>Description:</label><input type="text" name="description" value="${table.rowsByIndex[0][3]}"><br/><br><br>
<label>Title:</label><input type="text" name="title" value="${table.rowsByIndex[0][4]}"><br/><br><br>
<label>Callername:</label><input type="text" name="callername" value="${table.rowsByIndex[0][5]}"><br/><br><br>
<label>Callerid:</label><input type="text" name="callerid" value="${table.rowsByIndex[0][6]}"><br/><br><br>
<label>Status:</label><input type="text" name="status" value="${table.rowsByIndex[0][7]}"><br/><br><br>

<input type="submit" name="action" value="update">
	
</form>

</center>
</body>
</html>
