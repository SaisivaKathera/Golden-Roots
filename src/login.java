import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		try {
			Connection con = null;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gr","root","root");
			Statement s = con.createStatement();
			Statement s1 = con.createStatement();
			Statement s2 = con.createStatement();
			String uname = req.getParameter("uname");
			String pwd =  req.getParameter("pwd");
			System.out.println(uname+"\n"+pwd);
			String q = "select * from student where sid = "+uname+" and pwd = '"+pwd+"' ";
			ResultSet rs = s.executeQuery(q);
			String q1 = "select * from admin where aid = "+uname+" and pwd = '"+pwd+"' ";
			ResultSet rs1 = s1.executeQuery(q1);
			String q2 = "select * from faculty where fid = "+uname+" and pwd = '"+pwd+"' ";
			ResultSet rs2 = s2.executeQuery(q2);
			if(rs.next()) {
			if(rs.getInt("login") == 0) {

				HttpSession session = req.getSession();
				session.setAttribute("uname", uname);
				session.setAttribute("pwd", pwd);
				res.sendRedirect("updatepassword.jsp?log=student");	
			
				
			}
			else {
				HttpSession session = req.getSession();
				session.setAttribute("uname", uname);
				res.sendRedirect("studenthome.jsp");
			}
			}
			else if(rs2.next()) {
				if(rs2.getInt("login") == 0) {

					HttpSession session = req.getSession();
					session.setAttribute("uname", uname);
					session.setAttribute("pwd", pwd);
					res.sendRedirect("updatepassword.jsp?log=faculty");	
				
					
				}
				else {
					HttpSession session = req.getSession();
					session.setAttribute("uname", uname);
					res.sendRedirect("facultyhome.jsp");
				}
			}
			

			 else if(rs1.next()) { HttpSession session = req.getSession();
			 session.setAttribute("uname", uname); res.sendRedirect("adminhome.jsp"); }
			 
		     else {
				RequestDispatcher rd = req.getRequestDispatcher("login.html");
				out.println("<center><h1>Invalid Login!!</h1></center>");
				rd.include(req, res);
			}
			
		
		} catch (Exception e) {e.printStackTrace();} 
		
	}
}
