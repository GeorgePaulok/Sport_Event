<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>辽宁省学生体育竞赛管理系统</title>
    <link href="web_resources/css/css.css" type="text/css" rel="stylesheet"/>
    <style type="text/css"></style>
    <script type="text/javascript">
        function searchMore(url) {
            url = encodeURI(url);
            url = encodeURI(url);
            window.open(url);
        }

        function goTo() {
            var obj = window.parent.document.getElementById("topFrame");
            if (obj == null || obj == '' || obj == undefined) {

            } else {
                window.location.href = "http://www.nssc.org.cn/pages/index.jsp";
            }
        }
    </script>
    <script type="text/javascript">
        //此处是解决ie不能识别trim的问题
        if (!String.prototype.trim) {
            String.prototype.trim = function () {
                return this.replace(/^\s+|\s+$/g, '');
            };
        }
    </script>
</head>

<body class="body2" onload="goTo();">
<div class="div_width">
    <!-- 登录 -->
        <style>
            .spanBtn {
                width: 173px;
                height: 27px;
                line-height: 27px;
                text-align: center;
                float: left;
                color: white;
            }

            .btnBlue {
                width: 173px;
                height: 27px;
                background: url("web_resources/images/n.png");
                margin-left: 3px;
                margin-top: 3px;
                margin-right: 3px;
                margin-bottom: 6px;
                font-size: 20px;
            }

            .btnBlue:hover {
                width: 173px;
                height: 27px;
                background: url("web_resources/images/p.png");
                margin-left: 3px;
                margin-top: 3px;
                margin-right: 3px;
                margin-bottom: 6px;
                font-size: 21px;
            }

            .btnLight {
                width: 173px;
                height: 27px;
                background: url("web_resources/images/n2.png");
                margin-left: 3px;
                margin-top: 5px;
                margin-right: 3px;
                margin-bottom: 6px;
                font-size: 20px;
            }

            .btnLight:hover {
                width: 173px;
                height: 27px;
                background: url("web_resources/images/p2.png");
                margin-left: 3px;
                margin-top: 5px;
                margin-right: 3px;
                margin-bottom: 6px;
                font-size: 21px;
            }

            #MyDiv #form1 {
                padding-top: 40px;
                padding-left: 20px;
            }

            .white_content {
                display: none;
                position: absolute;
                top: 30%;
                left: 30%;
                width: 310px;
                height: 210px;
                border: 1px solid #B4C9C6;
                background-color: white;
                z-index: 1002;
                overflow: auto;
            }

            .black_overlay {
                display: none;
                position: absolute;
                top: 0%;
                left: 0%;
                width: 100%;
                height: 100%;
                background-color: gray;
                z-index: 1001;
                -moz-opacity: 0.8;
                opacity: .80;
                filter: alpha(opacity=80);
            }
        </style>
        <script type="text/javascript">
            if (!String.prototype.trim) {
                String.prototype.trim = function () {
                    return this.replace(/^\s+|\s+$/g, '');
                };
            }
        </script>
        <script type="text/javascript">
            function changeImage() {
                document.getElementById("randImage").src = "imaged41d.jpg?" + Math.random();
            }
            function allsitesearch() {
                var allsitesearchvalue = document.getElementById("allsitesearchvalue").value;
                var url = "/TBulletAction1/listMoreTBulletsForAllUser.action?pageNo=1&searchOpt=true&pageSize=20&uuids=站内搜索&endTime3=" + allsitesearchvalue;
                url = encodeURI(url);
                url = encodeURI(url);
                window.open(url);
//			window.open("/TBulletAction/listMoreTBulletsForAllUser.action?pageNo=1&searchOpt=true&pageSize=20&uuids=站内搜索&endTime3="+allsitesearchvalue);
            }
            function queryContactUser(value) {
                if (value == undefined || value == '') {
                    alert('请输入学校名称');
                    return;
                }
                document.getElementById("content").innerHTML = "正在查询,请等待...";
                myhtml = $.ajax({
                    type: "post",
                    dataType: "text",
                    url: "/TBulletAction1/queryContactUser.action",
                    data: {
                        type: value
                    },
                    success: function (data, textStatus) {
                        document.getElementById("content").innerHTML = data;
                        //return false;
                    },
                    error: function () {
                    }
                });
            }
            function returnfalse() {
                return false;
            }
        </script>
        <script type="text/javascript">
            //此处是解决ie不能识别trim的问题//分成两个界面，将登录功能改为表单操作，然后后台返回另一个界面，window.onload=login(),再进行之后的操作
            if (!String.prototype.trim) {
                String.prototype.trim = function () {
                    return this.replace(/^\s+|\s+$/g, '');
                };
            }


            function login(){
                if ($("#lname").val().length == 0){
                    confirm("请输入用户名");
                    return ;
                }
                $("#welcome").text("欢迎 " + $("#lname").val() + " 登录");
                $("#welc").css("display", "");
                $("#login").css("display", "none");
                $("#navBottom").css("display", "none");
                $("#navTop").css("display", "");
            }

            function logout(){
                $("#welc").css("display", "none");
                $("#login").css("display", "");
                $("#navBottom").css("display", "");
                $("#navTop").css("display", "none");
            }
        </script>

    <div style="
    width: 900px;
    height: 77px;
    "><div class="tx_logo" style="
    float: left;
