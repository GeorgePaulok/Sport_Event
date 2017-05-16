<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.apache.JDBCTools" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 晨阳
  Date: 2017/5/16
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>





<html>

<!-- Mirrored from www.nssc.org.cn/pages/portal/baomingPre.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Dec 2016 04:08:26 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
    <base >

    <title>辽宁学生体育竞赛管理系统</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="web_resources/css/css.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        //此处是解决ie不能识别trim的问题
        if(!String.prototype.trim) {
            String.prototype.trim = function () {
                return this.replace(/^\s+|\s+$/g,'');
            };
        }
    </script>
</head>

<body class="bodyd">
<div class="topbg2"></div>
<div class="d_logo"></div>
<div class="clear"></div>

<div class="ddlneir">
    <table cellpadding=0 cellspacing=0 border=0 class="dzctab2">
        <tr>
            <td class="dzc1 font16 fontw">请选择报名比赛</td>
        </tr>
        <tr>
            <td valign=top>
                <ul class="dzcul">
                    <%
                        String team_name = request.getParameter("team_name");
                        Connection connection = null;
                        PreparedStatement ps = null;
                        ResultSet set = JDBCTools.Select("SELECT * FROM sport_event");
                        String Sports_Event = null;
                        ArrayList<String> event = new  ArrayList<String>();
                        ArrayList<String> event_class = new  ArrayList<String>();
                        try {
                            while(set.next()){
                                event.add(set.getString(1));
                                event_class.add(set.getString(3));
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        for(int i = 0;i<event.size();i++){
                            out.print("<li><a href='Sports_Event_SignUp.jsp?team_name="+team_name+"&event="+event.get(i)+"&class="+event_class.get(i)+"' class=\"bmrk\">");
                            out.print(event.get(i));
                            out.println("</a></li>");
                        }
                    %>
                </ul>
            </td>

        </tr>
    </table>
</div>

</body>

<!-- Mirrored from www.nssc.org.cn/pages/portal/baomingPre.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 20 Dec 2016 04:08:26 GMT -->
</html>
