<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import= "java.sql.*" %>
    
    
    
<%
String sid = request.getParameter("did");
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();
s.executeUpdate("delete from student where fid = "+sid+"");

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