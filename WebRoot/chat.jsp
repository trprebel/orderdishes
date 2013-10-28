<%@page import="com.bean.QuickReplay"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//String touser=request.getParameter("touser");
	//System.out.println(touser);
	List<QuickReplay> quickReplays=(List<QuickReplay>)request.getAttribute("quickreplay");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bg_login1</title>
<style>
body {
	text-align: center;
}

.main {
	width: 961px;
	height: 631px;
	margin: 0px auto;
	display: block;
	background: url(images/bg_hand_xinxi_replay2.png) no-repeat;
	position: relative;
	top: -15px;
}

.01 {
	*position: relative;
	*top: -4px;
	width: 961px;
	height: 631px;
	margin-top: 0px;
	display: block;
}

.login_input_info {
	width: 450px;
	height: 38px;
	line-height: 38px;
	margin-left: 10px;
	border: 0px;
	margin-bottom: 10px;
	background-color: #e76049;
	font-size: 24px;
	color: #FFFFFF;
	font-weight: bold
}

.login_input {
	width: 270px;
	height: 28px;
	border: 0px;
	background-color: #f1f1f1;
	font-size: 16px;
	color: #999999
}

.text_foot {
	font-size: 20px;
	color: #e1e1e1;
	font-weight: bold;
	line-height: 25px;
}

.list {
	font-size: 18px;
	cursor: pointer;
	color: #e2e2e2;
	font-weight: bold;
	height: 40px;
	line-height: 40px;
}

.list:hover {
	background: url(images/bg_list.png) repeat
}

.list img {
	margin-right: 22px;
	vertical-align: middle
}

.list_h {
	font-size: 18px;
	cursor: pointer;
	color: #e2e2e2;
	font-weight: bold;
	height: 40px;
	line-height: 40px;
	background: url(images/bg_list.png) repeat
}

.list_h img {
	margin-right: 22px;
	vertical-align: middle
}

.infr_instroy {
	font-size: 18px;
	width: 300px;
	color: #90a5c1;
	font-weight: bold;
	position: absolute;
	top: 85px;
}

.tab_info td {
	border: 2px solid #ffffff;
	height: 50px;
	line-height: 50px;
	font-size: 18px;
	color: #FFFFFF;
	font-weight: bold;
	text-align: center
}

.qiu li {
	width: 205px;
	height: 147px;
	list-style: none;
	float: left;
	background: url(images/add.png) no-repeat;
	margin-right: 8px;
	margin-left: 10px;
	margin-bottom: 20px;
	*margin-bottom: 5px;
}

.name span {
	float: left;
	width: 100px;
	margin-left: 2px;
}

.name {
	font-size: 14px;
	position: relative;
	top: -13px;
	*top: -20px;
	float: left;
	font-weight: bold;
	color: #a9bfdb;
	line-height: 22px;
}

.name img {
	float: right;
	margin-top: 1px;
}

#position {
	position: relative;
	top: -124px;
	right: -190px;
}

.text_area {
	border: 0px;
	float: left;
	width: 567px;
	height: 65px;
	*position: relative;
	*top: -12px;
	background: #eaedf1
}

.left_top_xinxi {
	width: 360px;
	background: url(images/question1.png) right top no-repeat;
	margin-left: 17px;
}

.left_top_xinxi2 {
	width: 360px;
	background: url(images/question2.png) left top no-repeat;
	margin-left: 17px;
}

.right_top_xinxi {
	width: 315px;
	margin-left: 320px;
}

.top_xinxi_replay {
	width: 304px;
	color: #4d4d4d;
	font-size: 18px;
	font-weight: bold;
	line-height: 33px;
	height: 33px;
	background: url(images/top_replay_xinxi.png) no-repeat
}

.top_xinxi_replay2 {
	width: 304px;
	color: #4d4d4d;
	margin-left: 58px;
	font-size: 18px;
	font-weight: bold;
	line-height: 33px;
	height: 33px;
	background: url(images/top_replay_xinxi2.png) no-repeat
}

