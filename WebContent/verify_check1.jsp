<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
    
<%
String date = request.getParameter("todate");
System.out.println(date);

Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();
s.executeUpdate("update verification_check set todate= '"+date+"' where vid = 1");
Statement s1 = con.createStatement();
s1.executeUpdate("insert into verification_log(fdate,tdate) values('"+java.time.LocalDate.now()+"','"+date+"')");

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