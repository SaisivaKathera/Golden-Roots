<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"  %>
<!DOCTYPE html>

<%
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();

String sid = request.getParameter("sid");
String sname =  request.getParameter("sname");
String gender = request.getParameter("gender");
String mail =  request.getParameter("mail");
String dept =  request.getParameter("dept");
String prgm = request.getParameter("prgm");
String year =  request.getParameter("year");
String sem =  request.getParameter("sem");
String mobile =  request.getParameter("mobile");
s.executeUpdate("insert into student values("+sid+",'"+sname+"','"+gender+"','"+mail+"','"+dept+"','"+prgm+"','"+year+"',"+sem+",'"+mobile+"',default,default)");
response.sendRedirect("adminhome.jsp");
%>    
    

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>