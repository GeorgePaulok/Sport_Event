<%@ page import="com.apache.exportExcel" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.IOException" %>
<%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/3/1
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>下载</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String team_name = request.getParameter("team_name");
        String temp_team_name = new String(team_name.getBytes("ISO-8859-1"),"utf-8");
        exportExcel e = new exportExcel();
        try {
            OutputStream output = response.getOutputStream();
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename="+team_name+".zip");
            e.Export(output,temp_team_name);
            output.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    %>
</body>
</html>
