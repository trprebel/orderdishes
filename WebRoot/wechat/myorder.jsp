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
	width: 320px;
	height: 507px;
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
	height: 62px;
	background: #FFFFFF;
	color: #555555;
	line-height: 32px;
	border-top: 2px solid #c7c7c4;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating span {
	font-size: 12px;
	margin-left: 7px;
}

.list_operating table {
	margin-left: 8px;
	margin-top: 6px
}

.list_operating2 {
	height: 52px;
	background: #FFFFFF;
	color: #555555;
	line-height: 40px;
	border-top: 2px solid #c7c7c4;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating2 span {
	font-size: 12px;
	margin-left: 7px;
}

.list_operating2 table {
	margin-left: 15px;
	margin-top: 8px
}

.list_operating0 {
	height: 62px;
	background: #FFFFFF;
	color: #555555;
	line-height: 32px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating0 span {
	font-size: 12px;
	margin-left: 7px;
}

.list_operating0 table {
	margin-left: 8px;
	padding-top: 5px;
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
				<img src="images/back.png" width="49" height="21" onclick="location.href=document.referrer"/>
			</div>
			<div class="top_title">饭店名称</div>
		</div>
		<div class="bank"></div>
		<div class="operating">
			<div class="top_opreating"></div>
			<div class="welcome_operating">XXX饭店/我的预定</div>

			<div class="list_operating2">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="109" align="left">您预定了3桌</td>
						<td width="132" align="right"><div>修改桌数&nbsp;</div>
						</td>
						<td width="32"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="bottom_opreating"></div>
		</div>
		<div class="operating">
			<div class="top_opreating"></div>
			<div class="list_operating0">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="75" align="left"><img src="images/img.png"
							width="67" height="48" />
						</td>
						<td width="167" align="left"><div>
								樱桃甜品<span>38元 充足</span>
							</div>
						</td>
						<td width="25"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="75" align="left"><img src="images/img.png"
							width="67" height="48" />
						</td>
						<td width="167" align="left"><div>
								樱桃甜品<span>38元 充足</span>
							</div>
						</td>
						<td width="25"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="75" align="left"><img src="images/img.png"
							width="67" height="48" />
						</td>
						<td width="167" align="left"><div>
								樱桃甜品<span>38元 充足</span>
							</div>
						</td>
						<td width="25"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="75" align="left"><img src="images/img.png"
							width="67" height="48" />
						</td>
						<td width="167" align="left"><div>
								樱桃甜品<span>38元 充足</span>
							</div>
						</td>
						<td width="25"><img src="images/left_arrow.png" width="11"
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
