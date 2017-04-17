<%@ page import="java.sql.SQLException" %>
<%@ page import="com.apache.JDBCTools" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/3/1
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>表格下载</title>
</head>
<body>
<%
    ResultSet resultSet = JDBCTools.Select("SELECT * FROM team");
    request.setCharacterEncoding("utf-8");
    try {
        while(resultSet.next()){
            String s = resultSet.getString(1);
            s = java.net.URLEncoder.encode(s,"utf-8");
            String ss = "<a href='download.jsp?team_name="+s+"'>"+resultSet.getString(1)+"</a>";
            out.println(ss);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>
