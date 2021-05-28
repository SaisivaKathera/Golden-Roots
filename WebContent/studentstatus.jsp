<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"  %>
<%!
int n,p;
%>  
<%
String std = (String)session.getAttribute("uname");
/* String std = request.getParameter("sid"); */
System.out.println(std);
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();
ResultSet rs = s.executeQuery("select * from seminar where sid = "+std+"");
Statement s1 = con.createStatement();
ResultSet rs1 = s1.executeQuery("select count(*) from seminar where sid = "+std+"");
if(rs1.next()){
n = rs1.getInt(1);
}
Statement s2 = con.createStatement();
String a = "accepted";
ResultSet rs2 = s2.executeQuery("select count(*) from seminar where sid = "+std+" and status = '"+a+"'");
if(rs2.next()){
p = rs2.getInt(1);
}
System.out.println(n);
%>    
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="ISO-8859-1">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<title>Seminar</title>
<style type="text/css">
.inset {
    color: #444444;
    text-shadow: -1px -1px 1px #000, 1px 1px 1px #ccc;
    font-size: 40px;
}
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
input[type=date], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=file], select {
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
  width:600px;
  }

#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #171717;
  color: white;
}

.btn {
  background-color: grey; /* Blue background */
  border: none; /* Remove borders */
  color: white; /* White text */
  padding: 12px 16px; /* Some padding */
  font-size: 16px; /* Set a font size */
  cursor: pointer; /* Mouse pointer on hover */
}
</style>
</head>
<body bgcolor = "grey" >
<a class="btn" href="seminar.jsp?sid=<%= std %>"><i class="fa fa-home"></i></a>
<%-- 
<a href="studentstatus.jsp" style="text-decoration: none"><i class='fas fa-info-circle'></i> </a>
<br><br>
<center>
<div class = "formr">

<form method = "post" enctype="multipart/form-data" action = "semup?sid=<%=std %>"   name = "login_form" >
<input type = "submit" value = "SEMINAR" style="background-color:silver; font-family:georgia; color:black">
<input type = "text" placeholder = "Category" name = "category" id="seminarform" required><br><br>
<input type = "text" placeholder = "Name" name = "aname" required><br><br>
<label for="fdate">From:</label>
<input type = "date" placeholder = "From" name = "fdate" id="fdate" required><br><br>
<label for="tdate">To:</label>
<input type = "date" placeholder = "To" name = "tdate" id= "tdate" required><br><br>
<input type = "text" placeholder = "Organized by" name = "ob" required><br><br>
<input type = "text" placeholder = "Location" name = "loc" required><br><br>
<input type = "file" placeholder = "Document" name = "pdf" accept="application/pdf" required><br><br>
<input type = "submit" value = "Add details">
</form>
</div>


</center> --%>
<center><h2 class = "inset">SEMINAR</h2></center><hr>
<br><br><br>






<%
if(n != 0 ){
	%>
	<center>
	<h3> Previous Records Status: </h3>
	
	<table border="1" id = "customers">
	<tr>
	<th>ID</th>
	<th>Category</th>
	<th>Name</th>
	<th>From Date</th>
	<th>To Date</th>
	<th>Organized by</th>
	<th>Location</th>
	<th>Status</th>
	<th>Date of Approval<br> or Refusal</th>
	<th>Certificate</th>
	</tr>
	<%
	while(rs.next())
		
	{
	%>
	<tr>
	<td><%=rs.getString("semid") %></td>
	<td><%=rs.getString("category") %></td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getDate("fromd") %></td>
	<td><%=rs.getDate("tod") %></td>
	<td><%=rs.getString("orgby") %></td>
	<td><%=rs.getString("loc") %></td>
	<td><%=rs.getString("status") %></td>
	<td><%
	String date = rs.getString("statusdate");
	if(date == null){
	 %>
	 No Response
	 <%
	 }
	else{
		%>
		<%=date%>
		<%
	}
	%></td>
	<td><a href="seminarfiledownload.jsp?semid=<%= rs.getString("semid")%>&eve=seminar">View Certificate</a></td>
	</tr>
	
	
	<%
	}
	%>
	</table></center>
	
	
	
	<%
}
else{
	%>
	<center><h3>NO records found !!</h3></center>
	<%
}
%>

</body>
</html>