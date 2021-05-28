<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*,java.io.*,javax.servlet.http.*,javax.servlet.*" %>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
    
  

<%

String sid = request.getParameter("sid");
String event = request.getParameter("eve");


Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();

Statement s1 = con.createStatement();
ResultSet rs = s1.executeQuery("select * from student where sid = "+sid+" ");
rs.next();
String b = rs.getString("dept");
if(event.equals("seminar") || event.equals("workshop")){
String category =  request.getParameter("category");
String aname = request.getParameter("aname");
String fdate =  request.getParameter("fdate");
String tdate =  request.getParameter("tdate");
String ob = request.getParameter("ob");
String loc =  request.getParameter("loc");

Part filePart = request.getPart("pdf");  // html form field name - pfile

InputStream pdfFileBytes = null;

if (filePart != null) {
    pdfFileBytes = filePart.getInputStream();
}
/* pdfFileBytes = filePart.getInputStream();  */ // to get the body of the request as binary data
byte[] bytes = new byte[pdfFileBytes.available()];
pdfFileBytes.read(bytes); 


s.executeUpdate("insert into "+event+"(sid,category,name,fromd,tod,orgby,loc,branch,pdf) values("+sid+",'"+category+"','"+aname+"','"+fdate+"','"+tdate+"','"+ob+"','"+loc+"','"+b+"',"+bytes+")");
}
else if(event.equals("webinar")){
	String category =  request.getParameter("category");
	String aname = request.getParameter("aname");
	String fdate =  request.getParameter("fdate");
	String tdate =  request.getParameter("tdate");
	String ob = request.getParameter("ob");

	s.executeUpdate("insert into webinar(sid,category,name,fromd,tod,orgby) values("+sid+",'"+category+"','"+aname+"','"+fdate+"','"+tdate+"','"+ob+"')");
}else if(event.equals("hackathon")){
	String domain =  request.getParameter("domain");
	String fdate =  request.getParameter("fdate");
	String tdate =  request.getParameter("tdate");
	String ob = request.getParameter("ob");
	String nmt = request.getParameter("nmt");
	String cont = request.getParameter("contribution");
	

	s.executeUpdate("insert into "+event+"(sid,domain,fromd,tod,orgby,nmt,contribution) values("+sid+",'"+domain+"','"+fdate+"','"+tdate+"','"+ob+"',"+nmt+",'"+cont+"')");
}else if(event.equals("onlinequiz") || event.equals("globalchallenge")){
	String category =  request.getParameter("category");
	String aname = request.getParameter("aname");
	String fdate =  request.getParameter("fdate");
	String tdate =  request.getParameter("tdate");
	String certify = request.getParameter("type");

	s.executeUpdate("insert into "+event+"(sid,category,name,fromd,tod,certify) values("+sid+",'"+category+"','"+aname+"','"+fdate+"','"+tdate+"','"+certify+"')");
}else if(event.equals("globalcertification")){
	String category =  request.getParameter("category");
	String aname = request.getParameter("aname");
	String cid = request.getParameter("cid");
	String fdate =  request.getParameter("fdate");

	s.executeUpdate("insert into "+event+"(sid,category,name,cid,fromd) values("+sid+",'"+category+"','"+aname+"','"+cid+"','"+fdate+"')");
}else if(event.equals("publication")){
	String domain =  request.getParameter("domain");
	String pubat = request.getParameter("pubat");
	String fdate =  request.getParameter("fdate");
	String research =  request.getParameter("research");
	String guider = request.getParameter("guider");
	String scopus =  request.getParameter("scopus");

	s.executeUpdate("insert into "+event+"(sid,domain,pubat,fromd,research,guider,scopus) values("+sid+",'"+domain+"','"+pubat+"','"+fdate+"','"+research+"','"+guider+"','"+scopus+"')");
}


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