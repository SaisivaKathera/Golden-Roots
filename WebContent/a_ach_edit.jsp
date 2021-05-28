<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    
    
 <%
 String std = (String)request.getParameter("std");
 String epid = request.getParameter("epid");
 System.out.println(epid);
 Connection con = null;
 Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
 Statement s = con.createStatement();
 ResultSet rs = s.executeQuery("select * from student where sid="+std+"");
 rs.next();
 Statement s0 = con.createStatement();
 ResultSet rs0 = s0.executeQuery("select * from editsprofile where epid="+epid+"");
 rs0.next();
 
 %>  
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet"><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css'>

    <!--Only for demo purpose - no need to add.-->
    <link rel="stylesheet" href="css/demo.css" />
    
	    <link rel="stylesheet" href="css/style.css">
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
  /* background-color: grey; */ /* Blue background */
  border: none; /* Remove borders */
  color: white; /* White text */
  padding: 12px 16px; /* Some padding */
  font-size: 16px; /* Set a font size */
  cursor: pointer; /* Mouse pointer on hover */
} 

/* Darker background on mouse-over */
/* .btn:hover {
  background-color: #171717;
} */

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
.inset {
    color: #444444;
    text-shadow: -1px -1px 1px #000, 1px 1px 1px #ccc;
    font-size: 40px;
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

<a class="btn" href="a_profileedit.jsp"><i class="fa fa-home"></i></a>
<center>
<h2 class = "inset">UPDATE DETAILS</h2><hr>

<div class = "formr">

<form method = "post" action = "update_student.jsp?epid=<%= rs0.getInt("epid") %>" name = "login_form">
<label for="sid">Student Id</label>
<input type = "text" value = "<%= rs.getInt("sid") %>" name = "sid" required><br><br>
<label for="sname">Student Name</label>
<input type = "text" value = "<%= rs.getString("sname") %>" name = "sname" required><br><br>
<label for="gender">Student Gender</label>
<input type = "text" value = "<%= rs.getString("gender") %>" name = "gender" required><br><br>
<label for="mail">Student Mail</label>
<input type = "text" value = "<%= rs.getString("mail") %>" name = "mail" required><br><br>
<label for="dept">Student Branch</label>
<input type = "text" value = "<%= rs.getString("dept") %>" name = "dept" required><br><br>
<label for="prgm">Student Program</label>
<input type = "text" value = "<%= rs.getString("program") %>" name = "prgm" required><br><br>
<label for="year">Student Year</label>
<input type = "text" value = "<%= rs.getString("year") %>" name = "year" required><br><br>
<label for="sem">Student Sem</label>
<input type = "text" value = "<%= rs.getInt("sem") %>" name = "sem" required><br><br>
<label for="mobile">Student Mobile</label>
<input type = "text" value = "<%= rs.getString("mobile") %>" name = "mobile" required><br><br>



<input type = "submit" value = "Update Student">
</form>
<form method="post" action="update_student1.jsp?epid=<%= rs0.getInt("epid") %>"><input type = "submit" value = "Decline"></form>
</div>
<br><br>

<div class="card-body pt-0">
            <table class="table table-bordered">
              <tr>
                <th width="30%">Detail</th>
                <td width="2%">:</td>
                <td><%=rs0.getString("detail")%></td>
              </tr>
              <tr>
                <th width="30%">Value</th>
                <td width="2%">:</td>
                <td><%=rs0.getString("cvalue")%></td>
              </tr>
               <tr>
                <th width="30%">Reason</th>
                <td width="2%">:</td>
                <td><%=rs0.getString("reason")%></td>
              </tr>
            </table>
          </div>
</center>


<div bgcolor="white">




</div>



</body>
</html>