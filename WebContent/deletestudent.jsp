<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "java.sql.*" %>
    
    
    
<%
String sid = request.getParameter("did");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();
s.executeUpdate("delete from student where sid = "+sid+"");
Statement s1 = con.createStatement();
s1.executeUpdate("delete from seminar where sid = "+sid+"");
Statement s2 = con.createStatement();
s2.executeUpdate("delete from webinar where sid = "+sid+"");
Statement s3 = con.createStatement();
s3.executeUpdate("delete from workshop where sid = "+sid+"");
Statement s4 = con.createStatement();
s4.executeUpdate("delete from hackathon where sid = "+sid+"");
Statement s5 = con.createStatement();
s5.executeUpdate("delete from onlinequiz where sid = "+sid+"");
Statement s6 = con.createStatement();
s6.executeUpdate("delete from globalchallenge where sid = "+sid+"");
Statement s7 = con.createStatement();
s7.executeUpdate("delete from globalcertification where sid = "+sid+"");
Statement s8 = con.createStatement();
s8.executeUpdate("delete from publication where sid = "+sid+"");
/*Statement s9 = con.createStatement();
s9.executeUpdate("delete from student where sid = "+sid+"");  */

response.sendRedirect("adminhome.jsp");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>