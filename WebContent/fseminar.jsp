<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"  %>
<%!
int n,p,semid;
%>  
<%
String uname = (String)session.getAttribute("uname");
System.out.println(uname);
String std = request.getParameter("sid");
System.out.println(std);
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();
ResultSet rs = s.executeQuery("select * from seminar");
Statement s1 = con.createStatement();
ResultSet rs1 = s1.executeQuery("select count(*) from seminar ");


Statement sf = con.createStatement();
ResultSet rsf = sf.executeQuery("select * from faculty where fid = "+uname+" ");
rsf.next();
String branch = rsf.getString("dept");
if(rs1.next()){
n = rs1.getInt(1);
}
Statement s2 = con.createStatement();
String a = "In Progress";
ResultSet rs2 = s2.executeQuery("select count(*) from seminar where status = '"+a+"' and branch = '"+branch+"'");
if(rs2.next()){
p = rs2.getInt(1);
}
System.out.println(n);


Statement s116 = con.createStatement();
ResultSet rs116 = s116.executeQuery("select * from verification_check where vid = 1");
rs116.next();

%>    
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="ISO-8859-1">
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
<script>
function myFunction() {
	var input, filter, table, tr, td, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("customers");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0]; // for column one
	     td1 = tr[i].getElementsByTagName("td")[7]; // for column two
	/* ADD columns here that you want you to filter to be used on */
	    if (td) {
	      if ( (td.innerHTML.toUpperCase().indexOf(filter) > -1) || (td1.innerHTML.toUpperCase().indexOf(filter) > -1) )  {            
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
	} 
</script>
</head>
<body bgcolor = "grey" >
<a class="btn" href="facultyhome.jsp"><i class="fa fa-home"></i></a>
<br>
<%-- <center>
<div class = "formr">

<form method = "post" encrypt="multipart/form-data" action = "addeintable.jsp?eve=seminar&sid=<%=std%>" name = "login_form" >
<input type = "submit" value = "SEMINAR" style="background-color:silver; font-family:georgia; color:black">
<input type = "text" placeholder = "Category" name = "category" id="seminarform" required><br><br>
<input type = "text" placeholder = "Name" name = "aname" required><br><br>
<label for="fdate">From:</label>
<input type = "date" placeholder = "From" name = "fdate" id="fdate" required><br><br>
<label for="tdate">To:</label>
<input type = "date" placeholder = "To" name = "tdate" id= "tdate" required><br><br>
<input type = "text" placeholder = "Organized by" name = "ob" required><br><br>
<input type = "text" placeholder = "Location" name = "loc" required><br><br>
<input type = "file" placeholder = "Document" name = "pdf" accept="application/pdf" ><br><br>
<input type = "submit" value = "Add details">
</form>
</div>


</center> --%>

<%

if(rs116.getString("verify").equals("true")){
%>





<%
if(n != 0 && p != 0){
	%>
	<center>
	<h1> Records: </h1><hr><br>
	
	<table border="1" id = "customers">
	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search.." title="Type in a name">
	
	<tr>
	<th>Id</th>
	<th>Category</th>
	<th>Name</th>
	<th>From Date</th>
	<th>To Date</th>
	<th>Organized by</th>
	<th>Location</th>
	<th>Accept or Decline</th>
	<th>Certificate</th>
	</tr>
	<%
	while(rs.next())
		if((rs.getString("status")).equals("In Progress") && (rs.getString("branch")).equals(rsf.getString("dept"))){
	{
		semid = rs.getInt("semid");
	%>
	<tr>
	<td><%=rs.getInt("sid") %></td>
	<td><%=rs.getString("category") %></td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getDate("fromd") %></td>
	<td><%=rs.getDate("tod") %></td>
	<td><%=rs.getString("orgby") %></td>
	<td><%=rs.getString("loc") %></td>
	<td><a href="ffiledownload.jsp?semid=<%= rs.getString("semid") %>&eve=seminar">View Certificate</a></td>
	
	<td>
	<form method = "post" action = "fupdateseminar.jsp?semid=<%=semid%>&status=accepted&eve=seminar">
	<input type = "submit" value = "Accept">
	</form>
	<form method = "post" action = "fupdateseminar.jsp?semid=<%=semid%>&status=declined&eve=seminar">
	<input type = "submit" value = "Decline">
	</form>
	</td>
	</tr>
	
	
	<%
	}}
	%>
	</table></center>
	
	
	
	<%
}
else{
	%>
	<center><br><br><br><br><br><br><h1>NO records found !!</h1></center>
	<%
}
%>

<%

}else{

%>

<br><br><br><br><br><br>
<center><h1 class = "inset">SEMINAR</h1>
</center>




<%

}

%>


</body>
</html>