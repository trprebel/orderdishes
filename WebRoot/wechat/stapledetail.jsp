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
<title>点菜系统</title>
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
	padding-left: 15px;
	width: 267px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating {
	background: #FFFFFF;
	color: #555555;
	line-height: 36px;
	border-top: 2px solid #c7c7c4;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating img {
	margin-left: 4px;
}

.list_operating0 {
	height: 36px;
	background: #FFFFFF;
	color: #555555;
	line-height: 36px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating0 table {
	margin-left: 8px;
}

.list_operating0 img {
	margin-left: 4px;
}

.list_operating table {
	margin-left: 8px;
}

.bank {
	height: 8px;
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
			<div class="welcome_operating">
				<img src="<%=basePath %>${staple.small_pic}" width="255" />
			</div>
			<div class="bottom_opreating"></div>
		</div>
		<div class="operating">
			<div class="top_opreating"></div>
			<div class="list_operating0">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="100" align="center">菜&nbsp;&nbsp;名:</td>
						<td width="190"><div align="left">${staple.staplefood }</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="100" align="center">单&nbsp;&nbsp;价:</td>
						<td width="190"><div align="left">${staple.price }</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="100" align="center">剩余数量：</td>
						<td width="190"><div align="left">${staple.num }</div>
						</td>
					</tr>
				</table>
			</div>

			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="100" align="center">说&nbsp;&nbsp;明:</td>
						<td width="190"><div align="left">${staple.descript }</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="bottom_opreating"></div>
		</div>
		<div class="bank">&nbsp;</div>
	</div>
</body>
</html>
