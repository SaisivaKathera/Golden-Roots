<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"  %>
    
    
    
<%
String cpwd = request.getParameter("cpwd");
String npwd = request.getParameter("npwd");
String std = request.getParameter("sid");
System.out.println(cpwd+"\n"+npwd+"\n"+std);
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement( );
String q = "select * from student where sid = "+std+"";
ResultSet rs = s.executeQuery(q);
rs.next();
System.out.println(rs.getString("pwd"));
System.out.println("yes1");
if((rs.getString("pwd")).equals(cpwd)){
	System.out.println("Yes2");
	Statement s1 = con.createStatement( );
	s1.executeUpdate("update student set pwd = '"+npwd+"' where sid = '"+std+"'");
	Statement s2 = con.createStatement( );
	s1.executeUpdate("update student set login = 1 where sid = '"+std+"'");
	response.sendRedirect("studenthome.jsp");
}else{	
	response.sendRedirect("homeupdatepassword.jsp");
}



%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Password</title>
</head>
<body>

</body>
</html>