<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>MessageRelease</title>
<style>
body {
	text-align: center;
}

.main {
	width: 961px;
	height: 631px;
	margin: 0px auto;
	display: block;
	background: url(images/bg_release.png) no-repeat;
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
	background-color: #2eb376;
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
	width: 467px;
	height: 65px;
	background: #eaedf1
}

.top_xinxi {
	height: 250px;
	overflow-y: auto;
	overflow-x: hidden;
	margin-top: 10px;
	margin-bottom: 14px;
	width: 715px;
	background: url(images/bg_line.png) center repeat-y;
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
	width: 718px;
	height: 240px;
}

.replay_close {
	margin-left: 702px;
	position: relative;
	top: -1px;
	margin-bottom: 2px;
}

.img_replay {
	float: left;
	margin-left: 40px;
}

.icon_replay {
	width: 122px;
	height: 33px;
	text-align: center;
	line-height: 33px;
	font-size: 18px;
	color: #515151;
	font-weight: bold;
	background: url(images/button.png) center center no-repeat
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

.title_xinxi {
	color: #d9dddf;
	font-size: 20px;
	text-align: center;
	font-weight: bold
}

.content_release {
	width: 517px;
	height: 38px;
	font-size: 15px;
	font-weight: bold;
	border: 0px;
	background-color: #d4d9df
}
</style>
</head>
<body>
	<div class="main">
	<form action="releaseINFORMATION.action" id="realeaseform">
		<table class="01" width="961" height="631" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td colspan="14" width="960" height="16"></td>
				<td><img src="images/分隔符.gif" width="1" height="16" alt="">
				</td>
			</tr>
			<tr>
				<td width="960" height="15"></td>
				<td width="81" height="15"></td>
				<td width="712" height="15"></td>
				<td width="28" height="15"></td>
				<td height="68" colspan="4" width="491" rowspan="4"><input
					name="textfield" type="text" class="login_input_info"
					value="暂无处理信息">
				</td>
				<td rowspan="3" width="141" height="57"><img
					src="images/handing.png" width="141" height="57"></td>
				<td colspan="5" rowspan="5" width="241" height="82"></td>
				<td><img src="images/分隔符.gif" width="1" height="15" alt="">
				</td>
			</tr>
			<tr>
				<td colspan="3" rowspan="3" width="960" height="53"></td>
				<td width="28" height="28"><img src="images/qu.png" width="28"
					height="28">
				</td>

				<td><img src="images/分隔符.gif" width="1" height="28" alt="">
				</td>
			</tr>
			<tr>
				<td rowspan="2" width="28" height="25"></td>
				<td><img src="images/分隔符.gif" width="1" height="14" alt="">
				</td>
			</tr>
			<tr>
				<td rowspan="6" width="141" height="91"></td>
				<td><img src="images/分隔符.gif" width="1" height="11" alt="">
				</td>
			</tr>
			<tr>
				<td rowspan="19" width="960" height="546"></td>
				<td colspan="4" rowspan="2" width="81" height="24"><div
						class="infr_instroy">信息发布</div>
				</td>
				<td colspan="3" rowspan="5" width="470" height="80"></td>
				<td><img src="images/分隔符.gif" width="1" height="14" alt="">
				</td>
			</tr>
			<tr>
				<td colspan="2" rowspan="4" width="241" height="66"></td>
				<td colspan="3" rowspan="2" width="208" height="42" align="center"
					class="list" onclick="location.href='requestFOOD.action'"><img src="images/icon1.png" width="18"
					height="19">菜谱管理</td>
				<td width="1" height="10"></td>
			</tr>
			<tr>
				<td colspan="4" rowspan="3" width="81" height="56"></td>
				<td><img src="images/分隔符.gif" width="1" height="32" alt="">
				</td>
			</tr>
			<tr>
				<td colspan="3" width="208" height="2"></td>
				<td><img src="images/分隔符.gif" width="1" height="2" alt="">
				</td>
			</tr>
			<tr>
				<td colspan="3" rowspan="2" width="208" height="42" align="center"
					class="list" onclick="location.href='requestDRINKS.action'"><img src="images/icon2.png" width="21"
					height="20">酒水管理</td>
				<td width="1" height="22"></td>
			</tr>
			<tr>
				<td rowspan="14" width="81" height="466"></td>
				<td colspan="8" rowspan="14" width="712" height="466"
					style="vertical-align:top" align="left"><div class="qiu"
						style="  position:absolute; top:122px; width:712px;  vertical-align:top; left:41px;  ">

						<table width="679" height="499" border="0" cellpadding="0"
							cellspacing="0">
							<tr>
								<td colspan="7" width="678" height="4"></td>
								<td width="1" height="4"></td>
							</tr>
							<tr>
								<td rowspan="22" width="7" height="495"></td>
								<td rowspan="2" width="110" height="40" class="title_xinxi">招聘信息
								</td>
								<td colspan="5" width="561" height="6"></td>
								<td width="1" height="6"></td>
							</tr>
							<tr>
								<td rowspan="21" width="23" height="489"></td>
								<td colspan="3" rowspan="2" width="517" height="39"><textarea
										class="content_release" name="infodesc"></textarea>
										</td>
								<td rowspan="21" width="21" height="489"></td>
								<td width="1" height="34"></td>
							</tr>
							<tr>
								<td rowspan="2" width="110" height="45"></td>
								<td width="1" height="5"></td>
							</tr>
							<tr>
								<td colspan="3" rowspan="2" width="517" height="46"></td>
								<td width="1" height="40"></td>
							</tr>
							<tr>
								<td rowspan="2" width="110" height="40" class="title_xinxi">位置信息
								</td>
								<td width="1" height="6"></td>
							</tr>
							<tr>
								<td colspan="3" rowspan="2" width="517" height="40"><textarea
										class="content_release" name="infodesc"></textarea>
										</td>
								<td width="1" height="34"></td>
							</tr>
							<tr>
								<td rowspan="2" width="110" height="46"></td>
								<td width="1" height="6"></td>
							</tr>
							<tr>
								<td colspan="3" rowspan="2" width="517" height="45"></td>
								<td width="1" height="40"></td>
							</tr>
							<tr>
								<td rowspan="2" width="110" height="41" class="title_xinxi">免费停车
								</td>
								<td width="1" height="5"></td>
							</tr>
							<tr>
								<td colspan="3" rowspan="2" width="517" height="39"><textarea
										class="content_release" name="infodesc"></textarea></td>
								<td><img src="images/分隔符.gif" width="1" height="36" alt="">
								</td>
							</tr>
							<tr>
								<td rowspan="2" width="110" height="42"></td>
								<td width="1" height="3"></td>
							</tr>
							<tr>
								<td colspan="3" rowspan="2" width="517" height="46"></td>
								<td width="1" height="39"></td>
							</tr>
							<tr>
								<td rowspan="2" width="110" height="41" class="title_xinxi">促销信息
								</td>
								<td width="1" height="7"></td>
							</tr>
							<tr>
								<td colspan="3" rowspan="2" width="517" height="39"><textarea
										class="content_release" name="infodesc"></textarea></td>
								<td width="1" height="34"></td>
							</tr>
							<tr>
								<td rowspan="2" width="110" height="44"></td>
								<td width="1" height="5"></td>
							</tr>
							<tr>
								<td colspan="3" rowspan="2" width="517" height="47"></td>
								<td width="1" height="39"></td>
							</tr>
							<tr>
								<td rowspan="2" width="110" height="41" class="title_xinxi">其它信息
								</td>
								<td width="1" height="8"></td>
							</tr>
							<tr>
								<td colspan="3" rowspan="2" width="517" height="39"><textarea
										class="content_release" name="infodesc"></textarea></td>
								<td width="1" height="33"></td>
							</tr>
							<tr>
								<td rowspan="4" width="110" height="115"></td>
								<td width="1" height="6"></td>
							</tr>
							<tr>
								<td colspan="3" width="517" height="61"></td>
								<td width="1" height="61"></td>
							</tr>
							<tr>
								<td rowspan="2" width="103" height="48"></td>
								<td width="188" height="46" align="center"><img border="0"
									src="images/compl.png" width="180" height="44" onclick="submit()"></td>
								<td rowspan="2" width="226" height="48"></td>
								<td width="1" height="46"></td>
							</tr>
							<tr>
								<td width="188" height="2"></td>
								<td width="1" height="2"></td>
							</tr>
						</table>
					</div></td>
				<td rowspan="14" width="10" height="466"></td>
				<td width="1" height="20"></td>
			</tr>
			<tr>
				<td colspan="3" width="208" height="2"></td>
				<td><img src="images/分隔符.gif" width="1" height="2" alt="">
				</td>
			</tr>
			<tr>
				<td colspan="3" width="208" height="42" align="center" class="list_h"><img
					src="images/icon3.png" width="20" height="14">信息发布</td>
				<td width="1" height="42"></td>
			</tr>
			<tr>
				<td colspan="3" width="208" height="2"></td>
				<td width="1" height="2"></td>
			</tr>
			<tr>
				<td colspan="3" width="208" height="42" align="center" class="list" onclick="location.href='requestCUSTOMER.action'"><img
					src="images/icon4.png" width="20" height="20">客户管理</td>
				<td width="1" height="42"></td>
			</tr>
			<tr>
				<td colspan="3" width="208" height="2"></td>
				<td width="1" height="2"></td>
			</tr>
			<tr>
				<td colspan="3" width="208" height="42" align="center" class="list" onclick="location.href='history_info.jsp'"><img
					src="images/icon5.png" width="20" height="20">历史信息</td>
				<td><img src="images/分隔符.gif" width="1" height="42" alt="">
				</td>
			</tr>
			<tr>
				<td colspan="3" rowspan="2" width="208" height="228"></td>
				<td><img src="images/分隔符.gif" width="1" height="172" alt="">
				</td>
			</tr>
			<tr>

				<td><img src="images/分隔符.gif" width="1" height="56" alt="">
				</td>
			</tr>
			<tr>
				<td rowspan="2" width="208" height="43" align="center"><img
					style="*margin-bottom:10px;" src="images/last.png" width="78"
					height="20"></td>
				<td rowspan="5" width="2" height="86"></td>
				<td rowspan="2" width="103" height="43" align="center"><img
					style="*margin-bottom:10px;" src="images/next.png" width="81"
					height="20"></td>
				<td width="1" height="30"></td>
			</tr>
			<tr>


				<td><img src="images/分隔符.gif" width="1" height="13" alt="">
				</td>
			</tr>
			<tr>
				<td width="208" height="1"></td>
				<td width="103" height="1"></td>
				<td><img src="images/分隔符.gif" width="1" height="1" alt="">
				</td>
			</tr>
			<tr>
				<td rowspan="2" width="208" height="42" align="center"><img
					style="*margin-bottom:15px;" src="images/home.png" width="73"
					height="22"></td>
				<td rowspan="2" width="103" height="42" align="center"><img
					style="*margin-bottom:15px;" src="images/back.png" width="72"
					height="20"></td>
				<td><img src="images/分隔符.gif" width="1" height="30" alt="">
				</td>
			</tr>
			<tr>


			</tr>
			<tr>
				<td><img src="images/分隔符.gif" width="27" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="3" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="29" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="28" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="21" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="208" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="182" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="80" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="141" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="23" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="10" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="103" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="2" height="1" alt="">
				</td>
				<td><img src="images/分隔符.gif" width="103" height="1" alt="">
				</td>
				<td></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>