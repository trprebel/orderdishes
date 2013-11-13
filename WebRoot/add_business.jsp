<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="/jstl/c.tld"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
    
    <title>My JSP 'addbusiness.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<style>
body {
	text-align: center;
}

.main {
	width: 961px;
	height: 631px;
	margin: 0px auto;
	display: block;
	background: url(images/bg_all.png) no-repeat;
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

.shangjia {
	position: absolute;
	top: 120px;
	left: -30px;
}

.shangjia td {
	color: #FFFFFF;
	font-size: 16px;
	line-height: 38px;
	height: 38px;
	font-weight: bold
}

.add_input1 {
	border: 0px;
	width: 514px;
	margin-left: 15px;
	font-size: 16px;
	color: #000000;
	font-weight: bold;
	height: 28px;
	line-height:28px;
	background-color: #FFFFFF
}

.add_input2 {
	border: 0px;
	width: 514px;
	height: 77px;
	background-color: #d4d9df
}

.input_text {
	border: 1px solid #CCCCCC;
	height: 40px;
	line-height: 40px;
	margin-right: 15px;
	background-color: #FFFFFF;
	color: #000000;
	font-size: 16px;
	font-weight: bold
}
.bg_input_search1{ width:515px; height:57px; position:absolute; left:42px; top:16px; background:url(images/bg_r_input.png)}
.bg_input_search1 img{ margin-left:16px; margin-right:6px; float:left; margin-top:15px;}
.bg_input_search1 input{ float:left; margin-top:10px; 	background-color:#f30a0a;}
.bg_input_search2{ width:515px; height:57px; position:absolute; left:42px; top:16px; background:url(images/bg_g_input.png)}
.bg_input_search2 img{ margin-left:16px; margin-right:6px; float:left; margin-top:15px;}
.bg_input_search2 input{ float:left; margin-top:10px; 	background-color:#2eb376;}
</style>
	<link href="css/default2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/swfupload.js"></script>
<script type="text/javascript" src="js/swfupload.queue.js"></script>
<script type="text/javascript" src="js/fileprogress2.js"></script>
<script type="text/javascript" src="js/handlers.js"></script>
<script type="text/javascript" src="js/jquery-1.6.js"></script>
	<script type="text/javascript">
	var swfu;

	window.onload = function() {
		//alert("script");
		var settings = {
			flash_url : "swfupload.swf",
			upload_url: "uploadBUSINESS.action",
			file_post_name : "picture",
			//post_params: {"PHPSESSID" : "123"},
			file_size_limit : "5 MB",
			file_types : "*.*",
			file_types_description : "All Files",
			file_upload_limit : 1,
			file_queue_limit : 0,
			custom_settings : {
				progressTarget : "fsUploadProgress",
				cancelButtonId : "btnCancel"
			},
			debug: false,

			// Button settings
			button_image_url: "images/TestImageNoText_65x29.png",
			button_width: "65",
			button_height: "29",
			button_placeholder_id: "spanButtonPlaceHolder",
			button_text: '<span class="theFont">浏览</span>',
			button_text_style: ".theFont { font-size: 16; }",
			button_text_left_padding: 12,
			button_text_top_padding: 3,
			
			// The event handler functions are defined in handlers.js
			file_queued_handler : fileQueued,
			file_queue_error_handler : fileQueueError,
			file_dialog_complete_handler : fileDialogComplete,
			upload_start_handler : uploadStart,
			upload_progress_handler : uploadProgress,
			upload_error_handler : uploadError,
			upload_success_handler : uploadSuccess,
			upload_complete_handler : uploadComplete,
			queue_complete_handler : queueComplete	// Queue plugin event
		};

		swfu = new SWFUpload(settings);
     };
     function uploadSuccess(file, serverData) {
 		try {
 			if (serverData.substring(0, 7) === "FILEID:") {
 				progress.setStatus("上传失败.");
 	            progress.toggleCancel(false);
 	            alert(serverData);
 				
 	        } else {
 	        	//alert(serverData);
 	        	var license=document.getElementById("license");
 	        	license.value=serverData;
 	            var currentTime = new Date();
 				var progress = new FileProgress(file, this.customSettings.progressTarget);
 				progress.setComplete();
 				//Calculate upload time
 				var cTime = (Math.ceil(currentTime-iTime)/1000);
 				var zmin = 0;
 				var zsec = 0;
 				zmin = Math.floor(cTime/60);
 				if (zmin < 10) {
 					zmin = "0" + zmin; 
 				}
 				zsec = Math.ceil(cTime % 60);
 				if (zsec < 10) {
 					zsec = "0" + zsec; 
 				}
 				//Show how long the upload took
 				progress.setStatus("上传完成，用时:<b><font color=red> " + zmin + "分:" + zsec + '秒</font></b>');
 				progress.toggleCancel(false);
 				//			uploadSuccessUpdateParent(serverData.substring(7));
 				// addImage("thumbnail.php?id=" + serverData.substring(7));
 	        }
 		} catch (ex) {
 			this.debug(ex);
 		}
 	}
    function submit1()
    {
    	var busname=document.getElementById("busname").value;
    	var corporation=document.getElementById("corporation").value;
    	var address=document.getElementById("address").value;
    	var descript=document.getElementById("descript").value;
    	var username=document.getElementById("username").value;
    	var password=document.getElementById("password").value;
    	var repassword=document.getElementById("repassword").value;
    	var license=document.getElementById("license").value;
    	if(busname==""||busname==null)
    	{
    		alert("商家名不能为空！");
    		return;
    	}
    	if(corporation==""||corporation==null)
    	{
    		alert("法人代表不能为空！");
    		return;
    	}
    	if(address==""||address==null)
    	{
    		alert("地址不能为空！");
    		return;
    	}
    	if(license==""||license==null)
    	{
    		alert("营业执照不能为空！");
    		return;
    	}
    	if(username==""||username==null)
    	{
    		alert("用户名不能为空！");
    		return;
    	}
    	if(password==""||password==null)
    	{
    		alert("密码不能为空！");
    		return;
    	}
    	if(repassword!=password)
    	{
    		alert("两次输入的密码不相同！");
    		return;
    	}
    	var f1=document.getElementById("businessform");
    	f1.submit();
		
    	
    }
	</script>
</head>
<body>
<form action="addBUSINESS.action" name="businessform" id="businessform" method="post">
<div class="main">
<table class="01" width="961" height="631" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="14" width="960" height="16">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="16" alt=""></td>
	</tr>
			<tr>
				<td width="960" height="15"></td>
				<td width="81" height="15"></td>
				<td width="712" height="15"></td>
				<td width="28" height="15"></td>
				<td height="68" colspan="4" width="491" rowspan="4"><div 
		<c:choose>
		<c:when test="${msgs=='有客户想与您说话' }">
		class="bg_input_search1"
		</c:when>
		<c:otherwise>class="bg_input_search2"
		</c:otherwise>
		</c:choose>
		><img src="images/qu.png" width="28" height="28"><input
						name="textfield" type="text" class="login_input_info"
						value="${msgs }"></div>
				</td>
				<td rowspan="3" width="141" height="57"><img src="images/handing.png" width="141" height="57" style="cursor:pointer" onClick="location.href='requestlistMESSAGE.action'"></td>
				<td colspan="5" rowspan="5" width="241" height="82"></td>
				<td><img src="images/分隔符.gif" width="1" height="15" alt="">
				</td>
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
		<td colspan="4" rowspan="2" width="81" height="24" ><div class="infr_instroy">菜谱管理→添加商家</div></td>
		<td colspan="3" rowspan="5" width="470" height="80">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="14" alt=""></td>
	</tr>
	<tr>
		<td colspan="2" rowspan="4" width="241" height="66">			</td>
		<td colspan="3" rowspan="2" width="208" height="42" align="center" class="list"><img src="images/icon1.png" width="18" height="19">所有菜管理</td>
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
		<td colspan="3" rowspan="2" width="208" height="42" align="center" class="list_h"><img src="images/icon7.png" width="21" height="20">特色菜管理</td>
		<td width="1" height="22">			</td>
	</tr>
			<tr>
				<td rowspan="14" width="81" height="466"></td>
				<td colspan="8" rowspan="14" width="712" height="466" style="vertical-align:top" align="left"><div class="shangjia">
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td width="150" align="right">商家名</td>
								<td width="500"><input type="text" class="add_input1" name="busname" id="busname">
								</td>
							</tr>
							<tr>
								<td width="150" align="right">法人代表</td>
								<td width="500"><input type="text" class="add_input1" name="corporation" id="corporation">
								</td>
							</tr>
							<tr>
								<td width="150" align="right">营业执照</td>
								<td width="500"><div class="fieldset flash"
												id="fsUploadProgress">
												
											</div></td>
							</tr>
							<tr>
								<td width="650" colspan="2" align="center"><div id="divStatus">0 图片已上传！</div></td>
							</tr>
							<tr>
								<td width="650" colspan="2" align="center">
										
											<div>
												<span id="spanButtonPlaceHolder"></span> <input
													id="btnCancel" type="button" value="取消上传所有图片"
													onclick="swfu.cancelQueue();" disabled="disabled"
													style="margin-left: 20px; font-size: 8pt; height: 29px;" />
											<input type="hidden" id="license" name="license" value="">
											</div>
								</td>
							</tr>
							<tr>
								<td width="150" align="right">地址</td>
								<td width="500"><input type="text" class="add_input1" name="address" id="address">
								</td>
							</tr>
							<tr>
								<td width="150" align="right">描述</td>
								<td width="500"><input type="text" class="add_input1" name="descript" id="descript">
								</td>
							</tr>
							<tr>
								<td width="150" align="right">商家微信号</td>
								<td width="500"><input type="text" class="add_input1" name="repassword" id="repassword">
								</td>
							</tr>
							<tr>
								<td width="150" align="right">用户名</td>
								<td width="500"><input type="text" class="add_input1" name="username" id="username">
								</td>
							</tr>
							<tr>
								<td width="150" align="right">密码</td>
								<td width="500"><input type="text" class="add_input1" name="password" id="password">
								</td>
							</tr>
							<tr>
								<td width="150" align="right">重复密码</td>
								<td width="500"><input type="text" class="add_input1" name="repassword" id="repassword">
								</td>
							</tr>
							
							<tr>
								<td width="650" colspan="2" align="center">
									<div style="margin-top:5px;">
										<img src="images/add_bu.png" width="104" height="42" onClick="submit1()">&nbsp;&nbsp;
										<img src="images/reset_bu.png" width="104" height="42" onClick="reset()">
									</div>
								</td>
							</tr>
						</table>



					</div></td>
				<td rowspan="14" width="10" height="466"></td>
				<td width="1" height="20"></td>
			</tr>
			<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td>
			<img src="images/分隔符.gif" width="1" height="2" alt=""></td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center" class="list"><img src="images/icon6.png" width="20" height="20">今日特价&nbsp;&nbsp;</td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center"></td>
		<td width="1" height="42">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="2">			</td>
		<td width="1" height="2">			</td>
	</tr>
	<tr>
		<td colspan="3" width="208" height="42" align="center"></td>
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
		<td rowspan="2" width="208" height="43" align="center"><img style="*margin-bottom:10px;" src="images/last.png" width="78" height="20">			</td>
		<td rowspan="5" width="2" height="86">			</td>
		<td rowspan="2" width="103" height="43" align="center"><img style="*margin-bottom:10px;" src="images/next.png" width="81" height="20">			</td>
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
		<td rowspan="2" width="208" height="42" align="center"><img style="*margin-bottom:15px;cursor:pointer" src="images/home.png" width="73" height="22" onClick="location.href='requestFOOD.action'">			</td>
		<td rowspan="2" width="103" height="42" align="center"><img style="*margin-bottom:15px;cursor:pointer" src="images/back.png" width="72" height="20" onClick="location.href=document.referrer">		</td>
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
</form>
</body>
</html>