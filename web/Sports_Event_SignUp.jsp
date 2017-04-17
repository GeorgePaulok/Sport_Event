<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.apache.JDBCTools" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/3/11
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>运动会报名</title>
    <style>.s1{width:200px}</style>
</head>
<body>
    <%
        ArrayList<String> Group = new ArrayList<String>();
        ArrayList<String> Event = new ArrayList<String>();
        request.setCharacterEncoding("utf-8");
        String temp_team_name = request.getParameter("team_name");
        String team_name = new String(temp_team_name.getBytes("ISO-8859-1"),"utf-8");
        String s = java.net.URLEncoder.encode(team_name,"utf-8");
        out.println("<form action=SignUp_Servlet?team_name="+s+" method='post'>");
        out.println("<table border=1 >");
        out.println("<tr><th width = 200>号码</th><th>姓名</th><th>组别</th><th>项目一</th><th>项目二</th>" +
                "<th>项目三</th><th>项目四</th><th>项目五</th><th>是否报名</th>");
        ResultSet resultSet = JDBCTools.Select("SELECT * FROM player_basic_info WHERE Team_name = '"+team_name+"'");
        ResultSet Group_Set = JDBCTools.Select("SELECT * FROM test.group");
        ResultSet Event_Set = JDBCTools.Select("SELECT * FROM test.event");
        while(Group_Set.next()){
            Group.add(Group_Set.getString(1));
        }
        while(Event_Set.next()){
            Event.add(Event_Set.getString(1));
        }
        if(resultSet!=null){
            int counter = 1;
            while(resultSet.next()){
                out.println("<tr><td align=center>"+resultSet.getString("Player_Number")+"</td>");
                out.print("<td align=center>"+resultSet.getString("Player_Name")+"</td>");
                out.print("<td><SELECT NAME=\"p"+counter+"Group\" CLASS=\"s1\" SIZE=\"1\">");
                out.println("<OPTION VALUE=''>");
                for(int i=0;i<Group.size();i++){
                    out.println("<OPTION VALUE='"+Group.get(i)+"'>"+Group.get(i));
                }
                out.println("</SELECT></td>");
                for(int i=0;i<5;i++){
                    out.println("<td><SELECT NAME=\"p" + counter + "Event"+(i+1)+"\" CLASS=\"s1\" SIZE=\"1\">");
                    out.println("<OPTION VALUE=''>");
                    for(int j=0;j<Event.size();j++){
                        out.println("<OPTION VALUE='"+Event.get(j)+"'>"+Event.get(j));
                    }
                    out.println("</SELECT></td>");
                }
                out.println("<td><SELECT NAME=\"p" + counter + "Register_Status\" CLASS=\"s1\" SIZE=\"1\">");
                out.println("<OPTION VALUE='yes'>是");
                out.println("<OPTION VALUE='no'>否");
                out.println("</SELECT></td>");
                counter++;
            }
        }
        out.println("<tr><td><input type=submit value='提交报名'/></td>");
    %>
</body>
</html>