.middle_xinxi_replay {
	width: 292px;
	color: #4d4d4d;
	font-size: 18px;
	font-weight: bold;
	line-height: 20px;
	background: url(images/middle_replay_xinxi2.png) repeat-y
}

.middle_xinxi_replay2 {
	width: 293px;
	margin-left: 69px;
	color: #4d4d4d;
	font-size: 18px;
	font-weight: bold;
	line-height: 20px;
	background: url(images/middle_replay_xinxi3.png) repeat-y
}

.bottom_xinxi_replay {
	width: 304px;
	color: #4d4d4d;
	font-size: 18px;
	font-weight: bold;
	height: 15px;
	background: url(images/bottom_replay_xinxi.png) no-repeat
}

.bottom_xinxi_replay2 {
	width: 304px;
	margin-left: 69px;
	color: #4d4d4d;
	font-size: 18px;
	font-weight: bold;
	height: 15px;
	background: url(images/bottom_replay_xinxi2.png) no-repeat
}

.replay_text {
	width: 940px;
	margin-left: 10px;
	height: 240px;
	margin-top: 4px;
	*margin-top: 8px;
}

.replay_close {
	margin-left: 912px;
	position: relative;
	top: -1px;
	margin-bottom: 2px;
}

.img_replay {
cursor:pointer;
	float: left;
	margin-left: 40px;
	*position: relative;
	*top: -12px;
}

.icon_replay {
cursor:pointer;
	width: 122px;
	height: 33px;
	text-align: center;
	line-height: 33px;
	font-size: 18px;
	color: #515151;
	font-weight: bold;
	background: url(<%=basePath%>images/button.png) center center no-repeat
}

.content_replay {
	color: #eaedf1;
	font-size: 18px;
	font-weight: bold;
}

