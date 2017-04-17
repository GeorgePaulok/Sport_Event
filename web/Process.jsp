<%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/3/5
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理</title>
</head>
<body>
<%
    String type = request.getParameter("type");
    if(type.equals("group")){
        out.println("<form action =Group_Add_Servlet method = 'post'>");
        out.println("<input type = 'text' name = 'group' placeholder = '组别名称' required>");
        out.println("<input type = 'submit' value = '提交'>");
    }else if(type.equals("event")){
        out.println("<form action =Event_Add_Servlet method = 'post'>");
        out.println("<input type = 'text' name = 'event' placeholder = '项目名称' required>");
        out.println("<input type = 'submit' value = '提交'>");
    }else{
        out.println("<form action =Sports_Event_Add_Servlet method = 'post'>");
        out.println("<input type = 'text' name = 'sports_event' placeholder = '运动会名称' required>");
        out.println("<input type = 'submit' value = '提交'>");
    }
%>
</body>
</html>
