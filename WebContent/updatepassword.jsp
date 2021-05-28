<%@ page language="java" import = "java.sql.*,java.util.*,java.io.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%

String std = (String)session.getAttribute("uname");
String pwd = (String)session.getAttribute("pwd");
String log = request.getParameter("log");
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
<style type="text/css">
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=password], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #171717;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  position: relative;
  width:300px;
  }



</style>


</head>
<body bgcolor="grey">

<center><br>
<h3>Update your Password !!</h3>
<br><br><br>
<div>
<form method = "post" action = "update.jsp?sid=<%=std%>&log=<%=log%>" name = "update_form">
<input type = "password" name = "cpwd" placeholder = "Current Password" value" required><br><br>
<input type = "password" name = "npwd" placeholder = "New Password" required><br><br>
<input type = "submit" value = "submit">
</form >
</div>

</center>
</body>
</html>



