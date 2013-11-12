<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/swfupload.js"></script>
<script type="text/javascript" src="js/swfupload.queue.js"></script>
<script type="text/javascript" src="js/fileprogress.js"></script>
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
    	商家名：<input type="text" name="busname" id="busname"/><br>
    	法人代表：<input type="text" name="corporation" id="corporation"/><br>
    	营业执照：<div class="fieldset flash"
												id="fsUploadProgress">
												
											</div>
											<div id="divStatus">0 图片已上传！</div>
											<div>
												<span id="spanButtonPlaceHolder"></span> <input
													id="btnCancel" type="button" value="取消上传所有图片"
													onclick="swfu.cancelQueue();" disabled="disabled"
													style="margin-left: 2px; font-size: 8pt; height: 29px;" />
											<input type="hidden" id="license" name="license" value="">
											</div>
    	地址：<input type="text" name="address" id="address"/><br>
    	描述：<input type="text" name="descript" id="descript"/><br>
    	用户名：<input type="text" name="username" id="username"/><br>
    	密码：<input type="text" name="password" id="password"/><br>
    	重复密码：<input type="text" name="repassword" id="repassword"/><br>
    	<input type="button" value="添加" onclick="submit1()">
    	<input type="reset" value="重置">
    </form>
  </body>
</html>
