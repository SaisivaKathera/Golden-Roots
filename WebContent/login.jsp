<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*,java.util.*"   %>
    
    
<%
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s2 = con.createStatement();
ResultSet rs2 = s2.executeQuery("select * from upload_check where uid = 1");
rs2.next();
if(rs2.getString("uploads").equals("true")){
	String fal = "false"; 
	Statement s3 = con.createStatement();
	s3.executeUpdate("update upload_check set uploads = '"+fal+"' where todate < '"+java.time.LocalDate.now()+"' or fromdate > '"+java.time.LocalDate.now()+"' and uid=1 ");

}else if(rs2.getString("uploads").equals("false")){
	String tru = "true"; 
	Statement s9 = con.createStatement();
	s9.executeUpdate("update upload_check set uploads = '"+tru+"' where fromdate <= '"+java.time.LocalDate.now()+"' and todate >= '"+java.time.LocalDate.now()+"' and uid=1 ");

}
Statement s4 = con.createStatement();
ResultSet rs4 = s4.executeQuery("select * from verification_check where vid = 1");
rs4.next();
if(rs4.getString("verify").equals("true")){
	String fal = "false"; 
	Statement s5 = con.createStatement();
	s5.executeUpdate("update verification_check set verify = '"+fal+"' where todate <='"+java.time.LocalDate.now()+"' and vid=1 ");
}

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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

.inset {
    color: #444444;
    text-shadow: -1px -1px 1px #000, 1px 1px 1px #ccc;
    font-size: 40px;
}

</style>



</head>
<body bgcolor="grey">
<br><br><br><br><br>
<center>
<h1 class = "inset" style="font-size:80px">GOLDEN ROOTS</h1>

<div>

<form method = "post" action = "login" name = "login_form">
<input type = "text" placeholder = "Username" name = "uname" required><br><br>
<input type = "password" placeholder = "Password" name = "pwd" required><br><br>
<input type = "submit" value = "submit">
</form>
</div>


</center>

</body>
</html>