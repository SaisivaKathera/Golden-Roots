<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"  %>

<%!
int n;
%>  
<%
String std = request.getParameter("sid");
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
System.out.println(n);
%>  


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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

.formr {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  position: relative;
  width:600px;
  }


.dropbtn {
  background-color: #171717;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #171717;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color:#171717;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #171717;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #171717;}
.btn {
  background-color: grey; /* Blue background */
  border: none; /* Remove borders */
  color: white; /* White text */
  padding: 12px 16px; /* Some padding */
  font-size: 16px; /* Set a font size */
  cursor: pointer; /* Mouse pointer on hover */
}

/* Darker background on mouse-over */
.btn:hover {
  background-color: #171717;
}

.sidenav {
  height: 100%; /* 100% Full-height */
  width: 0; /* 0 width - change this with JavaScript */
  position: fixed; /* Stay in place */
  z-index: 1; /* Stay on top */
  top: 0; /* Stay at the top */
  left: 0;
  background-color: #111; /* Black*/
  overflow-x: hidden; /* Disable horizontal scroll */
  padding-top: 60px; /* Place content 60px from the top */
  transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover {
  color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

/* Style page content - use this if you want to push the page content to the right when you open the side navigation */
#main {
  transition: margin-left .5s;
  padding: 20px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>
<script type="text/javascript">
function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}

	/* Set the width of the side navigation to 0 */
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}

</script>



<meta charset="ISO-8859-1">
<title>Student Home</title>
</head>
<body bgcolor="grey">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="adminhome.jsp">Home</a>
  <!-- <a href="">Profile</a>
  <div class="dropdown">
  <a class="dropbtn">Student</a>
  <div class="dropdown-content">
    <a href="#">Add</a>
    <a href="#">Delete</a>
    <a href="#">View</a>
  </div>
</div> -->
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <!-- <a href="logout.jsp">Logout</a> -->
</div>

<!-- Use any element to open the sidenav -->
<span onclick="openNav()"><button class="btn"><i class="fa fa-home"></i></button></span>


<br><br>

<center>
<div class = "formr">

<form method = "post" action = "addsintable.jsp" name = "login_form">
<input type = "text" placeholder = "Category" name = "category" required><br><br>
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


</center>

<br><br><br>
<hr><br>





<%
if(n == 0){
	%>
	<center><h3>NO records found !!</h3></center>
	<%
}else{
	%>
	<center>
	<h3> Previous Records: </h3>
	
	<table border="1" id = "customers">
	<tr>

	<th>Category</th>
	<th>Name</th>
	<th>From Date</th>
	<th>To Date</th>
	<th>Organized by</th>
	<th>Location</th>
	</tr>
	<%
	while(rs.next())
	{
	%>
	<tr>
	<td><%=rs.getString("category") %></td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getDate("fromd") %></td>
	<td><%=rs.getDate("tod") %></td>
	<td><%=rs.getString("orgby") %></td>
	<td><%=rs.getString("loc") %></td>
	</tr>
	
	
	<%
	}
	%>
	</table></center>
	
	
	
	<%
}
%>

















</body>
</html>