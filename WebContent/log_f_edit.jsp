<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "java.sql.*" %>
    
<%
String std = (String)session.getAttribute("uname");
/* String std = request.getParameter("sid"); */
String utdate = request.getParameter("utdate");
System.out.println(std);
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");

Statement s1 = con.createStatement();
ResultSet rs1 = s1.executeQuery("select * from verification_log ");
rs1.last();
Statement s = con.createStatement();
s.executeUpdate("update verification_check set todate ='"+utdate+"' ");
Statement s3 = con.createStatement();
s3.executeUpdate("update verification_log set utdate ='"+utdate+"' where vlid = "+rs1.getInt("vlid")+"");


response.sendRedirect("log_book.jsp");
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

<!-- 
Statement s1 = con.createStatement();
ResultSet rs1 = s1.executeQuery("select * from uploads_log where tdate = '"+rs.getDate("todate")+"' ");
rs1.next();
Statement s2 = con.createStatement();
s2.executeUpdate("update uploads_log set utdate ='"+rs.getDate("todate")+"' where tdate = '"+rs.getDate("todate")+"' ");
Statement s3 = con.createStatement();
s3.executeUpdate("update upload_check set todate ='"+utdate+"' where todate = '"+rs.getDate("todate")+"' ");


 -->
