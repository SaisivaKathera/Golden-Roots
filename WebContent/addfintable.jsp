<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"  %>
    
    
    
    
    
<%
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();

String fid = request.getParameter("fid");
String fname =  request.getParameter("fname");
String gender = request.getParameter("gender");
String mail =  request.getParameter("mail");
String dept =  request.getParameter("dept");
String qual =  request.getParameter("qual");
String mobile =  request.getParameter("mobile");
String desig =  request.getParameter("desig");
s.executeUpdate("insert into faculty values("+fid+",'"+fname+"','"+qual+"','"+mail+"','"+mobile+"','"+dept+"','"+gender+"',default,default,'"+desig+"')");
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