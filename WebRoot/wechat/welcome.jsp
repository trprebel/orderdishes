<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String businessid=(String)request.getParameter("businessid");
	session.setAttribute("businessid", businessid);
	//System.out.println(businessid);
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
	line-height: 56px;
	height: 56px;
	padding-left: 15px;
	width: 267px;
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
	margin-left: 4px;
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
			<div class="welcome_operating">阿土欢迎您,请选择您的操作:</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='dishes.jsp'">
						<td width="57" align="center"><img src="images/icon1.png"
							width="19" height="20" />
						</td>
						<td width="192" align="left" >浏览菜谱</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='werequestSTAPLE.action?resultPage=westaple'">
						<td width="57" align="center"><img src="images/icon5.png"
							width="21" height="19" />
						</td>
						<td width="192" align="left">主食</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='werequestDRINKS.action?resultPage=wedrinks'">
						<td width="57" align="center"><img src="images/icon2.png"
							width="25" height="25" />
						</td>
						<td width="192" align="left">酒水饮料</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='requestmyORDER.action?resultPage=myorder'">
						<td width="57" align="center"><img src="images/icon3.png"
							width="18" height="22" />
						</td>
						<td width="192" align="left">我的订单</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
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
					<tr onclick="location.href='requestallORDER.action'">
						<td width="57" align="center"><img src="images/icon6.png"
							width="19" height="24" />
						</td>
						<td width="192" align="left">买单速算</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='chat.jsp?touser=admin'">
						<td width="57" align="center"><img src="images/icon4.png"
							width="22" height="23" />
						</td>
						<td width="192" align="left">人工服务</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='feedback.jsp'">
						<td width="57" align="center"><img src="images/icon4.png"
							width="22" height="23" />
						</td>
						<td width="192" align="left">意见反馈</td>
						<td width="20"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr onclick="location.href='more.jsp'">
						<td width="57" align="center"><img src="images/icon7.png"
							width="20" height="20" />
						</td>
						<td width="192" align="left">更多...</td>
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
