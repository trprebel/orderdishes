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
		paginator = new Paginator(9);
	} else {
		paginator = (Paginator) request.getAttribute("paginator");
	}
	//System.out.println(paginator.getItems().size());
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>所有菜管理</title>
<style>
body {
	text-align: center;
}

.main {
	width: 961px;
	height: 631px;
	margin: 0px auto;
	display: block;
	background: url(images/bg_info.png) no-repeat;
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
</style>
</head>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script src="<%=basePath%>js/page.js" language="JavaScript"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	//if(${fn:length(food)}<2)
	//{
	//	alert("${fn:length(food)}");
	//}
	
	function addfood()
	{
		alert("addfood");
	}
	function deletefood(id)
	{
		document.getElementById("foodid").value=id;
		//alert($("#foodid").val());
		var f1=document.getElementById("requestform");
		f1.action="deleteFOOD.action";
		f1.submit();
		//alert("deletefood");
	}
	function modifyfood(id)
	{
		document.getElementById("foodid").value=id;
		//alert($("#foodid").val());
		var f1=document.getElementById("requestform");
		f1.action="requestoneFOOD.action";
		f1.submit();
		//alert("deletefood");
	}
</script>
<body>
	<div class="main">
		<form action="requestFOOD.action" id="requestform" method="post">
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
		<td height="68" colspan="4" width="491" rowspan="4"><input
						name="textfield" type="text" class="login_input_info"
						value="${msgs }"></td>
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
		<td colspan="4" rowspan="2" width="81" height="24" ><div class="infr_instroy">菜谱管理</div></td>
		<td colspan="3" rowspan="5" width="470" height="80">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="14" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4" width="241" height="66">			</td>
<td colspan="3" rowspan="2" width="208" height="42" align="center"
						class="list" onClick="location.href='request1FOOD.action'"><img src="images/icon1.png" width="18"
						height="19"> 菜谱管理</td>
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
						class="list" onClick="location.href='requestDRINKS.action'"><img src="images/icon2.png" width="21"
						height="20" > 酒水管理</td>
		<td width="1" height="22">			</td>
	</tr>
	<tr>
		<td rowspan="14" width="81" height="466">		</td>
		<td colspan="8" rowspan="14" width="712" height="466" style="vertical-align:top" align="left"><div class="qiu"
							style=" HEIGHT: 466; position:absolute; top:110px; width:712px;  vertical-align:top; ">
							<ul>
								<!-- 菜单列表 -->
								<c:forEach var="food" items="${paginator.items}" varStatus="i">
									<li>
										<div>
											<img src="${food.small_pic} " width="205" height="125">
											<img id="position" src="images/close.png" width="14"
												height="15"
												onclick=" javascirpt:deletefood('${food.foodid}')">
										</div>
										<div class="name">
											<span>${food.food }</span><span><img
												src="images/modify.png" width="33" height="17"
												onclick=" javascirpt:modifyfood('${food.foodid}')"> </span>
										</div>
									</li>

								</c:forEach>
								
								<c:if test="${fn:length(paginator.items)<9}">
									<li onClick="location.href='add_food.jsp'"></li>
								</c:if>

							</ul>
							<input type="hidden" name="foodid" id="foodid" value="123" />


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
	<tr><td colspan="3" width="208" height="42" align="center"
						class="list" onClick="location.href='message_release.jsp'"><img src="images/icon3.png" width="20"
						height="14"> 信息发布</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list" onClick="location.href='requestCUSTOMER.action'">
						<img src="images/icon4.png" width="20" height="20"> 客户管理</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list" onClick="location.href='history_info.jsp'">
						<img src="images/icon5.png" width="20" height="20"> 历史信息</td>
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
						if(paginator.getCurrentPage()!=1)
						{
							out.print("<img src='images/last.png' style='*margin-bottom:10px;' border='0' width='78' height='20'>");
						} 
						%>
						</a>		</td>
		<td rowspan="5" width="2" height="86">			</td>
		<td rowspan="2" width="103" height="43" align="center"><input
						name='paginator.currentPage' id='paginator.currentPage'
						type='hidden' value='<%=paginator.getCurrentPage()%>' /> <a
						href='javascript:goPage(<%=paginator.getCurrentPage() + 1%>)'>
						<%
						if(paginator.getCurrentPage()<paginator.getTotalPages()||(paginator.getItems().size()==9))
						{
							out.print("<img src='images/next.png' style='*margin-bottom:10px;' border='0' width='81' height='20'>");
						} 
						%>	 </a>	</td>
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
		<td rowspan="2" width="208" height="42" align="center"><img
						style="*margin-bottom:15px;" src="images/home.png" width="73"
						height="22" onClick="location.href='requestFOOD.action'">			</td>
		<td rowspan="2" width="103" height="42" align="center"><img
						style="*margin-bottom:15px;" src="images/back.png" width="72"
						height="20" onClick="location.href=document.referrer">		</td>
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
		</form>
	</div>
</body>
</html>