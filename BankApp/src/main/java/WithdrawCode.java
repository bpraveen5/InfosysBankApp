import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WithdrawCode
 */
@WebServlet("/WithdrawCode")
public class WithdrawCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WithdrawCode() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		try {
				int account_no=Integer.parseInt(request.getParameter("ac_no"));
				String name=request.getParameter("ac_name");
				String password=request.getParameter("psw");
				double withdraw_amount=Double.parseDouble(request.getParameter("withdrawamount"));
		
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapp", "root", "root");
				PreparedStatement ps1=con.prepareStatement("select *from account where account_no=? and name=? and password=?");
				ps1.setInt(1, account_no);
				ps1.setString(2, name);
				ps1.setString(3, password);
				
				ResultSet rs=ps1.executeQuery();
				double amount=0.0;
				if(rs.next()) {
					amount=rs.getDouble(4);
				}
				out.println("Before Deposit My Account Balance is="+amount+"<br>");
				out.println("My Deposit Amount is=" +withdraw_amount+"<br>");
				amount=amount - withdraw_amount;
				PreparedStatement ps2=con.prepareStatement("update account set amount=? where account_no=?");
				ps2.setDouble(1, amount);
				ps2.setInt(2, account_no);
				ps2.executeUpdate();
				out.print("After Deposit My Account Balance is="+amount);
				con.close();
		    }
			catch(Exception ex) {
				out.print(ex);
		
	      }
	}

}
