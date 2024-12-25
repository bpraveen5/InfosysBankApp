<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Account Form</title>
<style>
body{
font-family: Arial, Helvetica, sans-serif;
background: #A5FAF9;
background: linear-gradient(to right, #A5FAF9 0%, #246FC1 100%);

}
h1{
border:1px;
background: #F8FFE8;
background: linear-gradient(to right, #F8FFE8 0%, #E3F5AB 44%, #F8FFE8 100%);
border-radius:10px;
width:450px;
height:50px;
margin:30px;
padding:5px 0;
}
.container{
border:1px solid white;
border-radius:6px;
background-color:white;
box-shadow: 0 0 20px;
height:450px;
width:450px;

}

input[type=text], input[type=password], input[type=number] {
  width: 250px;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: green;
  color: white;
  padding:15px 20px;
  margin: 15px;
  border: none;
  cursor: pointer;
  width: 100px;
}

button:hover {
  opacity: 0.8;
}
label[for=uid]{
padding-right:85px;
}
label[for=acno]{
padding-right:50px;
}
label[for=acname]{
padding-right:65px;
}
label[for=expdate]{
padding-right:60px;
}
label[for=cvv]{
padding-right:50px;
}
label[for=amount]{
padding-right:50px;
}

body{
            background-image: url(bankimg.jpg);
            background-size: 100%;
        }
       
</style>
</head>
<body>
<%
int uid=(Integer)session.getAttribute("uid");

%>

<center>
<h1>ADD ACCOUNT FORM</h1>
<form action="AddAccountCode.jsp" method="post">
      <label for="uid"><b></b></label>
      <input type="text" value=<%= uid %>placeholder="Enter Ac Number" name="uid"><br>

      <label for="cno"><b>Card Number:</b></label>
      <input type="text" placeholder="Enter acno" name="cno"><br>
      
      <label for="cname"><b>Card Name:</b></label>
      <input type="password" placeholder="Enter Card Name" name="cname"><br>
      
      <label for="expdate"><b>Expire Date:</b></label>
      <input type="number" placeholder="Enter ExpDate" name="expdate"><br>
      
      <label for="cvv"><b>CVV:</b></label>
      <input type="text" placeholder="Enter cvv" name="cvv"><br>
      
      <label for="amount"><b>Amount:</b></label>
      <input type="text" placeholder="Enter Amount" name="amount"><br>
        
      <button type="submit">submit</button>
      <a href="welcome.jsp">Back</a>
      </div>
</form>
</center>

</body>
</html>