"></div>
        <div id="welc" style="float:right;display:none">
            <div class="norw2" style="margin-top:10px;margin-left: 10px;"><span id="welcome">fasdfasdf</span><div class="tipd"></div></div>
            <div class="btnLight cp" onclick="javascript:void(0)" style="margin-left:10px;margin-top:10px;width:80px;height:18px;float:right">
                <span class="spanBtn" style="width:80px;height:15px;;font-size: 12px;margin-top:-3px">修改密码</span>
            </div>
            <div class="btnLight cp" onclick="logout()" style="margin-top:10px;width:80px;height:18px;float:right;margin-left: 10px;">
                <span class="spanBtn" style="width:80px;height:15px;;font-size: 12px;margin-top:-3px">注销</span>
            </div>
        </div>

    </div>
    <div class="search"><input name="allsitesearchvalue" id="allsitesearchvalue" type="text"
                               class="input_search"/><input type="button" onclick="allsitesearch();" value="搜索"
                                                            class="search_zi"/></div>
    <div class="clear"></div>
    <div class="top">

        <div  class="topleft">

            <form action=Team_Login_Servlet method="post">
            <div id="login">
                <div class="nav_fgx"><span class="tit14 bt"><img alt="" src="web_resources/images/pic_user.jpg" align="absmiddle" border="0">&nbsp;用户登录</span></div>
                <div style="margin-top:20px"></div>
                <div class="norw2"><div class="tit14">登录名</div><div class="tipd"></div></div>
                <div class="norw"><input id="lname" type="text" name="Team_Name"  class="dl_input"></div>
                <div class="norw2"><div class="tit14">登录密码</div><div class="tipd"></div></div>
                <div class="norw"><input type="password" name="Password"  class="mm_input"></div>
                <div class="norw2"><div class="tit14">验证码</div></div>
                <div class="norw">
                    <input name="authCodes" id="authCodes" size="8" class="yz_input"><a href="javascript:void(0);"><img alt="" src="web_resources/images/yzm.jpg" id="randImage" border="0"></a>
                </div>
                <div style="margin-top:1px;">
                    <div class="input_ann">
                        <input type="submit"  src="web_resources/images/but_dl.gif" onmouseover="this.src='web_resources/images/but_dl2.gif'" onmouseout="this.src='web_resources/images/but_dl.gif'" align="absmiddle">&nbsp;&nbsp;
                    </div>
                </div>
                <div class="height1" style="margin-left:0px;width:225px;margin-top:50px"></div>
            </div>
            </form>
            <div style="margin-left: 20px;display:none" id="navTop">
                <div class="nav_fgx"><span class="tit14 bt">&nbsp;功能导航</span></div>
                <div style="margin-top:20px"></div>
                <div class="btnBlue cp" onclick="window.open('')">
                    <span class="spanBtn">比赛报名</span>
                </div>
                <div class="btnLight cp" onclick="window.open('Team_Register.jsp')">
                    <span class="spanBtn">教练员注册</span>
                </div>
                <div class="btnLight cp" onclick="window.open('')">
                    <span class="spanBtn">教练员查询</span>
                </div>
                <div class="btnLight cp" onclick="window.open('')">
                    <span class="spanBtn">运动员注册</span>
                </div>
                <div class="btnLight cp" onclick="window.open('')">
                    <span class="spanBtn">运动员查询</span>
                </div>
                <div class="btnLight cp">
                    <span class="spanBtn">用户管理</span>
                </div>
                <div class="btnLight cp" onclick="window.open('test.doc')">
                    <span class="spanBtn">资料下载</span>
                </div>
                <div class="btnLight cp">
                    <span class="spanBtn">联系我们</span>
                </div>
                <div class="btnLight cp" onclick="window.open('web_UserLoginAction/baomingLoginefe8.html')">
                    <span class="spanBtn">重新登录</span>
                </div>
            </div>

        </div>

        <script type="text/javascript" src="web_resources/js/jquery-min.js"></script>
        <script type="text/javascript" src="web_resources/js/hichina.validator-min.js"></script>
        <script type="text/javascript">
            var hiValidator = $("#form1").validate({
                rules: {
                    "loginName": {required: true},
                    "loginPwd": {required: true},
                    "authCodes": {required: true, remote: "/TBulletAction1/findImage.action"}
                },
                messages: {
                    "loginName": {required: "用户名不能为空!"},
                    "loginPwd": {required: "密码不能为空!"},
                    "authCodes": {required: "验证码不能为空!", remote: "验证码错误请重新输入!"}
                },
                submitHandler: function (form) {
                    form.submit();
                }
            });
        </script>

    <script type="text/javascript">
        function ShowDiv(show_div, bg_div) {
            document.getElementById("content").innerHTML = "<input type=\"button\" id=\"drop\" value=\"确定\" onclick=\"confirmTo();\"/>";
            document.getElementById("shoolName").value = "";
            document.getElementById(show_div).style.display = 'block';
            document.getElementById(bg_div).style.display = 'block';
            var bgdiv = document.getElementById(bg_div);
            bgdiv.style.width = document.body.scrollWidth;
            // bgdiv.style.height = $(document).height();
            $("#" + bg_div).height($(document).height());
        }
        //关闭弹出层
        function CloseDiv(show_div, bg_div) {
            document.getElementById(show_div).style.display = 'none';
            document.getElementById(bg_div).style.display = 'none';
        }
        function confirmTo() {
            var eid = document.getElementById("shoolName").value;
            queryContactUser(eid);
        }
    </script>
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">
        <div style="text-align: right; cursor: default; height: 30px; background: url(web_resources/images/manage_r3_c11.jpg)">
	<span style="font-size: 14px;padding-right:10px;line-height:30px" onclick="CloseDiv('MyDiv','fade')">
		关闭
	</span>
        </div>
        <form id="form1" name="form1" method="post">
            <table cellpadding="0" border="0" cellspacing="0" width="100%">
                <tbody>
                <tr>
                    <td>
                        学校名称：
                    </td>
                    <td id="td_title">
                        <input name="shoolName" id="shoolName"></input>
                    </td>
                <tr>

                <tr align="center" height="40px">
                    <td colspan="2" style="padding-top:20px;color:red;font-size:14px" id="content">
                        <input type="button" id="drop" value="确定" onclick="confirmTo();"/>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>

    <!-- 通知公告 -->

    <div>
        <div class="topmiddle">
            <div class="nav_fgx"><span class="tit14 bt">通知</span><span class="tip">
            <a target="_blank"><img
                    src="web_resources/images/pic_more.jpg" border="0"/></a></span></div>
            <div class="nav_neri">
                <table cellpadding="0" cellspacing="0" border="0" class="tab_list">
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a href='showTBulletDetails49a4.html' target="_blank" style='color: red;'>通知1</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >通知2</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >通知3</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >通知4</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >通知5</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >通知6</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >通知7</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >通知8</a>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <!-- 公示 -->


        <div class="topright">
            <div class="nav_fgx">
                <div class="tit14 bt">公示</div>
                <div class="tip"><a target="_blank"
                ><img
                        src="web_resources/images/pic_more.jpg" border="0"/></a></div>
            </div>
            <div class="nav_neri">
                <table cellpadding="0" cellspacing="0" border="0" class="tab_list">
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a href='showTBulletDetails49a4.html' target="_blank" style='color: red;'>
                                公示1</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >公示2</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >公示3</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >公示4</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >公示5</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >公示6</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >公示7</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >公示8</a>
                        </td>
                    </tr>

                </table>
            </div>

        </div>
    </div>

    <div>
        <div class="topleft">

            <div style="margin-left: 20px;" id="navBottom">
                <div class="btnBlue cp" onclick="window.open('')">
                    <span class="spanBtn">比赛报名</span>
                </div>
                <div class="btnLight cp" onclick="window.open('Team_Register.jsp')">
                    <span class="spanBtn">运动队注册</span>
                </div>
                <div class="btnLight cp" onclick="window.open('')">
                    <span class="spanBtn">教练员查询</span>
                </div>
                <div class="btnLight cp" onclick="window.open('')">
                    <span class="spanBtn">运动员注册</span>
                </div>
                <div class="btnLight cp" onclick="window.open('search.html')">
                    <span class="spanBtn">运动员查询</span>
                </div>
                <div class="btnLight cp">
                    <span class="spanBtn">用户管理</span>
                </div>
                <div class="btnLight cp" onclick="window.open('/web_resources/test.doc')">
                    <span class="spanBtn">资料下载</span>
                </div>
                <div class="btnLight cp">
                    <span class="spanBtn">联系我们</span>
                </div>
            </div>
        </div>
        <div class="topmiddle">
            <div class="nav_fgx"><span class="tit14 bt">成绩公告</span><span class="tip">
            <a target="_blank" ><img
                    src="web_resources/images/pic_more.jpg" border="0"/></a></span></div>
            <div class="nav_neri">
                <table cellpadding="0" cellspacing="0" border="0" class="tab_list">
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a href='showTBulletDetails49a4.html' target="_blank" style='color: red;'>
                                成绩1</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >成绩2</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >成绩3</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >成绩4</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >成绩5</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >成绩6</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >成绩7</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >成绩8</a>
                        </td>
                    </tr>

                </table>
            </div>
        </div>
        <!-- 公示 -->


        <div class="topright">
            <div class="nav_fgx">
                <div class="tit14 bt">下载中心</div>
                <div class="tip"><a target="_blank"
                ><img
                        src="web_resources/images/pic_more.jpg" border="0"/></a></div>
            </div>
            <div class="nav_neri">
                <table cellpadding="0" cellspacing="0" border="0" class="tab_list">
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a href='showTBulletDetails49a4.html' target="_blank" style='color: red;'>
                                下载1</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >下载2</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'

                            >下载3</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >下载4</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >下载5</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >下载6</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >下载7</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src='web_resources/images/pic_neir.gif' border='0' align='absmiddle'/>
                            <a target='_blank'
                            >下载8</a>
                        </td>
                    </tr>

                </table>
            </div>

        </div>
    </div>

