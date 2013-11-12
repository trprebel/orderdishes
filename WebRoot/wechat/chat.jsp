<%@page import="com.dao.impl.BusinessDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	int businessid=Integer.parseInt((String)session.getAttribute("businessid"));
	//System.out.println(businessid);
	BusinessDao businessDao=new BusinessDao();
	String username=businessDao.findBusUserById(businessid);
	//System.out.println(username);
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
	padding-left: 5px;
	width: 277px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating {
	min-height: 36px;
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

.list_operating0 div {
	margin-left: 11px;
}

.list_operating div {
	margin-left: 5px;
	margin-right: 5px;
}

.list_operating0 img {
	margin-left: 7px;
}

.list_operating2 {
	height: 40px;
	background: #FFFFFF;
	color: #555555;
	line-height: 40px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating2 table {
	margin-left: 8px;
}

.list_operating2 img {
	margin-left: 7px;
}

.list_operating3 {
	height: 44px;
	background: #FFFFFF;
	color: #555555;
	line-height: 44px;
	border-top: 2px solid #c7c7c4;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating3 table {
	margin-left: 8px;
}

.list_operating3 img {
	margin-left: 7px;
}

.list_operating table {
	margin-left: 8px;
}

.bank {
	height: 8px;
}

.list_operating4 {
	height: 44px;
	width: 286px;
	margin: 0 auto;
	display: block;
	color: #555555;
	line-height: 44px;
}

.list_operating4 img {
	vertical-align: middle;
	float: right;
	margin-top: 5px;
}

.carte_input {
	height: 30px;
	text-align: right;
	line-height: 30px;
	border: 0px;
	color: #555555;
	font-weight: bold;
	font-size: 16px;
}

.textarea_carte {
	border: 1px solid #dcdcd9;
	width: 185px;
	height: 50px;
	line-height: 20px;
	color: #000000;
	font-size: 14px;
	float: left
}

.welcome_operating img {
	margin-left: 10px;
	float: left;
	margin-top: 10px;
}
</style>
<script type="text/javascript" src="<%= basePath%>js/jquery-1.6.js"></script>
<script type="text/javascript">
function speak(){
	
	var postdata = {
			content:$("#content").val(),
			touser:"<%=username%>"
    	};
  	
	$.ajax({
     	type:'post',
     	data:postdata,
     	async:false,
     	url:'<%=basePath%>speakMESSAGE.action',
    	error:function(){
       		alert("说话失败！");
    	}

    });
	
//	var xmlhttp;
//	if (window.XMLHttpRequest)
//  	{// code for IE7+, Firefox, Chrome, Opera, Safari
// 		xmlhttp=new XMLHttpRequest();
//  	}
//	else
//  	{// code for IE6, IE5
//  		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
//  	}
//	xmlhttp.onreadystatechange=function()
//  	{
//  		if (xmlhttp.readyState==4 && xmlhttp.status==404)
//    	{
//    		alert("说话失败！");
//    	}
//  	}
//	var content=document.getElementById("content").value;
//	xmlhttp.open("POST","",true);
//	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
//	xmlhttp.send("content="+content+"&touser=admin");
	document.getElementById("content").value="";
		
}
</script>
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
				<textarea class="textarea_carte" name="content" id="content"></textarea>
				<img src="images/send.png" width="65" height="32" onclick="speak()"/>
			</div>
			<div class="bottom_opreating"></div>
		</div>
		<div class="operating">
			<div class="top_opreating"></div>
			<div class="list_operating0">
				<div>聊天记录</div>
			</div>
			<div style="vertical-align:top">
				<iframe id="frame_content" 
					style=" width:286px; min-height:300px; background:transparent;  vertical-align:top;"
					src="messageMESSAGE.action?touser=<%=username%>&totype=wechat" marginheight="0" scrolling="yes" frameborder=0></iframe>
		
			</div>

		</div>
		<div class="bank"></div>
		<div class="bank"></div>
		<div class="bank"></div>
	</div>
<script type="text/javascript">

function reinitIframe(){

var iframe = document.getElementById("frame_content");

try{

iframe.height = iframe.contentWindow.document.documentElement.scrollHeight;

}catch (ex){}

}

window.setInterval("reinitIframe()", 200);

</script>
</body>
</html>
