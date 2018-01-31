<%@ page import="controller.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="dao.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mailing</title>
</head>
<body>
<!-- Add this two packages -->
<%@page import="java.util.*,javax.mail.*" %>
<%@page import="javax.mail.internet.*" %>

<!-- creating a result for getting status that message is delivered or not -->
<%
String result;
//get recipient's emaid,message & subject line from index.jsp

String subject1 ="RE : Forget Password";
String query = "select * from Register where email=?";

final String to=request.getParameter("email");
final String subject=request.getParameter(subject1);
 
 Connection con = Dao1.connect();
 PreparedStatement ps = con.prepareStatement(query);
 ps.setString(1, to);
  ResultSet rs = ps.executeQuery();
  
  String password = null;
  while(rs.next()){
	  password = rs.getString(2);
  }
final String messg="   Dear User ! \n"+" Your Password  is : "+password    
                                       +"\n thanks & Regards ,\n"+"mreccsea1317@gmail.com";


//sender's emailid and password needs to be mentioned

final String from="ag1reddy110@gmail.com";
final String pass="srilaxmi1205";

//defining the gmail host
String host="smtp.gmail.com";


//creating properties object
Properties props=new Properties();

//defining properties

props.put("mail.smtp.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.user", from);
props.put("mail.password", pass);
props.put("mail.port","465");

//Authorized the session object

Session mailSession=Session.getInstance(props,new Authenticator(){
	@Override
	
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication(from,pass);
	}

	
});

try{
	//create a default MimeMessage object
	MimeMessage message=new MimeMessage(mailSession);
	
	//set From : header field of header
	
	message.setFrom(new InternetAddress(from));
	
	//set To : header field of header
	
	message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	
	// set Subject : header field
	message.setSubject(subject);
	
	//set actual message
	
	message.setText(messg);
	
	//send message
	
	Transport.send(message);
	
	result="Check Your Mail To See The Password !";
	
}catch(MessagingException mex){
	mex.printStackTrace();
	result="error : unable to send mail";
}

%>

<title>Sending mail in jsp</title>
<h1><center><font color="blue">sending mail using jsp</font></center></h1>
<b><center><font color="red"><%out.print(result); %></center>

</body>
</html>