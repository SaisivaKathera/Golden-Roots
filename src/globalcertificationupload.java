

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@MultipartConfig(maxFileSize = 16177215)
 @WebServlet("/certificationup")
public class globalcertificationupload extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

String sid = request.getParameter("sid");

System.out.println(sid);
		try {
			

Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
Statement s = con.createStatement();

Statement s1 = con.createStatement();
ResultSet rs = s1.executeQuery("select * from student where sid = "+sid+" ");
rs.next();
String b = rs.getString("dept");

String category =  request.getParameter("category");

String cid = request.getParameter("cid");
String fdate =  request.getParameter("fdate");
			
			Part filePart = request.getPart("pdf");  // html form field name - pfile
	        InputStream pdfFileBytes = null;
	        
	        HttpSession session=request.getSession(false);
	        pdfFileBytes = filePart.getInputStream();  // to get the body of the request as binary data
	        System.out.println(pdfFileBytes.available());
	        byte[] bytes = new byte[pdfFileBytes.available()];
	        pdfFileBytes.read(bytes);  //Storing the binary data in bytes array.
	   //     s.executeUpdate("insert into seminar(sid,category,name,fromd,tod,orgby,loc,branch,pdf) values("+sid+",'"+category+"','"+aname+"','"+fdate+"','"+tdate+"','"+ob+"','"+loc+"','"+b+"',"+bytes+")");
	        PreparedStatement statement = null;
	         String sql = " insert into globalcertification(sid,category,cid,fromd,branch,pdf) values(?,?,?,?,?,?)  ";
	         statement = con.prepareStatement(sql);
	            
	          statement.setString(1, sid);
	          statement.setString(2, category);
	          statement.setString(3, cid);
	          statement.setString(4,fdate);
	    
	          statement.setString(5, b);
	          statement.setBytes(6,bytes);  
	          statement.executeUpdate();
		} catch (Exception e) {e.printStackTrace();} 
		response.sendRedirect("studenthome.jsp");
	}
}
