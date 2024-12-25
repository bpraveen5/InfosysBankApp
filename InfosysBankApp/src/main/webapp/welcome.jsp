<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body{
            margin: 0px;
            padding: 0px;
            font-family: Arial, Helvetica, sans-serif;
        }
        aside{
            background-color: rgb(216, 238, 238);
            width: 30vh;
            height: 97vh;
            display: block;
            padding: 10px;
        }
        .sidebar{
            margin-top: 20px;
            border-radius: 8px;
            background-color:white;
            height: 2px;
            width: 70%;
            color: black;
            ite
        }
        .sidebar:hover{
            background-color:darkblue;
            color: white;
        }
        a{
            display: block;
            padding: 25px;
            text-align: center;
            text-decoration: none;
            color:darkgray;
            font-family: Arial, Helvetica, sans-serif;
        }
        .sidebar i{
            padding-right: 5px;
        }
        a:hover{
            color:whitesmoke;
        }
        .container{
            display: flex;
        }
        .navbar{
            display: flex;
            height: 30px;
            position: absolute;
            left: 20%;
            background-color:rgba(244, 240, 240, 0.375);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Adds the shadow */
            height: 50px;
            margin-top: 10px;
            width: 70%;
            padding-bottom: 10px;
            padding-left: 5px;
        }
        .navbar h2{
            text-align: center;

        }
        .icons{
            position: absolute;
            left: 800px;
            display: flex;
            margin-top: 20px;
        }
        .btn{
            margin-top: 100px;
            margin-left: 70px;
            background-color: darkblue;
            border-radius: 30px;
            height: 35px;
            width: 15%;
            padding-bottom: 30px;

        }
        
        .btn a{
            color:white;
        }
        .div1{
        	float:right;
        }
        
    </style>
</head>
<body>
<hr></hr>
 		<%
        int uid=(Integer)session.getAttribute("uid");
		out.print("Hello:"+uid);
		session.setAttribute("uid",uid);
		%>

<div class="container">
    <aside>
        <a class="sidebar" href="welcome.jsp"><i class="fas fa-chart-line"></i>Dashboard</a>
        <a class="sidebar" href="balance.jsp"><i class="fas fa-wallet"></i>Balance</a>
        <a class="sidebar" href="transaction.jsp"><i class="fas fa-exchange-alt"></i>Transactions</a>
        <a class="sidebar" href="bills.jsp"><i class="fas fa-file-invoice"></i>Bills</a>
        <a class="sidebar" href="expenses.jsp"><i class="fas fa-receipt"></i> Expenses</a>
        <a class="sidebar" href="goals.jsp"><i class="fas fa-bullseye"></i>Goals</a>
    </aside>
    <div class="navbar">
        <h2>Hi, User</h2>
      
        <div class="icons">
        <i class="fas fa-bell"></i>
        <button type="submit"><i class="fas fa-search"></i></button>
        <input type="search" placeholder="Search here or ask me so ">
        </div>    
    </div>
    <div class="btn">
        <a href="AddAccountCode.jsp">Add Account</a>
    </div>
    </div>

</body>
</html>