<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	background: url(images/bg_login1.png) no-repeat;
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
	border: 0px;
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
</style>
</head>
<script type="text/javascript">
	function login() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var cpassword = /^[0-9]{1,20}$/;
		var cusername = /^[A-Za-z0-9]+$/;
		//alert(username);
		//alert(password);
		if (username == "") {
			alert("用户名不能为空！");
			return;
		} else if (!cusername.exec(username)) {
			alert("用户名由20位以内数字和字母组成！");
			return;
		}
		if (password == "") {
			alert("密码不能为空！");
			return;
		} else if (!cpassword.exec(password)) {
			alert("密码由6位以内数字组成！");
			return;
		}
		var f1 = document.getElementById("loginform");
		f1.action = "login.action";
		f1.submit();
	}
</script>
<body>
	<div class="main">
		<form action="login.action" id="loginform" name="loginform"
			method="post">
			<table class="01" width="961" height="631" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="16" width="960" height="16">
			</td>
		<td width="1" height="16">
			</td>
	</tr>
	<tr>
		<td colspan="11" width="578" height="10">
	  </td>
		<td rowspan="5" width="141" height="57"><img src="images/handing.png" width="141" height="57">			</td>
		<td colspan="4" rowspan="6" width="241" height="82">
	  </td>
		<td width="1" height="10">
	  </td>
	</tr>
	<tr>
		<td colspan="3" width="97" height="5">
			</td>
		<td colspan="6" rowspan="3" width="450" height="38"><input
						name="textfield" type="text" class="login_input_info"
						value="暂无处理信息">
	  </td>
		<td colspan="2" rowspan="12" width="31" height="227">
			</td>
		<td width="1" height="5">
			</td>
	</tr>
	<tr>
		<td rowspan="25" width="59" height="599">
	  </td>
		<td width="28" height="28"><img src="images/qu.png" width="28" height="28">			</td>
		<td rowspan="25" width="10" height="599">
	  </td>
		<td width="1" height="28">
	  </td>
	</tr>
	<tr>
		<td rowspan="24" width="28" height="571">
			</td>
		<td width="1" height="5">
			</td>
	</tr>
	<tr>
		<td colspan="6" rowspan="9" width="450" height="189">
			</td>
		<td width="1" height="9">
			</td>
	</tr>
	<tr>
		<td rowspan="22" width="141" height="557">
			</td>
		<td width="1" height="25">
			</td>
	</tr>
	<tr>
		<td rowspan="21" width="33" height="532">
	  </td>
		<td colspan="3" width="208" height="42" align="center" class="list"><img src="images/icon1.png" width="18" height="19">菜谱管理</td>
		<td width="1" height="42">
	  </td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">
			</td>
		<td width="1" height="2">
			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list"><img src="images/icon2.png" width="21" height="20">酒水管理</td>
		<td width="1" height="42">
	  </td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">
			</td>
		<td width="1" height="2">
			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list_h"><img src="images/icon3.png" width="20" height="14">信息发布</td>
		<td width="1" height="42">
	  </td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">
			</td>
		<td width="1" height="2">
			</td>
	</tr>
	<tr>
		<td colspan="3" rowspan="2" width="208" height="42" align="center" class="list"><img src="images/icon4.png" width="20" height="20">客户管理</td>
		<td width="1" height="23">
	  </td>
	</tr>
	<tr>
		<td colspan="2" rowspan="9" width="184" height="285">
			</td>
		<td colspan="5" rowspan="3" width="270" height="28"><input
						type="text" class="login_input" name="username" id="username">			</td>
		<td rowspan="14" width="27" height="377">
			</td>
		<td width="1" height="19">
			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">
			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="2" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="3" width="208" height="42" align="center" class="list"><img src="images/icon5.png" width="20" height="20">历史信息</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="7" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" width="270" height="34">
			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="34" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" rowspan="2" width="270" height="29"><input
						type="password" class="login_input" name="password" id="password">
	  </td>
		<td>
			<img src="images/分隔符.gif" width="1" height="1" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="5" width="208" height="228">
			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="28" alt=""></td>
	</tr>
	<tr>
		<td colspan="5" width="270" height="26">
			</td>
		<td width="1" height="26">
			</td>
	</tr>
	<tr>
		<td rowspan="2" width="3" height="168">
	  </td>
		<td width="189" height="50" align="center"><img
						src="images/login.png" width="182" height="45"
						onClick="javascript:login()">			</td>
		<td colspan="3" rowspan="2" width="78" height="168">
	  </td>
		<td width="1" height="50">
	  </td>
	</tr>
	<tr>
		<td width="189" height="118">
			</td>
		<td width="1" height="118">
		</td>
	</tr>
	<tr>
		<td rowspan="5" width="101" height="92">
			</td>
		<td colspan="4" rowspan="4" width="348" height="58" class="text_foot">欢迎使用xxx管理系统 V1.01.01
由XX公司提供    XXX@abc.com
			</td>
		<td colspan="2" rowspan="5" width="5" height="92">
			</td>
		<td width="1" height="6">
			</td>
	</tr>
	<tr>
		<td width="103" height="43" align="center"><img src="images/last.png" width="78" height="20">			</td>
		<td rowspan="4" width="2" height="86">
	  </td>
		<td width="103" height="43" align="center"><img src="images/next.png" width="81" height="20">	  </td>
		<td width="1" height="43">
	  </td>
	</tr>
	<tr>
		<td width="103" height="1">
			</td>
		<td width="103" height="1">
			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="1" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2" width="103" height="42" align="center"><img src="images/home.png" width="73" height="22">			</td>
		<td rowspan="2" width="103" height="42" align="center"><img src="images/back.png" width="72" height="20">	  </td>
		<td width="1" height="8">
	  </td>
	</tr>
	<tr>
		<td colspan="4" width="348" height="34">
			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="34" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/分隔符.gif" width="59" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="28" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="10" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="101" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="83" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="3" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="189" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="73" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="1" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="4" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="27" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="141" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="33" height="1" alt=""></td>
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
	<!-- End ImageReady Slices -->
</body>
<script type="text/javascript">
  if('${messages}'!="")
  {
  	alert('${messages}');
  }
  </script>
</html>