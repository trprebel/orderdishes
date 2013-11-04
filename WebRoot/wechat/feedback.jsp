<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0">   
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta name="format-detection" content="telephone=no" />
<title>001</title>
<style>
body {
	font-size: 16px;
	font-family: "微软雅黑";
	font-weight: bold;
	letter-spacing: 1px;
	margin: 0px;
}

.main {
	min-width: 320px;
	margin: 0 auto;
	display: block;
	background: url(images/mc_top.png) top repeat-x #e0e1dc
}

.top {
	height: 42px;
}

.top_title {
	height: 42px;
	width: 220px;
	float: left;
	line-height: 42px;
	color: #ffffff;
	text-align: center
}

.top_back {
	width: 49px;
	height: 21px;
	margin-top: 13px;
	margin-left: 8px;
	float: left;
}

.operating {
	width: 286px;
	clear: both;
	height: auto;
	margin: 0 auto;
	display: block;
	margin-top: 9px;
}

.top_opreating {
	width: 286px;
	height: 8px;
	background: url(images/top_bg.png) no-repeat;
}

.bottom_opreating {
	width: 286px;
	height: 8px;
	background: url(images/bottom_bg.png) no-repeat;
}

.welcome_operating {
	color: #555555;
	background: #FFFFFF;
	line-height: 56px;
	height: 56px;
	padding-left: 15px;
	width: 267px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating {
	height: 52px;
	background: #FFFFFF;
	color: #555555;
	line-height: 20px;
	border-top: 2px solid #c7c7c4;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating span {
	font-size: 16px;
	margin-left: 7px;
}

.list_operating0 {
	height: 62px;
	background: #FFFFFF;
	color: #555555;
	line-height: 60px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating0 table {
	margin-left: 30px;
}

.list_operating table {
	margin-left: 13px;
	margin-top: 12px
}

.bank {
	height: 8px;
}

.button2 {
	width: 82px;
	font-size: 24px;
	text-align: center;
	color: #555555;
	height: 44px;
	background: url(images/bg_button.png) repeat-x;
	border: 0px;
}

.list_operating div {
	margin-left: 13px;
	line-height: 20px;
	margin-top: 8px;
}

.feed_back {
	min-height: 245px;
	background: #FFFFFF;
	color: #555555;
	line-height: 42px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating3 td {
	vertical-align: bottom
}

.list_operating3 table {
	margin-left: 30px;
	padding-top: 20px;
}

.feed_back_text {
	width: 248px;
	min-height: 250px;
	border: #c7c7c4 1px solid;
	margin-left: 15px;
	margin-top: 5px;
}
</style>
<script type="text/javascript">
function submit()
{
	var f1=document.getElementById("feedbackform");
	f1.submit();
}
</script>
</head>

<body>
	<form action="wechatFEEDBACK.action" name="feedbackform" id="feedbackform" method="post">
	<div class="main">
		<div class="top">
			<div class="top_back">
				<img src="images/back.png" width="49" height="21" onclick="history.go(-1)"/>
			</div>
			<div class="top_title">饭店名称</div>
		</div>
		<div class="bank"></div>
		<div class="operating">
			<div class="top_opreating"></div>
			<div class="welcome_operating">XXX饭店/意见反馈</div>

			<div class="bottom_opreating"></div>
		</div>
		<div class="operating">
			<div class="top_opreating"></div>

			<div class="feed_back">
				<textarea name="content" id="content" class="feed_back_text"></textarea>
			</div>


			<div class="bottom_opreating"></div>
		</div>
		<div class="bank"></div>
		<div align="center">
			<img src="images/feedback.png" width="96" height="33" onclick="submit()"/>
		</div>
		<div class="bank"></div>
	</div>
	</form>
</body>
</html>
