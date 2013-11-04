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
<link href="css/default.css" rel="stylesheet" type="text/css" />
<style>
body {
	text-align: center;
}

.main {
	width: 961px;
	height: 631px;
	margin: 0px auto;
	display: block;
	background: url(images/bg_add_drink.png) no-repeat;
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

.add_name {
	color: #d9dddf;
	font-weight: bold;
	font-size: 15px;
	text-align: left;
}

.add_content {
	margin-left: 13px;
	margin-top: 6px;
}

.add_input1 {
	border: 0px;
	width: 514px;
	height: 28px;
	background-color: #d4d9df
}

.add_input2 {
	border: 0px;
	width: 514px;
	height: 77px;
	background-color: #d4d9df
}

.add_icon1 {
	width: 94px;
	height: 38px;
	line-height: 38px;
	background: url(images/yes.png) no-repeat;
	font-size: 20px;
	font-weight: bold;
	color: #eeeeee;
	text-align: center;
}

.add_icon1 input {
	width: 94px;
	height: 38px;
	line-height:38px;
	border: 0px;
	font-size: 20px;
	font-weight: bold;
	color: #eeeeee;
	text-align: center;
	background: #42beab
}

.add_icon2 {
	color: #afcbe2;
	width: 94px;
	height: 38px;
	line-height: 38px;
	background: url(images/no.png) no-repeat;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
}

.add_icon2 input {
	width: 94px;
	height: 38px;
	border: 0px;
	font-size: 20px;
	font-weight: bold;
	color: #eeeeee;
	text-align: center;
	background: #6a7188
}
</style>
</head>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript" src="js/swfupload.js"></script>
<script type="text/javascript" src="js/swfupload.queue.js"></script>
<script type="text/javascript" src="js/fileprogress.js"></script>
<script type="text/javascript" src="js/handlers.js"></script>
<script type="text/javascript">
	function isspecial(i) {
		//alert(i);
		var t = document.getElementById("isspecial_t");
		var f = document.getElementById("isspecial_f");
		if (i == 1) {
			t.className = "add_icon1";
			f.className = "add_icon2";
			document.getElementById("isfeature").value = "1";
			//alert("y");
		} else if (i == 0) {
			t.className = "add_icon2";
			f.className = "add_icon1";
			document.getElementById("isfeature").value = "0";
			//alert("f");
		} else
			return;
	}
	function finish() {
		var number = /^[0-9]{1,20}$/;
		var price = $("#price").val();
		if (!number.exec(price)) {
			alert("价格只能由数字组成！");
			return;
		}
		var num = $("#num").val();
		if (!number.exec(num)) {
			alert("数量只能由数字组成！");
			return;
		}
		var small_pic = $("#small_pic").val();
		if (small_pic == "") {
			alert("请上传小图片");
			return;
		}
		var f1 = document.getElementById("addform");
		f1.submit();

	}
	//alert("${small_pic}");
</script>
<script type="text/javascript">
	var swfus;
	var swfub;
	window.onload = function() {
		//alert("script");
		var settings = {
			flash_url : "swfupload.swf",
			upload_url : "uploadDRINKS.action",
			file_post_name : "picture",
			//post_params: {"PHPSESSID" : "123"},
			file_size_limit : "1 MB",
			file_types : "*.jpg;*.jpeg;*.png;*.gif;*.bmp",
			file_types_description : "All Files",
			file_upload_limit : 0,
			file_queue_limit : 0,
			custom_settings : {
				progressTarget : "fsUploadProgress",
				cancelButtonId : "btnCancel"
			},
			debug : false,

			// Button settings
			button_image_url : "images/select1.png",
			button_width : "98",
			button_height : "39",
			button_placeholder_id : "spanButtonPlaceHolder",
			button_text_style : ".theFont { font-size: 16; }",
			button_text_left_padding : 12,
			button_text_top_padding : 3,

			// The event handler functions are defined in handlers.js
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_start_handler : uploadStart,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccess,
			upload_complete_handler : uploadComplete,
			queue_complete_handler : queueComplete
		// Queue plugin event
		};

		swfus = new SWFUpload(settings);
		var settingsb = {
			flash_url : "swfupload.swf",
			upload_url : "uploadDRINKS.action",
			file_post_name : "picture",
			//post_params: {"PHPSESSID" : "123"},
			file_size_limit : "10 MB",
			file_types : "*.jpg;*.jpeg;*.png;*.gif;*.bmp",
			file_types_description : "All Files",
			file_upload_limit : 0,
			file_queue_limit : 0,
			custom_settings : {
				progressTarget : "fsUploadProgress",
				cancelButtonId : "btnCancelB"
			},
			debug : false,

			// Button settings
			button_image_url : "images/select2.png",
			button_width : "98",
			button_height : "39",
			button_placeholder_id : "spanButtonPlaceHolderB",
			button_text_style : ".theFont { font-size: 16; }",
			button_text_left_padding : 12,
			button_text_top_padding : 3,

			// The event handler functions are defined in handlers.js
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_start_handler : uploadStart,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccessB,
			upload_complete_handler : uploadComplete,
			queue_complete_handler : queueComplete
		// Queue plugin event
		};

		swfub = new SWFUpload(settingsb);

	};
</script>
<body>
	<div class="main">
		<form action="modifyDRINKS.action" name="addform" id="addform"
			method="post" enctype="multipart/form-data">
			<table  width="961" height="631" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="14" width="960" height="16">			</td>
		<td width="1" height="16">
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
		<td rowspan="3" width="141" height="57">	<img
						src="images/handing.png" width="141" height="57" style="cursor:pointer" onClick="location.href='requestlistMESSAGE.action'">		</td>
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
		<td colspan="4" rowspan="2" width="81" height="24" ><div class="infr_instroy">菜谱管理→所有菜管理→新增</div></td>
		<td colspan="3" rowspan="5" width="470" height="80">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="14" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4" width="241" height="66">			</td>
		<td colspan="3" rowspan="2" width="208" height="42" align="center"
						class="list" onClick="location.href='requestFOOD.action'"><img src="images/icon1.png" width="18"
						height="19" > 菜谱管理</td>
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
		<td colspan="8" rowspan="14" width="712" height="466" style="vertical-align:top" align="left"><div class="qiu" style="  position:absolute; top:108px; width:712px; height:502px;  vertical-align:top;  ">

<table width="664" height="502" border="0" cellpadding="0" cellspacing="0" class="add_content">
	<tr>
		<td colspan="17" width="663" height="8">
			</td>
		<td width="1" height="8">
			</td>
	</tr>
	<tr>
		<td rowspan="27" width="8" height="493">
			</td>
		<td rowspan="2" width="113" height="38" class="add_name">酒水名
			</td>
		<td colspan="15" width="542" height="1"> <input type="hidden" name="drinksid" id="drinksid" value="${drink.drinksid }">
			</td>
		<td width="1" height="1">
			</td>
	</tr>
	<tr>
		<td colspan="3" rowspan="8" width="15" height="140">
			</td>
		<td colspan="11" rowspan="2" width="514" height="40" ><input
										class="add_input1" type="text" name="drinks" id="drinks"
										value="${drink.drinks }"></td>
		<td rowspan="26" width="13" height="492">
			</td>
		<td width="1" height="37">
			</td>
	</tr>
	<tr>
		<td rowspan="2" width="113" height="30">
			</td>
		<td width="1" height="3">
			</td>
	</tr>
	<tr>
		<td colspan="11" rowspan="2" width="514" height="32">
			</td>
		<td width="1" height="27">
			</td>
	</tr>
	<tr>
		<td rowspan="2" width="113" height="38" class="add_name">价格</td>
		<td width="1" height="5">
			</td>
	</tr>
	<tr>
		<td colspan="11" rowspan="2" width="514" height="40"><input
										class="add_input1" type="text" name="price" id="price"
										value="${drink.price }"></td>
		<td width="1" height="33">
			</td>
	</tr>
	<tr>
		<td rowspan="2" width="113" height="33">
			</td>
		<td width="1" height="7">
			</td>
	</tr>
	<tr>
		<td colspan="11" rowspan="2" width="514" height="28">
			</td>
		<td width="1" height="26">
			</td>
	</tr>
	<tr>
		<td rowspan="5" width="113" height="38" class="add_name">图片
			</td>
		<td width="1" height="2">
			</td>
	</tr>
	<tr>
		<td rowspan="18" width="9" height="352">
			</td>
		<td colspan="6" rowspan="5" width="219" height="39"><span
										id="spanButtonPlaceHolder"></span> <input id="btnCancel"
										type="hidden" value="取消上传所有文件" onClick="swfus.cancelQueue();"
										disabled="disabled"
										style="margin-left: 2px; font-size: 8pt; height: 29px;" /> <input
										type="hidden" id="small_pic" name="small_pic"
										value="${drink.small_pic }"> <span
										id="spanButtonPlaceHolderB"></span> <input id="btnCancelB"
										type="hidden" value="取消上传所有文件" onClick="swfub.cancelQueue();"
										disabled="disabled"
										style="margin-left: 2px; font-size: 8pt; height: 29px;" /> <input
										type="hidden" id="big_pic" name="big_pic"
										value="${drink.big_pic }">
									</td>
		<td colspan="7" width="301" height="6">
			</td>
		<td width="1" height="6">
			</td>
	</tr>
	<tr>
		<td rowspan="12" width="26" height="195">
			</td>
		<td colspan="2" rowspan="2" width="87" height="14">
			</td>
		<td colspan="4" width="188" height="9">
			</td>
		<td width="1" height="9">
			</td>
	</tr>
	<tr>
		<td colspan="2" width="104" height="5">
			</td>
		<td rowspan="3" width="55" height="24" class="add_name" style="position:relative; left:-16px; top:2px;">&nbsp;</td>
		<td rowspan="11" width="29" height="186">
			</td>
		<td width="1" height="5">
			</td>
	</tr>
	<tr>
		<td colspan="3" rowspan="2" width="179" height="19"><div class="fieldset flash" id="fsUploadProgress"></div><div class="fieldset flash" id="fsUploadProgress"></div></td>
		<td rowspan="10" width="12" height="181">
			</td>
		<td width="1" height="16">
			</td>
	</tr>
	<tr>
		<td rowspan="2" width="113" height="28">
			</td>
		<td width="1" height="3">
			</td>
	</tr>
	<tr>
		<td colspan="6" width="219" height="25">
			</td>
		<td colspan="3" rowspan="8" width="179" height="162">
			</td>
		<td rowspan="8" width="55" height="162">
			</td>
		<td width="1" height="25" >
			</td>
	</tr>
	<tr>
		<td width="113" height="38" class="add_name">是否特色菜</td>
		<td rowspan="12" width="2" height="288">
			</td>
		<td id="isspecial_t" colspan="2" width="94" height="38"
										class="add_icon1" onClick="javascript:isspecial(1)">是</td>
		<td rowspan="7" width="29" height="137">
			</td>
		<td id="isspecial_f" colspan="2" width="94" height="38"
										class="add_icon2" onClick="javascript:isspecial(0)">否</td>
		<td width="1" height="38">
			</td>
	</tr>
	<tr>
		<td width="113" height="29">
			</td>
		<td colspan="2" rowspan="2" width="94" height="33">
			</td>
		<td colspan="2" rowspan="2" width="94" height="33">
			</td>
		<td width="1" height="29">
			</td>
	</tr>
	<tr>
		<td rowspan="2" width="113" height="39" class="add_name">剩余数量
			</td>
		<td width="1" height="4">
			</td>
	</tr>
	<tr>
		<td colspan="2" rowspan="2" width="94" height="38" class="add_icon1"><input type="text" name="num" id="num"
										value="${drink.num }"></td>
		<td colspan="2" rowspan="2" width="94" height="38" >
			</td>
		<td width="1" height="35">
			</td>
	</tr>
	<tr>
		<td rowspan="2" width="113" height="29">
			</td>
		<td width="1" height="3">
			</td>
	</tr>
	<tr>
		<td colspan="2" rowspan="2" width="94" height="28">
			</td>
		<td colspan="2" rowspan="2" width="94" height="28">
			</td>
		<td  width="1" height="26">
			</td>
	</tr>
	<tr>
		<td rowspan="2" width="113" height="39" class="add_name">其它说明
			</td>
		<td width="1" height="2">
			</td>
	</tr>
	<tr>
		<td rowspan="5" width="4" height="151">
			</td>
		<td colspan="11" rowspan="2" width="514" height="79"><textarea
											class="add_input2" name="descript" id="descript">${drink.descript }</textarea>			</td>
		<td width="1" height="37">
			</td>
	</tr>
	<tr>
		<td rowspan="4" width="113" height="114">
			</td>
		<td width="1" height="42">
			</td>
	</tr>
	<tr>
		<td colspan="11" width="514" height="22">
			</td>
		<td width="1" height="22">
			</td>
	</tr>
	<tr>
		<td colspan="3" rowspan="2" width="130" height="50">
			</td>
		<td colspan="3" width="192" height="45"><img
										src="images/compl.png" style="cursor:pointer" width="180" height="44"
										onclick="javascript:finish()">			</td>
		<td colspan="5" rowspan="2" width="192" height="50">
			</td>
		<td width="1" height="45">
			</td>
	</tr>
	<tr>
		<td colspan="3" width="192" height="5">
			</td>
		<td width="1" height="5">
			</td>
	</tr>
<tr>
		<td width="8" height="1">
			</td>
		<td width="113" height="1">
			</td>
		<td width="9" height="1">
			</td>
		<td width="2" height="1">
			</td>
		<td width="4" height="1">
			</td>
		<td width="90" height="1">
			</td>
		<td width="29" height="1">
			</td>
		<td width="11" height="1">
			</td>
		<td width="83" height="1">
			</td>
		<td width="26" height="1">
			</td>
		<td width="83" height="1">
			</td>
		<td width="4" height="1">
			</td>
		<td width="92" height="1">
			</td>
		<td width="12" height="1">
			</td>
		<td  width="55" height="1">
			</td>
		<td width="29" height="1">
			</td>
		<td width="13" height="1">
			</td>
		<td></td>
	</tr>
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
	<td colspan="3" width="208" height="42" align="center" class="list"
						onclick="location.href='message_release.jsp'"><img
						src="images/icon3.png" width="20" height="14"> 信息发布</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list"
						onclick="location.href='requestCUSTOMER.action'"><img
						src="images/icon4.png" width="20" height="20"> 客户管理</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list"
						onclick="location.href='history_info.jsp'"><img
						src="images/icon5.png" width="20" height="20"> 历史信息</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="42" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" rowspan="2" width="208" height="228" align="center" style="vertical-align:top; " onclick="location.href='requestFEEDBACK.action'"><div class="list" style="height:42px;" ><img src="images/icon7.png" width="20" height="23"> 反馈信息</div>			</td>
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
		<td rowspan="2" width="208" height="42" align="center"><img
						style="*padding-bottom:15px; position:relative; top:-10px;" src="images/home.png" width="73"
						height="22" onClick="location.href='requestFOOD.action'" style="cursor:pointer">			</td>
		<td rowspan="2" width="103" height="42" align="center" ><img
						style="*padding-bottom:15px; position:relative; top:-10px;" src="images/back.png" width="72"
						height="20" onClick="location.href=document.referrer" style="cursor:pointer">		</td>
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