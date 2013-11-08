﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<meta content="text/html; charset=gbk2312" http-equiv="Content-Type" />
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
	padding-left: 10px;
	width: 272px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating {
	height: 42px;
	background: #FFFFFF;
	color: #555555;
	line-height: 42px;
	border-top: 2px solid #c7c7c4;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating0 {
	height: 40px;
	background: #FFFFFF;
	color: #555555;
	line-height: 40px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating0 table {
	margin-left: 4px;
}

.list_operating table {
	margin-left: 20px;
}

.bank {
	height: 5px;
}
</style>
</head>

<body>
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
			<div class="welcome_operating">XXX饭店/菜谱浏览</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='werequestFOOD.action?resultPage=wefood'">
						<td width="234" align="left">所有菜谱</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='werequestFOOD.action?resultPage=wefeature'">
						<td width="234" align="left">特色菜谱</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='werequestFOOD.action?resultPage=wespecial'">
						<td width="234" align="left">最新优惠</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='requestmyORDER.action?resultPage=myorder'">
						<td width="234" align="left">我的订单</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="bottom_opreating"></div>
		</div>
	</div>
</body>
</html>
