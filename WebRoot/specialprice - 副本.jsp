<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.Paginator;"%>
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%@taglib prefix="fn" uri="/jstl/fn.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Object object = (Object) request.getAttribute("paginator");
	Paginator paginator = null;
	if (object == null) {//创建默认值
		paginator = new Paginator(6);
	} else {
		paginator = (Paginator) request.getAttribute("paginator");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>bg_login1</title>
<style>
body{ text-align:center;}
.main{width:961px;
height:631px;
margin:0px auto;
display:block;
background:url(images/bg_info_special.png) no-repeat;
position:relative;
top:-15px;

}
.01{*position:relative; *top:-4px;
width:961px;
height:631px;
margin-top:0px;
display:block;

}
.login_input_info{ width:450px; height:38px;  line-height:38px; margin-left:10px; border:0px; margin-bottom:10px; background-color:#2eb376; font-size:24px; color:#FFFFFF; font-weight:bold}
.login_input{ width:270px; height:28px; line-height:28px; border:0px; background-color:#f1f1f1; font-size:16px;  color:#999999}
.text_foot{font-size:20px; color:#e1e1e1; font-weight:bold; line-height:25px;}
.list{ font-size:18px; cursor:pointer; color:#e2e2e2; font-weight:bold; height:40px; line-height:40px;}
.list:hover{ background:url(images/bg_list.png) repeat}
.list img{ margin-right:22px; vertical-align:middle}
.list_h{font-size:18px; cursor:pointer; color:#e2e2e2; font-weight:bold; height:40px; line-height:40px; background:url(images/bg_list.png) repeat}
.list_h img{ margin-right:22px; vertical-align:middle}
.infr_instroy{ font-size:18px; width:300px;  color:#90a5c1; font-weight:bold; position:absolute; top:85px;}
.tab_info td{ border:2px solid #ffffff; height:50px; line-height:50px; font-size:18px; color:#FFFFFF; font-weight:bold; text-align:center}
.qiu li{
width:205px; height:147px;  list-style:none; float:left; background:url(images/add.png) no-repeat; margin-right:8px; margin-left:10px; margin-bottom:19px; overflow:hidden
}
.name span{ float:left; width:100px; margin-left:2px;}
.name{	font-size: 14px;
	position: relative;
	top: -13px;
	*top: -20px;
	float: left;
	font-weight: bold;
	color: #a9bfdb;
	line-height: 22px;}
.name img{ float:right; margin-top:1px;}
#position{position:relative; top:-124px; right:-190px;}
.special_carte{ position:absolute; height:95px; width:680px; top:128px; *top:142px; left:50px; display:inline}
.text_area{ border:0px; float:left; width:517px; height:95px; *position:relative; *top:-9px;background:#d4d9df }
.special_carte_explain{ color:#d9dddf; font-weight:bold; font-size:20px; vertical-align:top}
</style>

</head>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script src="<%=basePath%>js/page.js" language="JavaScript"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
function deletefood(id) {
	document.getElementById("foodid").value = id;
	//alert($("#foodid").val());
	var f1 = document.getElementById("requestform");
	f1.action = "deleteFOOD.action";
	f1.submit();
	//alert("deletefood");
}
</script>
<body>
<div class="main">
	<form action="specialprice" name="specialprice" id="specialprice">
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
		<td height="68" colspan="4" width="491" rowspan="4"><input name="textfield" type="text" class="login_input_info" value="暂无处理信息"></td>
		<td rowspan="3" width="141" height="57">	<img src="images/handing.png" width="141" height="57">		</td>
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
		<td colspan="4" rowspan="2" width="81" height="24"><div class="infr_instroy">菜谱管理→今日特价</div></td>
		<td colspan="3" rowspan="5" width="470" height="80">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="14" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4" width="241" height="66">			</td>
		<td colspan="3" rowspan="2" width="208" height="42" align="center" class="list" onClick="location.href='request1FOOD.action'"><img src="images/icon1.png" width="18" height="19">所有菜管理</td>
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
		<td colspan="3" rowspan="2" width="208" height="42" align="center" class="list" ><img src="images/icon7.png" width="21" height="20">特色菜管理</td>
		<td width="1" height="22">			</td>
	</tr>
	<tr>
		<td rowspan="14" width="81" height="466">		</td>
		<td colspan="8" rowspan="10" width="712" height="410" style="vertical-align:top" align="left">
		
		<div class="special_carte">
		<table cellpadding="0" cellspacing="0" width="680" height="95">
		<tr><td width="131" class="special_carte_explain">特价说明</td>
		<td width="547"><textarea class="text_area" name="textarea"></textarea></td>
		</tr>
		</table>
		
		
		</div>
		
		
		
		<div class="qiu" style=" width:712px; margin-top:78px; *position:relative; *top:78px; vertical-align:top; ">
<ul>
<c:forEach var="food" items="${paginator.items}">
							<li>
								<div>
									<img src="${food.small_pic} " width="205" height="125"><img
										id="position" src="images/close.png" width="14" height="15" onclick=" javascirpt:deletefood('${food.foodid}')">
								</div>
								<div class="name">
									<span>${food.food }</span><span><img src="images/modify.png"
										width="33" height="17">
									</span>
								</div></li>
							
							
							</c:forEach>

</ul>


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
		<td colspan="3" width="208" height="42" align="center" class="list_h" onclick="location.href='specialprice.action'"><img src="images/icon6.png" width="20" height="20">今日特价&nbsp;&nbsp;</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list"></td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list"></td>
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
		<td rowspan="2" width="208" height="43" align="center"><a
						href='javascript:goPage(<%=paginator.getCurrentPage() - 1%>)'>
							<%
								if (paginator.getCurrentPage() != 1) {
									out.print("<img src='images/last.png' style='*margin-bottom:10px;' border='0' width='78' height='20'>");
								}
							%> </a></td>
		<td rowspan="5" width="2" height="86">			</td>
		<td rowspan="2" width="103" height="43" align="center"><input
						name='paginator.currentPage' id='paginator.currentPage'
						type='hidden' value='<%=paginator.getCurrentPage()%>' /> <a
						href='javascript:goPage(<%=paginator.getCurrentPage() + 1%>)'>
							<%
								if (paginator.getCurrentPage() < paginator.getTotalPages()
										|| (paginator.getItems().size() == 9)) {
									out.print("<img src='images/next.png' style='*margin-bottom:10px;' border='0' width='81' height='20'>");
								}
							%> </a></td>
		<td width="1" height="30">			</td>
	</tr>
	<tr>
		<td colspan="4" rowspan="4" width="712" height="56">			</td>
		<td rowspan="3" width="182" height="44" style="vertical-align:top"></td>
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
		<td rowspan="2" width="208" height="42" align="center"><img src="images/home.png" width="73" height="22" onClick="location.href='requestFOOD.action'">			</td>
		<td rowspan="2" width="103" height="42" align="center"><img src="images/back.png" width="72" height="20" onClick="location.href=document.referrer">		</td>
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
</form>
</div>
</body>
</html>