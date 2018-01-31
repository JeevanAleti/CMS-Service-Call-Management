<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource url="jdbc:db2://localhost:50000/CMS" driver="com.ibm.db2.jcc.DB2Driver" user="Jeevan Reddy" password="jeevan5005" var="db"/>
<sql:query dataSource="${db}" var="table">
select * from query where query_id=?
<sql:param value="${param.query_id }"></sql:param>
</sql:query>
<c:if test="${param.action eq 'update'}">
<sql:update dataSource="${db}">
update query set(query_title,description,customer_name,customer_no,data_submit,status)=(?,?,?,?,?,?) where query_id=?
<sql:param value="${param.query_id}"></sql:param>
<sql:param value="${param.query_title}"></sql:param>
<sql:param value="${param.description}"></sql:param>
<sql:param value="${param.customer_name}"></sql:param>
<sql:param value="${param.customer_no}"></sql:param>
<sql:param value="${param.data_submit}"></sql:param>
<sql:param value="${param.status}"></sql:param>
</sql:update>
<c:redirect url="schangestatus.jsp"></c:redirect>
</c:if>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type = "text/javascript" >
    history.pushState(null, null, 'schangestatus.jsp');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'login.jsp');
    });
    </script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lightyellow">
<center>
<img src="images/callupdate.jpg" alt="image" width=150 height=100/>
<form action="ServiceCenterServlet1" method="get"><br></br>
<label>Query id:</label>&nbsp;<label>${table.rowsByIndex[0][0]}</label><br></br>
<label>Query_title</label><input type="text" name="query_title" value="${table.rowsByIndex[0][1]}"><br><br/>
<label>Description</label><input type="text" name="description" value="${table.rowsByIndex[0][2]}"><br><br/>
<label>Customer_name</label><input type="text" name="customer_name" value="${table.rowsByIndex[0][3]}"><br><br/>
<label>Customer_no</label><input type="text" name="customer_no" value="${table.rowsByIndex[0][4]}"><br><br/>
<label>Data_submit or not?</label><input type="text" name="data_submit" value="${table.rowsByIndex[0][5]}"><br><br/>
<label>Status</label><input type="text" name="status" value="${table.rowsByIndex[0][6]}"><br><br/>
<input type="hidden" name="query_id" value="${table.rowsByIndex[0][0]}"><br/>
<input type="submit" name="action" value="update">
</form>
</center>
</body>
</html>