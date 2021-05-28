<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    
 <%!
 String d;
 %>   
    
 <%
 
 String std = (String)request.getParameter("std");
 String achid = request.getParameter("achid");
 System.out.println(achid);
 Connection con = null;
 Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");


 Statement s1 = con.createStatement();
 String a = "declined";
 s1.executeUpdate("update editsach set progress = '"+a+"' where achid = "+achid+"");
 response.sendRedirect("a_achedit.jsp");
 
 
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