.content_shoutong {
	margin-left: 51px;
	margin-top: 4px;
}
</style>
</head>
<script type="text/javascript" src="<%= basePath%>js/jquery-1.6.js"></script>
<script type="text/javascript">
function speak(){
	
	var postdata = {
			content:$("#content").val(),
			touser:"${touser}"
    	};
  	
	$.ajax({
     	type:'post',
     	data:postdata,
     	url:'<%=basePath%>speakMESSAGE.action',
    	error:function(){
       		alert("说话失败！");
    	}

    });
	document.getElementById("content").value="";
		
}
function quickreplay(replay){
	var postdata = {
			content:replay,
			touser:"${touser}"
    	};
  	
	$.ajax({
     	type:'post',
     	data:postdata,
     	url:'speakMESSAGE.action',
    	error:function(){
       		alert("说话失败！");
    	}

    });
}
</script>
<body>
	<div class="main">
		<table class="01" width="961" height="631" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="14" width="960" height="16">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="16" alt=""></td>
	</tr>
	<tr>
		<td width="960" height="15">			</td>
		<td width="81" height="15"></td>
		<td width="712" height="15"></td>
		<td width="28" height="15"></td>
		<td height="68" colspan="4" width="491" rowspan="4">&nbsp;</td>
		<td rowspan="3" width="141" height="57">&nbsp;</td>
		<td colspan="5" rowspan="5" width="241" height="82">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="15" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="3" width="960" height="53">	  </td>
		<td width="28" height="28">&nbsp;</td>
		
		<td>
			<img src="images/分隔符.gif" width="1" height="28" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2" width="28" height="25">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="14" alt=""></td>
	</tr>
	<tr>
		<td rowspan="6" width="141" height="91">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="11" alt=""></td>
	</tr>
	<tr>
		<td rowspan="19" width="960" height="546">			</td>
		<td colspan="4" rowspan="2" width="81" height="24" ><div class="infr_instroy"></div></td>
		<td colspan="3" rowspan="5" width="470" height="80">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="14" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4" width="241" height="66">			</td>
		<td colspan="3" rowspan="2" width="208" height="42" align="center"
					class="list" onClick="location.href='requestFOOD.action'">&nbsp;</td>
		<td width="1" height="10">			</td>
	</tr>
	<tr>
		<td colspan="4" rowspan="3" width="81" height="56">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="32" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="2" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="2" width="208" height="42" align="center"
					class="list" onClick="location.href='requestDRINKS.action'">&nbsp;</td>
		<td width="1" height="22">			</td>
	</tr>
	<tr>
		<td rowspan="14" width="81" height="466">		</td>
		<td colspan="8" rowspan="14" width="712" height="466" style="vertical-align:top" align="left"><div class="qiu"
						style="  position:absolute; top:30px; width:940px; left:20px;  vertical-align:top;  ">

						<div class="top_xinxi">

							<iframe name="ContentListframe"
								style="width:940px; height:350px; background-color:transparent; filter:chroma(color=#ffffff);vertical-align:top;  "
								src="messageMESSAGE.action?touser=${touser}" marginheight="0" scrolling="no"
								frameborder=0></iframe>
						
						
						</div>

						<div class="replay_text">
							<div class="replay_close">
								<img src="images/close2.png" width="16" height="16">
							</div>

							<div
								style="margin-left:35px; overflow-y:auto; width:883px; overflow-x:hidden; height:132px;">
								<table width="750" border="0" cellpadding="0" cellspacing="0"
									style=" margin-left:9px;">
									<%
									int i=1;
									for(QuickReplay quickReplay:quickReplays){ %>
									<tr>
										<td colspan="2" width="653" height="33" class="content_replay"><%=quickReplay.getReplay() %></td>
										<td colspan="3" width="122" height="33" class="icon_replay" onClick="quickreplay('<%=quickReplay.getReplay() %>')">快捷回复<%=i %></td>
									</tr><tr>
										<td colspan="5" width="775" height="11"></td>
									</tr>
									<%i++;} %>
								</table>

							</div>
							<div style="height:10px;">&nbsp;</div>
							<div class="content_shoutong">
								<textarea class="text_area" name="content" id="content"></textarea>
								<img class="img_replay" src="images/replay.png" width="64"
									height="61" onClick="javascript:speak()"> 
							</div>
						</div>
					</div>
		
		
		
		</td>
		<td rowspan="14" width="10" height="466">			</td>
		<td width="1" height="20">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="2" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list" onClick="location.href='message_release.jsp'">&nbsp;</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list" onClick="location.href='requestCUSTOMER.action'">&nbsp;</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list" onClick="location.href='history_info.jsp'">&nbsp;</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="42" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="2" width="208" height="228">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="172" alt=""></td>
	</tr>
	<tr>
		
		<td>
			<img src="images/分隔符.gif" width="1" height="56" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2" width="208" height="43" align="center">&nbsp;</td>
		<td rowspan="5" width="2" height="86">			</td>
		<td rowspan="2" width="103" height="43" align="center">&nbsp;</td>
		<td width="1" height="30">			</td>
	</tr>
	<tr>
		
		
		<td>
			<img src="images/分隔符.gif" width="1" height="13" alt=""></td>
	</tr>
	<tr>
		<td width="208" height="1">			</td>
		<td width="103" height="1">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="1" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2" width="208" height="42" align="center">&nbsp;</td>
		<td rowspan="2" width="103" height="42" align="center">&nbsp;</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="30" alt=""></td>
	</tr>
	<tr>
		
		
	</tr>
	<tr>
		<td>
			<img src="images/分隔符.gif" width="27" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="3" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="29" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="28" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="21" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="208" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="182" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="80" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="141" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="23" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="10" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="103" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="2" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="103" height="1" alt=""></td>
		<td></td>
	</tr>
</table>
	</div>
</body>
</html>