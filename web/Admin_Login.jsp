<%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/3/1
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="web_resources/css/style1.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>s

<body>
<div class="main">
    <form action = loginServlet method = "post">
        <div class="lable-2">
            <label><input type="text" name = "username" class="text" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}"></label>
            <label><input type="password" name = "password" class="text" value="密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '密码';}"></label>
        </div>
        <div class="submit">
            <input type="submit"  value="login" >
        </div>
    </form>
    <!-----//end-main---->
</div>
</body>
</html>