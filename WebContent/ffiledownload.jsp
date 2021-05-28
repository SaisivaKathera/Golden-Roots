<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*,java.io.*,javax.servlet.http.*,javax.servlet.*" %>


<%
     final int BUFFER_SIZE = 4096;   
       response.setContentType("APPLICATION/OCTET-STREAM");    
       String std = (String)session.getAttribute("uname");
       
       String goalid = request.getParameter("semid");
       String eve = request.getParameter("eve");
       System.out.println(std+" "+eve+" "+goalid);
   String filename = std+".pdf";
   response.setHeader("Content-Disposition","attachment;filename=\"" + filename + "\"");

       
       try
       {
    	   Connection con = null;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
           String sql = "SELECT * FROM "+eve+" WHERE semid = '"+goalid+"'";
           Statement s = con.createStatement();
           ResultSet rs  = s.executeQuery(sql);
           
           if(rs.next())
           {
        	   
        	   System.out.println(rs.getString("loc"));
               Blob blob = rs.getBlob("pdf");
               InputStream inputstream  = blob.getBinaryStream();
               int fileLength = inputstream.available();
           
               System.out.println(fileLength);

              
               OutputStream outStream = response.getOutputStream();
               
               byte[] buffer = new byte[BUFFER_SIZE];
               
               
               int bytesRead = -1;
                 
                while ((bytesRead = inputstream.read(buffer)) != -1) 
                {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputstream.close();
                outStream.close();     

           }
           
           else
           {
              out.println("download error");
           }
           
           
           
       }
       catch(SQLException e)
       {
           response.getWriter().print("SQL Error: " + e.getMessage());
       }
       
        response.sendRedirect("f"+eve+".jsp");
       
%>