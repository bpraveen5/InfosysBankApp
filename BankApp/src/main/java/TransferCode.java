import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TransferCode
 */
@WebServlet("/TransferCode")
public class TransferCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransferCode() {
        super();
        // TODO Auto-generated constructor stu
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
				int t_accountno=Integer.parseInt(request.getParameter("tac_no"));
				double transfer_amount=Double.parseDouble(request.getParameter("t_amount"));
		try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapp", "root", "root");
				PreparedStatement ps1=con.prepareStatement("select *from account where account_no=? and name=? and password=?");
				ps1.setInt(1, account_no);
				ps1.setString(2, name);
				ps1.setString(3, password);
				
				ResultSet rs1=ps1.executeQuery();
				double amount=0.0;
				PreparedStatement ps2=con.prepareStatement("select *from account  where account_no=?");
				ps2.setInt(1, t_accountno);
				ResultSet rs2=ps2.executeQuery();
				if(rs2.next()) {
					 double transfergadiamount = rs2.getDouble(4);
					 if(rs1.next()) {
						 amount=rs1.getDouble(4);
						 out.print("Before sending the money the amount is "+amount+"<br>");
							if(amount>transfer_amount) {
								amount =amount-transfer_amount;
								out.print("Sending the money is:"+transfer_amount+"<br>");
								out.print("After the Sending money is:"+amount+"<br>");
								PreparedStatement ps3=con.prepareStatement("update account set amount=? where account_no=?");
								ps3.setDouble(1, amount);
								ps3.setInt(2, account_no);
								int i=ps3.executeUpdate();
								out.print("Before receiving the money the amount is "+transfergadiamount+"<br>");
								transfergadiamount=transfergadiamount+transfer_amount;
								PreparedStatement ps4=con.prepareStatement("update account set amount=? where account_no=?");
								ps4.setDouble(1, transfergadiamount);
								ps4.setInt(2, t_accountno);
								ps4.executeUpdate();
								out.print("After recieving the money the amount is "+transfergadiamount+"<br>");
							}
							else {
								out.print("no sufficient money in your account");
							}
					 }
					
				else {
					out.print("ENter correct details of the user...........");
				}
			}
			else {
				if(rs1.next()) {
					amount=rs1.getDouble(4);
					out.print("Before sending the money the amount is "+amount+"<br>");
					if(amount>transfer_amount) {
						amount=amount-transfer_amount;
						out.print("sending the money is "+transfer_amount+"<br>");
						out.print("After sending the money the amount is "+amount+"<br>");
						PreparedStatement ps3=con.prepareStatement("update account set amount=? where account_no=?");
						ps3.setDouble(1, amount);
						ps3.setInt(2, account_no);
						ps3.executeUpdate();
					}
					else {
						out.print("no sufficent money in your account");
					}
				}
				else {
					out.print("Enter correct details of the user.........");
				}
			}
			con.close();
			}
		catch(Exception ex) {
			out.print(ex);
		}

	}
}
