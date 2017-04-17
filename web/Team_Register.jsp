<%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/3/5
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="web_resources/css/style2.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--webfonts-->
    <!--//webfonts-->
</head>
<body>
<div class="main">
    <div class="header" >
        <h1>运动会报名</h1>
    </div>
    <form action = Team_Register_Servlet method="post">
        <ul class="left-form">
            <h2>参赛信息</h2>
            <li>
                <input type="text"   name = "team_name" placeholder="参赛队名" required/>
                <div class="clear"> </div>
            </li>
            <li>
                <input type="text"  name = "commander" placeholder="团长" required/>
                <div class="clear"> </div>
            </li>
            <li>
                <input type="text"  name = "leader" placeholder="领队" required/>
                <div class="clear"> </div>
            </li>
            <li>
                <input type="text"  name = "coach" placeholder="教练" />
                <div class="clear"> </div>
            </li>
            <li>
                <input type="text"  name = "staff" placeholder="工作人员" />
                <div class="clear"> </div>
            </li>
            <li>
                <input type="text"  name = "doctor" placeholder="队医" />
                <div class="clear"> </div>
            </li>
            <li>
                <input type="text"  name = "contact" placeholder="联系方式" />
                <div class="clear"> </div>
            </li>
            <li>
                <input type="password"  name = "password" placeholder="登录密码" />
                <div class="clear"> </div>
            </li>
            <li>
                <input type="password"  name = "password_confirm" placeholder="确认密码" />
                <div class="clear"> </div>
            </li>
            <input type="submit" onClick="myFunction()" value="提交">
            <div class="clear"> </div>
        </ul>
        <ul class="right-form">
        </ul>
        <div class="clear"> </div>
    </form>
</div>
</body>
</html>