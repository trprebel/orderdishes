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
		<title>客户管理</title>
		<style>
body {
	text-align: center;
}

.main {
	width: 961px;
	height: 631px;
	margin: 0px auto;
	display: block;
	background: url(images/bg_info_d.png) no-repeat;
	position: relative;
	top: -15px;
}

.01 { *
	position: relative; *
	top: -4px;
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
	line-height: 28px;
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
	color: #90a5c1;
	font-weight: bold
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
</style>
	</head>
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
		<td height="68" colspan="4" width="491" rowspan="4"><input name="textfield" type="text" class="login_input_info"
							value="${msgs }"></td>
		<td rowspan="3" width="141" height="57">	<img src="images/handing.png" width="141" height="57" style="cursor:pointer" onClick="location.href='requestlistMESSAGE.action'">		</td>
		<td colspan="5" rowspan="5" width="241" height="82">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="15" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="3" width="960" height="53">	  </td>
		<td width="28" height="28"><img src="images/qu.png" width="28" height="28">			</td>
		
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
		<td colspan="4" rowspan="2" width="81" height="24" class="infr_instroy">客户管理</td>
		<td colspan="3" rowspan="5" width="470" height="80">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="14" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4" width="241" height="66">			</td>
			<td colspan="3" rowspan="2" width="208" height="42" align="center"
						class="list" onClick="location.href='requestFOOD.action'">
						<img src="images/icon1.png" width="18" height="19">
						菜谱管理
					</td>
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
						class="list" onClick="location.href='requestDRINKS.action'">
						<img src="images/icon2.png" width="21" height="20">
						酒水管理
					</td>
		<td width="1" height="22">			</td>
	</tr>
	<tr>
		<td rowspan="14" width="81" height="466">		</td>
		<td colspan="8" rowspan="8" width="712" height="324" style="vertical-align:top" align="center"><div style=" HEIGHT: 324; margin-right:30px; vertical-align:top; OVERFLOW: scroll; OVERFLOW-x:hidden; scrollbar-3dlight-color:#595959; scrollbar-arrow-color:#FFFFFF; scrollbar-base-color:#CFCFCF; scrollbar-darkshadow-color:#FFFFFF; scrollbar-face-color:#CFCFCF; scrollbar-highlight-color:#FFFFFF; scrollbar-shadow-color:#595959">
>
		<table cellpadding="0" cellspacing="0" class="tab_info"
								style="border-collapse: collapse">
								<tr>
									<td width="110">
										姓名
									</td>
									<td width="100">
										手机号
									</td>
									<td width="100">&nbsp;
										
									</td>
									<td width="100">&nbsp;
										
									</td>
									<td width="100">&nbsp;
										
									</td>
									<td width="100">&nbsp;
										
									</td>

								</tr>
								<c:forEach var="customer" items="${customers}">
								<tr>
									<td>
										${customer.customer }
									</td>
									<td>
										${customer.mobile }
									</td>
									<td>&nbsp;
										
									</td>
									<td>&nbsp;
										
									</td>
									<td>&nbsp;
										
									</td>
									<td>&nbsp;
										
									</td>
								</tr>
								</c:forEach>
							
		  </table>
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
		<td colspan="3" width="208" height="42" align="center"
						class="list" onClick="location.href='message_release.jsp'">
						<img src="images/icon3.png" width="20" height="14">
						信息发布
					</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list_h">
						<img src="images/icon4.png" width="20" height="20">
						客户管理
					</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list" onClick="location.href='history_info.jsp'">
						<img src="images/icon5.png" width="20" height="20">
						历史信息
					</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="42" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="2" width="208" height="228" align="center" style="vertical-align:top; " onclick="location.href='requestFEEDBACK.action'"><div class="list" style="height:42px;" ><img src="images/icon7.png" width="20" height="23"> 反馈信息</div>			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="172" alt=""></td>
	</tr>
	<tr>
		<td colspan="8" rowspan="2" width="712" height="86">			</td>
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
		<td colspan="4" rowspan="4" width="712" height="56">			</td>
		<td rowspan="3" width="182" height="44" style="vertical-align:top"><img src="images/tab.png" width="180" height="41" style="cursor:pointer" onClick="location.href='exportCUSTOMER.action'"> </td>
		<td colspan="3" rowspan="4" width="289" height="56">			</td>
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
		<td rowspan="2" width="208" height="42" align="center"><img src="images/home.png" width="73" height="22" onClick="location.href='requestFOOD.action'" style="cursor:pointer">			</td>
		<td rowspan="2" width="103" height="42" align="center"><img src="images/back.png" width="72" height="20" onClick="location.href=document.referrer" style="cursor:pointer">		</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="30" alt=""></td>
	</tr>
	<tr>
		<td width="182" height="12">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="12" alt=""></td>
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