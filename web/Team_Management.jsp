<%@ page import="com.apache.JDBCTools" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/3/10
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>队员信息管理</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String team_name = request.getParameter("team_name");
    out.println("<table border=1 >");
    out.println("<tr><th width = 200>队伍</th><th>姓名</th><th>性别</th><th>组别</th><th>身高</th>" +
            "<th>体重</th><th width = 200>身份证号</th>");
    ResultSet resultSet = JDBCTools.Select("SELECT * FROM player_basic_info WHERE Team_Name = '"+team_name+"'");

    if(resultSet!=null){
        try {
            while(resultSet.next()){
                out.print("<tr>");
                for(int i = 1;i<8;i++){
                    out.print("<td align = center>"+resultSet.getString(i)+"</td>");
                }
                String s = resultSet.getString(2);
                s = java.net.URLEncoder.encode(s,"utf-8");
                out.print("<td><form action = Delete_Player_Servlet?player_name="+s+" method = post><input type = submit value = '删除'/></form></td>");
                out.println();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    out.println("<tr><td><form action = Add_Player.jsp?team_name="+team_name+" method = 'post'><input type = submit value = \"添加\"/></form></td>");
%>
</body>
</html>
