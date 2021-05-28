<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>
    
    
 <%
 String std = (String)session.getAttribute("uname");
    Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select count(*) from student");
	rs.next();
	Statement s1 = con.createStatement();
	ResultSet rs1 = s1.executeQuery("select count(*) from faculty");
	rs1.next();
	Statement s2 = con.createStatement();
	ResultSet rs2 = s2.executeQuery("select * from upload_check where uid = 1");
	rs2.next();
	if(rs2.getString("uploads").equals("true")){
		String fal = "false"; 
		Statement s3 = con.createStatement();
		s3.executeUpdate("update upload_check set uploads = '"+fal+"' where todate < '"+java.time.LocalDate.now()+"' or fromdate > '"+java.time.LocalDate.now()+"' and uid=1 ");
		/* Statement s21 = con.createStatement();
		s21.executeUpdate("update upload_check set uploads = '"+fal+"' where fromdate >= '"+java.time.LocalDate.now()+"' and uid=1 "); */
		
	}else if(rs2.getString("uploads").equals("false")){
		String tru = "true"; 
		Statement s9 = con.createStatement();
		s9.executeUpdate("update upload_check set uploads = '"+tru+"' where fromdate <= '"+java.time.LocalDate.now()+"' and todate >= '"+java.time.LocalDate.now()+"' and uid=1 ");
		/* Statement s91 = con.createStatement();
		s91.executeUpdate("update upload_check set uploads = '"+tru+"' where todate >= '"+java.time.LocalDate.now()+"' and uid=1 "); */
	}
	Statement s4 = con.createStatement();
	ResultSet rs4 = s4.executeQuery("select * from verification_check where vid = 1");
	rs4.next();
	if(rs4.getString("verify").equals("true")){
		String fal = "false"; 
		Statement s5 = con.createStatement();
		s5.executeUpdate("update verification_check set verify = '"+fal+"' where todate <= '"+java.time.LocalDate.now()+"' and vid=1 ");
	}
 %>  
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">

