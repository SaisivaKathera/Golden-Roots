<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
    
    
<%
String tdate = request.getParameter("todate");
String fdate = request.getParameter("fromdate");


Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();
s.executeUpdate("update upload_check set todate= '"+tdate+"' where uid = 1");
Statement s2 = con.createStatement();
s2.executeUpdate("update upload_check set fromdate= '"+fdate+"' where uid = 1");
Statement s1 = con.createStatement();
s1.executeUpdate("insert into uploads_log(fdate,tdate) values('"+fdate+"','"+tdate+"')");


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