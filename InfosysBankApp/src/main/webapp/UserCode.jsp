<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>    
<%
try{
	String name=request.getParameter("uname");
	String password=request.getParameter("psw");
	String email=request.getParameter("email");
	String gender=request.getParameter("Gender");
	String address=request.getParameter("adrs");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/infosysapp", "root", "root");
	
	PreparedStatement ps=con.prepareStatement("insert into users (name,password, email, gender, address)values(?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, password);
	ps.setString(3, email);
	ps.setString(4, gender);
	ps.setString(5, address);
	
	int i = ps.executeUpdate();
	if(i>0){
		response.sendRedirect("success.jsp");
	}
	else{
		out.print("User Registration Failed");
	}
	
}
catch(Exception ex){
	out.print(ex);
}
%>

