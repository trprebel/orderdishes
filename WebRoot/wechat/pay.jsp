<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%@taglib prefix="fn" uri="/jstl/fn.tld"%>
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
	padding-left: 15px;
	width: 267px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating {
	height: 36px;
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
	margin-left: 11px;
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
.carte_input{ height:26px; text-align:right; line-height:26px; border:0px; color:#555555; font-weight:bold; font-size:16px;}
</style>
<script type="text/javascript">
function addition(i)
{
	var count=document.getElementById("count"+i);
	var count1=document.getElementById("count1"+i);
	var total=document.getElementById("total"+i);
	var price=document.getElementById("price"+i).value;
	count.value=parseInt(count.value)+1;
	count1.value=count.value;
	total.value=parseInt(total.value)+parseInt(price);
	totalpay();
	//alert(total);
}
function subtraction(i)
{
	var count=document.getElementById("count"+i);
	var count1=document.getElementById("count1"+i);
	var total=document.getElementById("total"+i);
	var price=document.getElementById("price"+i).value;
	if(parseInt(count.value)>0)
	{
		count.value=parseInt(count.value)-1;
		count1.value=count.value;
		total.value=parseInt(total.value)-parseInt(price);
		totalpay();
	}
	
}
function totalpay()
{
	var totalnum="${fn:length(myorders)}";
	//alert(totalnum);
	var totalpay=document.getElementById("totalpay");
	totalpay.value=0;
	for(var i=0;i<totalnum;i++)
	{
		total=document.getElementById("total"+i);//某个菜的总价
		totalpay.value=parseInt(totalpay.value)+parseInt(total.value);
	}
}
function submit()
{
	var f1=document.getElementById("accountform");
	f1.submit();
}

</script>
</head>

<body>
	<div class="main">
		<div class="top">
			<div class="top_back">
				<img src="images/back.png" width="49" height="21"
					onclick="history.go(-1)" />
			</div>
			<div class="top_title">饭店名称</div>
		</div>
		<div class="bank"></div>
		<div class="operating">
			<div class="top_opreating"></div>
			<div class="welcome_operating">XXX饭店/买单速算</div>
			<div class="bottom_opreating"></div>
		</div>
		<div class="operating">
			<div class="top_opreating"></div>
			<div class="list_operating0">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="379" align="left">请选择您的消费：</td>
					</tr>
				</table>
			</div>
			<c:forEach var="food" items="${myorders}" varStatus="i">
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="120" align="left">菜名:${food.food }</td>
						<td width="72" align="right"><div><input id="count1${i.index }" name="count1" type="text" class="carte_input" value="${food.count }" style="width:20px;" readonly="readonly" />份</div>
						</td>
						<td width="80"><img src="images/jian.png" width="33"
							height="25" onclick="subtraction('${i.index}')"/><img src="images/jia.png" width="33" height="25" onclick="addition('${i.index}')"/>
						</td>
					</tr>
				</table>
			</div>
			</c:forEach>
			<div class="bottom_opreating"></div>
		</div>
		<form action="payORDER.action" name="accountform" id="accountform">
		<div class="operating">
			<div class="top_opreating"></div>
			<div class="list_operating2">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="379" align="left">您的消费清单如下：</td>
					</tr>
				</table>
			</div>

				<c:forEach var="food" items="${myorders}" varStatus="i">
					<div class="list_operating3">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td align="left">菜名:${food.food }&nbsp;
								<input id="count${i.index }" name="count"
									type="text" class="carte_input" value="${food.count }"
									style="width:35px;" readonly="readonly" />份&nbsp;
									<input id="total${i.index }"
									name="total" type="text" class="carte_input"
									value="${food.price }" style="width:68px;" readonly="readonly" />元
								<input type="hidden" id="foodid${i.index }" name="foodid"
									value="${food.foodid }" />
									<input type="hidden" id="price${i.index }" name="price"
									value="${food.price }" /> <input type="hidden"
									id="type${i.index }" name="type" value="${food.type }" />
								</td>
							</tr>
						</table><%--
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td width="160" align="left">菜名:${food.food } <!-- <input type="text" id="food${i.index }" name="food" value="${food.food }"/> -->
									<input type="hidden" id="foodid${i.index }" name="foodid"
									value="${food.foodid }" /></td>
								<td width="102" align="right"><div>
										<input id="count${i.index }" name="count" type="text"
											class="carte_input" value="${food.count }"
											style="width:35px;" readonly="readonly" />份&nbsp;
									</div></td>
								<td width="117" align="center"><input id="total${i.index }"
									name="total" type="text" class="carte_input"
									value="${food.price }" style="width:68px;" readonly="readonly" />元
									<input type="hidden" id="price${i.index }" name="price"
									value="${food.price }" /> <input type="hidden"
									id="type${i.index }" name="type" value="${food.type }" /></td>
							</tr>
						</table>
					--%></div>
				</c:forEach>
				<div class="bottom_opreating"></div>
		</div>
		<div class="list_operating4">
			总计消费:<input name="totalpay" id="totalpay" type="text" class="carte_input" value="" style="width:68px; background-color:#e0e1dc" readonly="readonly" />元<img src="images/submit.png" width="96" height="32" onclick="submit()"/>
			
		</div>
	</form>
	</div>
<script type="text/javascript">
totalpay();
</script>
</body>
</html>