.dropbtn {
  background-color: #111111;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}
.lop{
  background-color:#171717;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
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
.sidenav a,.lop {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover,.lop:hover {
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
.open-button {
   background-color:#171717;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
 
  right: 500px;
  
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  height:50px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
:root {
  --base-grid: 8px;
  --colour-body-background: #d84c6e;
  --colour-background: #fff;
  --colour-background-folded: #f5f5f5;
  --colour-background-stripes: rgba(255, 255, 255, 0.5);
  --colour-text: #1a1a1a;
}

*,
:after,
:before {
  box-sizing: border-box;
  margin: 0;
}

body {
  background-color: grey;
  font-family: Bitter;

}

.articles {
  margin: calc(var(--base-grid) * 2) auto calc(var(--base-grid) * 5);
  display: grid;
  grid-row-gap: calc(var(--base-grid) * 8);
  grid-column-gap: calc(var(--base-grid) * 6);
  grid-template-columns: repeat(
    auto-fit,
    minmax(calc(var(--base-grid) * 35), 1fr)
  );
  justify-items: center;
}

.articles__article {
  cursor: pointer;
  display: block;
  position: relative;
  perspective: 1000px;
  animation-name: animateIn;
  animation-duration: 0.35s;
  animation-delay: calc(var(--animation-order) * 100ms);
  animation-fill-mode: both;
  animation-timing-function: ease-in-out;
}

.articles__article:before {
  content: "";
  position: absolute;
  top: calc(var(--base-grid) * -2);
  left: calc(var(--base-grid) * -2);
  border: 2px dashed var(--colour-background);
  background-image: repeating-linear-gradient(
    -24deg,
    transparent,
    transparent 4px,
    var(--colour-background-stripes) 0,
    var(--colour-background-stripes) 5px
  );
  z-index: -1;
}

.articles__article,
.articles__article:before {
  width: calc(var(--base-grid) * 35);
  height: calc(var(--base-grid) * 35);
}

.articles__link {
  background-color: grey;
  border: 2px solid var(--colour-background);
  display: block;
  width: 100%;
  height: 100%;
}

.articles__link:after {
  content: "";
  position: absolute;
  top: 50%;
  right: calc(var(--base-grid) * 3);
  width: calc(var(--base-grid) * 2);
  height: calc(var(--base-grid) * 2);
  margin-top: calc(var(--base-grid) * -1);
  clip-path: polygon(75% 0, 100% 50%, 75% 100%, 0 100%, 25% 50%, 0 0);
  -webkit-clip-path: polygon(75% 0, 100% 50%, 75% 100%, 0 100%, 25% 50%, 0 0);
  background-color: var(--colour-background);
  opacity: 0;
  transition: opacity 0.5s ease-in, transform 0.3s ease-in-out 0ms;
}

.articles__content {
  background-color: var(--colour-background);
  color: var(--colour-text);
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  padding: calc(var(--base-grid) * 2);
  display: flex;
  flex-direction: column;
  border: 2px solid var(--colour-background);
}

.articles__content--lhs {
  clip-path: polygon(0 0, 51% 0, 51% 100%, 0 100%);
  -webkit-clip-path: polygon(0 0, 51% 0, 51% 100%, 0 100%);
}

.articles__content--rhs {
  clip-path: polygon(50% 0, 100% 0, 100% 100%, 50% 100%);
  -webkit-clip-path: polygon(50% 0, 100% 0, 100% 100%, 50% 100%);
  transition: transform 0.5s ease-in-out, background-color 0.4s ease-in-out;
}

.articles__title {
  font-size: calc(var(--base-grid) * 4);
  line-height: 1.125;
  font-weight: 700;
  letter-spacing: -0.02em;
}

.articles__footer {
  margin-top: auto;
  font-size: calc(var(--base-grid) * 2);
  line-height: calc(var(--base-grid) * 2);
  display: flex;
  justify-content: space-between;
}

.articles__link:hover .articles__content--rhs {
  background-color: var(--colour-background-folded);
  transform: rotateY(-50deg);
}

.articles__link:hover:after {
  opacity: 1;
  transform: translateX(calc(var(--base-grid) * 1.5));
  transition: opacity 0.5s ease-in, transform 0.3s ease-in-out 0.25s;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  background-color: white;
  width: 20%;
  height: 50px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}

/* toggle */
.switch {
  position: relative;
  display: inline-block;
  width: 90px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ca2222;
  -webkit-transition: .4s;
  transition: .4s;
   border-radius: 34px;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
  border-radius: 50%;
}

input:checked + .slider {
  background-color: #2ab934;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(55px);
}

/*------ ADDED CSS ---------*/
.slider:after
{
 content:'OFF';
 color: white;
 display: block;
 position: absolute;
 transform: translate(-50%,-50%);
 top: 50%;
 left: 50%;
 font-size: 10px;
 font-family: Verdana, sans-serif;
}

input:checked + .slider:after
{  
  content:'ON';
}

input[type=date], select {
  width: 100%;
  /* padding: 12px 20px; */
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
 
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

</style>
<script type="text/javascript">

const myForm = document.getElementById("myForm116");
document.querySelector(".submit").addEventListener("click", function(){

  myForm.submit();

});


function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	}

	/* Set the width of the side navigation to 0 */
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
	function openForm() {
		  document.getElementById("myForm").style.display = "block";
		}

		function closeForm() {
		  document.getElementById("myForm").style.display = "none";
		}
		function openForm1() {
			  document.getElementById("myForm1").style.display = "block";
			}

			function closeForm1() {
			  document.getElementById("myForm1").style.display = "none";
			}
</script>



<meta charset="ISO-8859-1">
<title>Admin Home</title>
</head>
<body bgcolor="grey">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="">Profile</a>
 
  <div class="dropdown">
  <a class="dropbtn">Student</a>
  <div class="dropdown-content">
    <a href="addstudent.jsp">Add</a>
    <button class = "lop" onclick="openForm()">View &<br>Delete</button>
  </div>
</div><br>
<div class="dropdown">
  <a class="dropbtn">Faculty</a>
  <div class="dropdown-content">
    <a href="addfaculty.jsp">Add</a>
    <button class = "lop" onclick="openForm1()">View &<br>Delete</button>
  </div>
</div><br>
 <div class="dropdown">
  <a class="dropbtn">Requests</a>
  <div class="dropdown-content">
    <a href="a_profileedit.jsp">Profile</a>
    <a href="a_achedit.jsp">Achievement</a>
  </div>
</div><br>
<a href="log_book.jsp">Log</a>
 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <a href="logout.jsp">Logout</a>
</div>

<!-- Use any element to open the sidenav -->
<span onclick="openNav()"><button class="btn"><i class="fa fa-home"></i></button></span>

<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
<div id="main"></div>
<div class="form-popup" id="myForm">
  <form method = "post" action="viewstudent.jsp" class="form-container">
 
    <input type="text" placeholder="Student ID" name="searchid" required>


    <button type="submit" class="btn">Search Student</button>
    <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
  </form>
</div>
<div class="form-popup" id="myForm1">
  <form method = "post" action="viewfaculty.jsp" class="form-container">
 
    <input type="text" placeholder="Faculty ID" name="searchid" required>


    <button type="submit" class="btn">Search Faculty</button>
    <button type="button" class="btn cancel" onclick="closeForm1()">Close</button>
  </form>
</div>



<center>

<%

if(rs2.getString("uploads").equals("true")){

%>
<a href="upload_check.jsp?allow=false" style="text-decoration:none">
<div class="card" style="background-color: green; height:180px;">
  <div class="container" ><br>
    <h4 style="color: white" >Student Uploads Allowed</h4>
   <br><form action="upload_check1.jsp">
<input type="date" name = "fromdate" value="<%= rs2.getDate("fromdate") %>" required>
<input type="date" name = "todate" value="<%= rs2.getDate("todate") %>" required>
<input type = "submit" value = submit >
</form> 
    
  </div> 
</div>
</a>
<br>
     



<%

}else{

%>
<a href="upload_check.jsp?allow=true" style="text-decoration:none">
<div class="card" style="background-color: darkred; height:60px;">
  <div class="container" ><br>
    <h4 style="color: white" >Student Uploads Disallowed</h4>
  </div>
</div><br>
</a>


<%

}

%>





<%

if(rs4.getString("verify").equals("true")){

%>
<a href="verify_check.jsp?allow=false" style="text-decoration:none">
<div class="card" style="background-color: green; height:140px;">
  <div class="container" ><br>
    <h4 style="color: white" >Faculty Verification Allowed</h4>
   <br> <form action="verify_check1.jsp">
<input type="date" name = "todate" value="<%= rs4.getDate("todate") %>" required>
<input type = "submit" value = submit >
</form>  
    
  </div> 
</div>
</a>
<br>
     



<%

}else{

%>



<a href="verify_check.jsp?allow=true" style="text-decoration:none">
<div class="card" style="background-color: darkred; height:60px;">
  <div class="container" ><br>
    <h4 style="color: white" >Faculty Verifictaion Disallowed</h4>
  </div>
</div><br>
</a>


<%

}

%>






<div class="card">
  <div class="container" >
    <p><img src="Student1.png" alt="Avatar" style="height:40px; width:40px"> &nbsp; Students: <%=rs.getInt(1) %> </p> 
    <p>  </p>
  </div>
</div><br>
<div class="card">
  <div class="container">
    <p><img src="faculty.png" alt="Avatar" style="height:40px; width:40px"> &nbsp;&nbsp; Faculty: <%=rs1.getInt(1) %> </p> 
  </div>
</div>

</center>
<br><br>
<ol class="articles">
  <li class="articles__article" style="--animation-order:1"><a href="aseminar.jsp?sid=<%=std%>" class="articles__link">
      <div class="articles__content articles__content--lhs">
        <br><br><br><br><br><h2 class="articles__title">Seminar</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Seminar</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
       <li class="articles__article" style="--animation-order:1"><a href="webinar.jsp?sid=<%=std%>" class="articles__link">
      <div class="articles__content articles__content--lhs"><br><br><br><br><br>
        <h2 class="articles__title">Webinar</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Webinar</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
  
       <li class="articles__article" style="--animation-order:1"><a href="workshop.jsp?sid=<%=std%>" class="articles__link">
      <div class="articles__content articles__content--lhs"><br><br><br><br><br>
        <h2 class="articles__title">Workshops</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Workshops</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
      <li class="articles__article" style="--animation-order:1"><a href="hackathon.jsp?sid=<%=std%>" class="articles__link">
      <div class="articles__content articles__content--lhs"><br><br><br><br><br>
        <h2 class="articles__title">Hackathon</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Hackathon</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
      <li class="articles__article" style="--animation-order:1"><a href="onlinequiz.jsp?sid=<%=std%>" class="articles__link">
      <div class="articles__content articles__content--lhs"><br><br><br><br><br>
        <h2 class="articles__title">Online Quiz</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Online Quiz</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
      <li class="articles__article" style="--animation-order:1"><a href="" class="articles__link">
      <div class="articles__content articles__content--lhs"><br><br><br><br><br>
        <h2 class="articles__title">Sports</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Sports</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
      <li class="articles__article" style="--animation-order:1"><a href="globalchallenge.jsp?sid=<%=std%>" class="articles__link">
      <div class="articles__content articles__content--lhs"><br><br><br><br><br>
        <h2 class="articles__title">Global Challenge</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Global Challenge</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
      <li class="articles__article" style="--animation-order:1"><a href="globalcertification.jsp?sid=<%=std%>" class="articles__link">
      <div class="articles__content articles__content--lhs"><br><br><br><br><br>
        <h2 class="articles__title">Global Certification</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Global Certification</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
      <li class="articles__article" style="--animation-order:1"><a href="publication.jsp?sid=<%=std%>" class="articles__link">
      <div class="articles__content articles__content--lhs"><br><br><br><br><br>
        <h2 class="articles__title">Publication</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true"><br><br><br><br><br>
        <h2 class="articles__title">Publication</h2>
        <div class="articles__footer">
        </div>
      </div></a></li>
      <!-- <li class="articles__article" style="--animation-order:1"><a href="" class="articles__link">
      <div class="articles__content articles__content--lhs">
        <h2 class="articles__title">Seminar</h2>
        <div class="articles__footer">
        </div>
      </div>
      <div class="articles__content articles__content--rhs" aria-hidden="true">
        <h2 class="articles__title">Seminar</h2>
        <div class="articles__footer">
        </div>
      </div></a></li> -->
  
</ol>


</body>
</html>