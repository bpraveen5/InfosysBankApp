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
            display: grid;
            height: 50vh;
            width: 50vw;
            grid-template-columns: 50% 50%;
            grid-template-rows: 50%;
            border: 1px solid black;
            border-radius: 10px;
            display: flex;
            text-align: center;
            justify-content: center;
            position: absolute;
            left: 25%;
            top: 25%;

        }
        .login{
            background-color: darkolivegreen;
            padding-right: 40px;
            padding-left: 60px;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px ;
            color: white;
            
        }
        .input[type=text]{
            width: 20px;
            height: 30px;
            box-sizing: border-box;

        }
        .signup{
            background-color:rgb(232, 232, 232);
            padding-right: 70px;
            padding-left: 80px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px ;

        }
       


    </style>
</head>
<body>
<form action="UserCode.jsp" method="post">
    <div class="main">
        <div class="login">
            <h1>Welcome</h1>
            <h1>Back!</h1>
            <p>To Keep connected with us please log<br>
                in with your personal info</p>
                <div class="button-1">
                    <a href="login.jsp"><button>SIGN IN</button></a>
                </div>
        </div>

        <div class="signup">
            <h1>Create</h1>
            <h1>Account</h1>
            <table boarder="1">
            
                <tr>
                <td>Name:</td>
                <td><input type="text" name="uname"><p></p>
                </td></tr>
                
                <tr>
                <td>Password:</td>
                <td><input type="password" name="psw"><p></p>
                </td></tr>
                
                <tr>
                <td>Email:</td>
                <td><input type="email" name="email"><p></p>
                </td></tr>

                <tr>
                <td>Gender:</td>
                <td><input type="radio" value="male" name="Gender">Male
                <input type="radio" value="female" name="Gender">Female
                </td>
                </tr>

                <tr>
                <td>Address:</td>
                <td><input type="text"  name="adrs">
                </td>
                </tr>
                </table>

               <input type="submit" value="SIGN UP">
        </div>

    </div>
    </form>

</body>
</html>