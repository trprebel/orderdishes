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
	line-height: 28px;
	border-top: 2px solid #c7c7c4;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating span {
	font-size: 12px;
	margin-left: 7px;
}

.list_operating0 {
	height: 62px;
	background: #FFFFFF;
	color: #555555;
	line-height: 60px;
	border-left: 2px solid #c7c7c4;
	border-right: 2px solid #c7c7c4
}

.list_operating0 table {
	margin-left: 30px;
}

.list_operating table {
	margin-left: 13px;
	margin-top: 6px
}

.bank {
	height: 8px;
}
</style>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.js"></script>
<script type="text/javascript">

function order(id)
{
	//alert(id);
	var postdata = {
  			drinksid :id
    	};
  	
		$.ajax({
     		type:'post',
     		data:postdata,
     		url:'orderDRINKS.action',
     		dataType:'json',
     		success:function(data){
     			//var obj = $.parseJSON(data);        
				alert(data);
				
     		},
    		error:function(){
       			alert("预定失败！");
    		}

    	});
}

</script>
</head>



<body>
	<form action="werequestDRINK.action?resultPage=wedrink" name="werequestform" id="werequestform">
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
			<div class="welcome_operating">XXX饭店/酒水:</div>
			
			<c:forEach var="drink" items="${paginator.items}">
			<div class="list_operating">
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td width="75" align="left"><img src="<%=basePath %>${drink.small_pic}"
							width="67" height="48" />
						</td>
						<td width="167" align="left"><div>
								${drink.drinks }<span>${drink.price}元&nbsp;
								<c:choose>
								<c:when test="${drink.num>10}">充足
								</c:when>
								<c:otherwise>${drink.num }
								</c:otherwise>
								</c:choose>
								</span><br /> <img src="images/button.png"
									width="47" height="20" onclick="order('${drink.drinksid}')"/>
							</div>
						</td>
						<td width="25"><img src="images/left_arrow.png" width="11"
							height="17" />
						</td>
					</tr>
				</table>
			</div>
			</c:forEach>
			
			<div class="bottom_opreating"></div>
		</div>
	</div>
	</form>
</body>
</html>
