import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BalanceCode
 */
@WebServlet("/BalanceCode")
public class BalanceCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BalanceCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		int account_no=Integer.parseInt(request.getParameter("ac_no"));
		String name=request.getParameter("ac_name");
		String password=request.getParameter("psw");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapp", "root", "root");
			PreparedStatement  ps=con.prepareStatement("select * from account where account_no=? and name=? and password=?");
			ps.setInt(1, account_no);
			ps.setString(2, name);
			ps.setString(3, password);
			ResultSet rs=ps.executeQuery();
			ResultSetMetaData rss=rs.getMetaData();
			int n=rss.getColumnCount();//count the no of coumns in the table n=5
			out.print("<table border='1'>");
			
			for(int i=1; i<=n; i++) 
				out.println("<td><font color=blue size=3"+"<br>"+rss.getColumnName(i));
			out.println("<tr>");
			while(rs.next()) {
				for(int i=1; i<=n; i++)
					
					out.println("<td><br>"+rs.getString(i));
				out.println("<tr>");
				
				
			}
			out.println("</table>");
			con.close();
				
			
		}
		catch(Exception ex) {
			out.print(ex);		
		}
		
	}

}
