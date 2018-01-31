<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type = "text/javascript" >
    history.pushState(null, null, 'servicecenterh.jsp');
    window.addEventListener('popstate', function(event) {
    history.pushState(null, null, 'login.jsp');
    });
    </script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="cream">
<center>
<img src="images/logged.jpg" alt="image" width=150 height=200/>

<div class="main">
  <div class="header">
 <a href="addquery.jsp"><span>ADD QUERY</span></a><br></br>
	<a href="viewquery.jsp"><span>VIEW QUERY</span></a><br></br>
	<a href="schangestatush.jsp"><span>CHANGE STATUS</span></a><br></br>
      <form action="login.jsp" method="get">
 <input type="submit" value="Logout">

      </div>
      </div>
</center>
</body>
</html>