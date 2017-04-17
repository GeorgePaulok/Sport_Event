<%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/2/28
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.apache.JDBCTools" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="web_resources/css/style3.css" rel='stylesheet' type='text/css'/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
</head>


<body>
<%
    String temp_team_name = request.getParameter("team_name");
    String team_name = null;
    if(temp_team_name!=null){
        team_name = new String(temp_team_name.getBytes("ISO-8859-1"),"utf-8");
        System.out.println(team_name);
    }
%>
<div class="main">
    <div class="header">
        <h1>运动会报名</h1>
    </div>
    <%
        if(team_name!=null){
            team_name = java.net.URLEncoder.encode(team_name,"utf-8");
        }
        out.println("<form action=Servlet?team_name="+team_name+" enctype=\"multipart/form-data\" method=\"post\">");
    %>
    <form action=Servlet enctype="multipart/form-data" method="post">
        <ul class="left-form">
            <h2>参赛信息</h2>
            <li>
                <input type="text" name="name" placeholder="姓名" required/>
                <div class="clear"></div>
            </li>
            <li>
                <input type="text" name="sex" placeholder="性别" required/>
                <div class="clear"></div>
            </li>
            <li>
                <input type="text" name="height" placeholder="身高"/>
                <div class="clear"></div>
            </li>
            <li>
                <input type="text" name="weight" placeholder="体重"/>
                <div class="clear"></div>
            </li>
            <li>
                <input type="text" name="id" placeholder="身份证号"/>
                <div class="clear"></div>
            </li>
            <li>
                <input type="text" name="add" placeholder="备注"/>
                <div class="clear"></div>
            </li>
            <li>
                <input type="file" name="photo" placeholder = "照片" />
            </li>
            <input type="submit" onClick="myFunction()" value="提交报名">
            <div class="clear"></div>
        </ul>
        <ul class="right-form">
        </ul>
        <div class="clear"></div>
    </form>
</div>
</body>
</html>