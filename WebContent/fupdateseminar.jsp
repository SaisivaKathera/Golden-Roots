<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" %>
    
 <%
String semid = request.getParameter("semid");
String status = request.getParameter("status");
String eve = request.getParameter("eve");
 Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
	Statement s = con.createStatement();
	s.executeUpdate("update "+eve+" set status = '"+status+"' where semid = "+semid+" ");
	Statement s1 = con.createStatement();
	s1.executeUpdate("update "+eve+" set statusdate = '"+java.time.LocalDate.now()+"' where semid = "+semid+" ");
	response.sendRedirect("f"+eve+".jsp");
 
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