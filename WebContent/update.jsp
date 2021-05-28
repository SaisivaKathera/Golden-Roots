<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"  %>
    
    
    
<%
String cpwd = request.getParameter("cpwd");
String npwd = request.getParameter("npwd");
String std = request.getParameter("sid");
String log = request.getParameter("log");
System.out.println(cpwd+"\n"+npwd+"\n"+std);
String id;
if(log.equals("faculty")) id = "fid";
else id = "sid";
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement( );
String q = "select * from "+log+" where "+id+" = "+std+"";
ResultSet rs = s.executeQuery(q);
rs.next();
System.out.println(rs.getString("pwd"));
System.out.println("yes1");

if((rs.getString("pwd")).equals(cpwd)){
	System.out.println("Yes2");
	Statement s1 = con.createStatement( );
	s1.executeUpdate("update "+log+" set pwd = '"+npwd+"' where "+id+" = '"+std+"'");
	Statement s2 = con.createStatement( );
	s1.executeUpdate("update "+log+" set login = 1 where "+id+" = '"+std+"'");
	if(log.equals("faculty")) response.sendRedirect("facultyhome.jsp");
	else response.sendRedirect("studenthome.jsp");
}else{	
	response.sendRedirect("updatepassword.jsp");
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