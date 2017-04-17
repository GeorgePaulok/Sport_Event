<%@ page import="com.apache.JDBCTools" %>
<%@ page import="java.sql.ResultSet" %><%--
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
    String team_name = request.getParameter("Team_Name");
    out.println("<table border=1 >");
    out.println("<tr><th width = 200>号码</th><th>姓名</th><th>性别</th><th>组别</th><th>身高</th>" +
            "<th>体重</th><th width = 200>身份证号</th>");
    ResultSet resultSet = JDBCTools.Select("SELECT * FROM player_basic_info WHERE Team_Name = '"+team_name+"'");

    if(resultSet!=null){
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
    }
    String s = team_name;
    s = java.net.URLEncoder.encode(s,"utf-8");
    out.println("<tr><td><form action = Add_Player.jsp?team_name="+s+" method = 'post'><input type = submit value = \"添加\"/></form></td>");
    out.println("<td><form action = Sports_Event_SignUp.jsp?team_name="+s+" method = 'post'><input type = submit value = \"运动会报名\"/></form></td>");
    out.println("</table>");
%>
</body>
</html>
