<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<%
try{
	String name=request.getParameter("uname");
	String password=request.getParameter("psw");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/infosysapp", "root", "root");
	PreparedStatement ps=con.prepareStatement("SELECT *FROM users WHERE name=? AND password=?");
	ps.setString(1, name);
	ps.setString(2, password);
	
	ResultSet rs=ps.executeQuery();
	
	if(rs.next()){
		response.sendRedirect("welcome.jsp");
	}
	else{
		out.print("Invalid username or password.Please try again");
	}
}
	catch(Exception ex){
		out.print(ex);
	}
%>


