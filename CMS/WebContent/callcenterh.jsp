
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<sql:setDataSource url="jdbc:db2://localhost:50000/CMS" driver="com.ibm.db2.jcc.DB2Driver" user="Jeevan Reddy" password="jeevan5005" var="db"/>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<title>Insert title here</title>
</head>
<center>
<body bgcolour="aqua">
<div class="main">
  <div class="header" >
 <a href="addcall.jsp"><span>Add Calls</span></a><br></br>
	<a href="viewcall.jsp"><span>View Calls</span></a><br></br>
	<a href="changestatush.jsp"><span>Change Status</span></a><br></br>
	<form action="login.jsp" method="get">
      <input type="submit" value="Logout">
      </form>
      </div>
      </div>
</center>
</body>
</html>