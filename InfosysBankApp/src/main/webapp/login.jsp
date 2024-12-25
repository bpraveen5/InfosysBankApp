<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body{
            font-family: Arial, Helvetica, sans-serif;
        }
        .main{
            border: 1px solid black;
            border-radius: 10px;
            height: 50vh;
            width: 50vw;
            display: flex;
            text-align: center;
            justify-content: center;
            position: absolute;
            left: 25%;
            top: 25%;
        }
        .login{
            background-color: saddlebrown;
            padding-top: 80px;
            padding-right: 40px;
            padding-left: 40px;
            position:absolute;
            left:0%;
            padding-bottom: 185px;
            width: 40%;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .signup{
            position: absolute;
            background-color: white;
            left: 60%;
            top: 20%;

        }
    </style>
</head>
<body>
<form action="LoginCode.jsp" method="post">
    <div class="main">
        <div class="login">
            <label for="uname"></label><br>
            <input type="text" placeholder="Username" name="uname"><br>
            <label for="psw"></label><br>
            <input type="password" placeholder="Password" name="psw"><br>
            <button type="submit">SIGN IN</button>
        </div>
        <div class="signup">
            <h1>Hello!</h1>
            <p>Enter your personal details and <br>
                start your journy with us</p>
            <button type="submit">SIGN UP</button>
        </div>
    </div>
    </form>
</body>
</html>