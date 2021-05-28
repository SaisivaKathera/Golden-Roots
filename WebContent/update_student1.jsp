<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    
 <%!
 String d;
 %>   
    
 <%
 
 String std = (String)request.getParameter("std");
 String epid = request.getParameter("epid");
 System.out.println("decline "+epid);
 Connection con = null;
 Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");

Statement s1 = con.createStatement();
 String a = "declined";
 s1.executeUpdate("update editsprofile set progress = '"+a+"' where epid = "+epid+"");
 response.sendRedirect("a_profileedit.jsp");
 
 
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