</div>



<script type="text/javascript">
    function showsportsbypages(pageNo) {
        $("#showsportsbypages").load("/TBulletAction1/listTBulletForAllUserByAjax.action", {
            pageNo: pageNo,
            pageSize: 4
        }, function (data) {
        });
    }
</script>
<script type="text/javascript" src="web_resources/js/jquery-1.6.1.js"></script>
<script type="text/javascript" src="web_resources/js/jquery.validate.js"></script>

<div class="clear"></div>
<div class="bottom1" style="margin-top:30px">
    <div class="link_all">
        <table cellpadding="0" cellspacing="0" border="0" class="link_tx">
            <tr>
                <td class="link_bt1">重要链接</td>
                <td class="link_neir">
                    <div class="blinkl"><a
                            target="_blank" href="http://www.sport.gov.cn/">国家体育总局</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                            target="_blank" href="http://jsdj.sport.gov.cn/">运动员等级查询</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                            target="_blank" href="http://www.sport.org.cn/bulletin/index.html">国家体育总局各单项协会官方网站</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                            target="_blank" href="http://www.chinada.cn/">国家体育总局反兴奋剂中心</a></div>
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="clear"></div>

<!--  foot页  -->


<div class="footer">
    版权所有：辽宁省体育局 技术支持：<a href="javascript:void(0);">沈阳科技有限公司</a>&nbsp;&nbsp;
    <br/>
    地址：沈阳市大东区科技大厦21号楼311室 电话：024-50855034 邮编：110036<br>
    &nbsp;&nbsp;建议使用Chrome或IE8以上版本浏览
</div>


</div>
</body>
</html>
