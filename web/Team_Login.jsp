<%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/3/10
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="/web_resources/css/style3.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--webfonts-->
    <!--//webfonts-->
</head>
<body>
<div class="main">
    <div class="header" >
        <h1>参赛队登录</h1>
    </div>
    <form action = Team_Login_Servlet method = "post">
        <ul class="left-form">
            <li>
                <input type="text"   placeholder="参赛队名" name = "Team_Name" required/>
                <div class="clear"> </div>
            </li>
            <li>
                <input type="password"   placeholder="密码" name = "Password" required/>
                <div class="clear"> </div>
            </li>
            <input type="submit" onClick="myFunction()" value="登录">
            <div class="clear"> </div>
        </ul>
        <ul class="right-form">
        </ul>
        <div class="clear"> </div>
    </form>
</div>
</body>
</html>
