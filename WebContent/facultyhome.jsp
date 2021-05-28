<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"  %>
    
    
 <%

 String std = (String)session.getAttribute("uname");
 Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
	
	Statement s2 = con.createStatement();
	ResultSet rs2 = s2.executeQuery("select * from verification_check where vid = 1");
	rs2.next();

 %>  
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">


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
<title>Faculty Home</title>
</head>
<body bgcolor="grey">
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="fprofile.jsp">Profile</a>
  <a href="facultyupdatepassword.jsp">Change Password</a>
  <br>
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
  <a href="logout.jsp">Logout</a>
</div>

<!-- Use any element to open the sidenav -->
<span onclick="openNav()"><button class="btn"><i class="fa fa-home"></i></button></span>



<%
if(rs2.getString("verify").equals("true")){
%>
<marquee behavior="scroll" direction="left" style="background-color:white">Achievements are now open to verify till <%=rs2.getDate("todate")%>!!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Achievements are now open to upload till <%=rs2.getDate("todate")%>!!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</marquee>
<%
}
%>



<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
<div id="main"></div>
<ol class="articles">
  <li class="articles__article" style="--animation-order:1"><a href="fseminar.jsp?sid=<%=std%>" class="articles__link">
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
       <li class="articles__article" style="--animation-order:1"><a href="fwebinar.jsp?sid=<%=std%>" class="articles__link">
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
       <li class="articles__article" style="--animation-order:1"><a href="fworkshop.jsp?sid=<%=std%>" class="articles__link">
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
      <li class="articles__article" style="--animation-order:1"><a href="fhackathon.jsp?sid=<%=std%>" class="articles__link">
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
      <li class="articles__article" style="--animation-order:1"><a href="fonlinequiz.jsp?sid=<%=std%>" class="articles__link">
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
      <li class="articles__article" style="--animation-order:1"><a href="fglobalchallenge.jsp?sid=<%=std%>" class="articles__link">
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
      <li class="articles__article" style="--animation-order:1"><a href="fglobalcertification.jsp?sid=<%=std%>" class="articles__link">
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
      <li class="articles__article" style="--animation-order:1"><a href="fpublication.jsp?sid=<%=std%>" class="articles__link">
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