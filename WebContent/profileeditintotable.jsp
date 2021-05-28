<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"   %>
    
    
    
 <%
 String uname = (String)session.getAttribute("uname");
 Connection con = null;
 Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
 Statement s = con.createStatement();
String detail = request.getParameter("detail");
if(detail.equals("null")){
	response.sendRedirect("studenthome.jsp");
}
String value = request.getParameter("value");
String reason = request.getParameter("reason");
 s.executeUpdate("insert into editsprofile(sid,detail,cvalue,reason) values('"+uname+"','"+detail+"','"+value+"','"+reason+"')");
 
 response.sendRedirect("studenthome.jsp");
 
 
 
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