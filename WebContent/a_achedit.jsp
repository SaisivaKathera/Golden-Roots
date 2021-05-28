<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"  %>
<%!
int n,p1,p2,p3,semid,studentid;
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
ResultSet rs = s.executeQuery("select * from editsach");




Statement s1 = con.createStatement();
ResultSet rs1 = s1.executeQuery("select count(*) from editsprofile ");



if(rs1.next()){
n = rs1.getInt(1);
}

Statement s2 = con.createStatement();
String a = "accepted";
ResultSet rs2 = s2.executeQuery("select count(*) from editsach where progress = '"+a+"'");
if(rs2.next()){
p1 = rs2.getInt(1);
}

Statement s3 = con.createStatement();
a = "declined";
ResultSet rs3 = s3.executeQuery("select count(*) from editsach where progress = '"+a+"'");
if(rs3.next()){
p2 = rs3.getInt(1);
}

Statement s4 = con.createStatement();
a = "In Progress";
ResultSet rs4 = s4.executeQuery("select count(*) from editsach where  progress = '"+a+"'");
if(rs4.next()){
p3 = rs4.getInt(1);
}

System.out.println(n);
%>    
    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta charset="ISO-8859-1">
<title>Seminar</title>
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
.status{
width: 200px;
position: relative;
float:left;
top:20px;
}
.status1{
width: 200px;
position: relative;
float:left;
top: -40x;
right:-350px;
}

.status2{
width: 200px;
position: relative;
float: right;
top: -15px;

}
.inset {
    color: #444444;
    text-shadow: -1px -1px 1px #000, 1px 1px 1px #ccc;
    font-size: 40px;
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
	     td1 = tr[i].getElementsByTagName("td")[8];// for column two
	     td2 = tr[i].getElementsByTagName("td")[9];
	/* ADD columns here that you want you to filter to be used on */
	    if (td) {
	      if ( (td.innerHTML.toUpperCase().indexOf(filter) > -1) || (td1.innerHTML.toUpperCase().indexOf(filter) > -1) || (td2.innerHTML.toUpperCase().indexOf(filter) > -1) )  {            
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
<a class="btn" href="adminhome.jsp"><i class="fa fa-home"></i></a>
<br>
<center><h2 class = "inset">Achievement Requests</h2></center><hr>
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
if(n != 0 && p3 != 0){
	%>
	<center>
	
	
	
	<table border="1" id = "customers">
	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search.." title="Type in a name">
	
	<tr>
	<th>Student Id</th>
	<th>Name</th>
	<th>Branch</th>
	<th>Category</th>
	<th>Reason</th>
	<th>Update</th>
	</tr>
	<%
	while(rs.next())
		/* semid = rs.getInt("catid"); */
		if(rs.getString("progress").equals("In Progress")){
		Statement s0 = con.createStatement();
		System.out.println(rs.getInt("catid"));
		studentid = rs.getInt("sid");
		
        ResultSet rss = s0.executeQuery("select * from student where sid="+studentid+" ");
        rss.next();
	%>
	<tr>
	<td><%=rss.getInt("sid") %></td>
	<td><%=rss.getString("sname") %></td>
	<td><%=rss.getString("dept") %></td>
	<td><%=rs.getString("category") %></td>
	<td><%=rs.getString("reason") %></td>
	<td>&nbsp;&nbsp;&nbsp;<a style="color:black" href="a_achdelete.jsp?std=<%=rss.getInt("sid")%>&catid=<%=rs.getInt("catid")%>&achid=<%=rs.getInt("achid")%>&cat=<%=rs.getString("category")%>"><i class="fa fa-trash"></i></a>&nbsp;&nbsp;&nbsp;
	<a style="color:black" href="a_achcancel.jsp?std=<%=rss.getInt("sid")%>&achid=<%=rs.getInt("achid")%>"><i class="fa fa-ban"></i></a>
	</td>
	
<%-- 	<td><a href="seminarfiledownload.jsp?semid=<%= rs.getString("semid") %>&eve=seminar">View Certificate</a></td>
 --%>	
<%-- 	<td>
	<form method = "post" action = "aupdateseminar.jsp?semid=<%=semid%>&status=accepted">
	<input type = "submit" value = "Accept">
	</form>
	<form method = "post" action = "aupdateseminar.jsp?semid=<%=semid%>&status=declined">
	<input type = "submit" value = "Decline">
	</form>
	</td> --%>
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