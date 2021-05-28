<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    
 <%!
 String d;
 %>   
    
 <%
 
 String std = (String)request.getParameter("std");
 String epid = request.getParameter("epid");
 System.out.println(epid);
 Connection con = null;
 Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");

 Statement s = con.createStatement();
 ResultSet rs = s.executeQuery("select * from editsprofile where epid = "+epid+"");
 rs.next();
 if(rs.getString("detail").equals("Year")){
	 d = "year";
 }
 else if(rs.getString("detail").equals("Sem")){
	 d = "sem";
 }
else if(rs.getString("detail").equals("Branch")){
	d = "dept";
 }
else if(rs.getString("detail").equals("Gender")){
	d = "gender";
}
else if(rs.getString("detail").equals("Mail")){
	d = "mail";
}
else if(rs.getString("detail").equals("Mobile")){
	d = "mobile";
}
 
 int id = rs.getInt("sid");
 String cvalue = rs.getString("cvalue");
 Statement s0 = con.createStatement();
 s0.executeUpdate("update student set "+d+" = '"+cvalue+"' where sid = "+id+"");
 Statement s1 = con.createStatement();
 String a = "accepted";
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