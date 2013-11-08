package com.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendHTML {
	/**
	 * 显示用户列表
	 * 
	 * @param out
	 * @throws java.lang.Exception
	 */
	public void showUserListframe(PrintWriter out) throws Exception {
		out.println("<CENTER>在线用户</CENTER><HR><"
				+ "FONT ID=\"LIST\"></FONT></BODY></HTML>");
		out.close();
	}

	/**
	 * 显示用户发言录入框
	 * 
	 * @param out
	 * @param name
	 * @throws java.lang.Exception
	 */
	public void showSpeakListframe(PrintWriter out, String name, String toUser,
			boolean isPrivate) throws Exception {
		StringBuffer strBuf = new StringBuffer();
		strBuf.append("toolbars:[['separator','cut','copy','paste',");
		strBuf.append("'separator','undo','redo','separator','bold',");
		strBuf.append("'italic','underline','strike','sup','sub',");
		strBuf.append("'separator','justify','left','center','right',");
		strBuf.append("'separator','ol','ul','indent','outdent',");
		strBuf.append("'separator','link','unlink','image'],[");
		strBuf.append("'separator','code',");
		strBuf.append("'separator','formats','fontsize','fontfamily',");
		strBuf.append("'separator','fontcolor','highlight',],['separator',");
		strBuf.append("'removeformat','striptags','hr','paragraph',");
		strBuf.append("'separator','quote','styles','syntax']],skin:'blue'");
		String checkStr = "";
		String[] strOut = new String[] {
				"<form method=\"post\" action=\"\"onsubmit=\"if(document.all.content.value=='')",
				"{alert('请输入你的发言');document.all.content.focus();return false;}\">",
				"<input type=\"text\" name=\"name\" size=10 readOnly=true style=\"background-color: #66FFFF\">",
				"对<input type=\"text\" name=\"toUser\" size=10 readOnly=true style=\"background-color: #66FFFF\">",
				"<input type=\"checkbox\" name=\"isPrivate\" value=\"私聊\">私聊&nbsp;",
				"说<textarea id='content' name ='content'></textarea>",
				"<input type=submit value=' 发 表 '>",
				"&nbsp;&nbsp;&nbsp;<a href=\"?page=SpeakList&type=exit\">退出</a>",
				"</form>",
				"<script>",
				"document.all.content.focus();",
				"</script>"
				//"<script language=\"Javascript\" type=\"text/javascript\">",
				//"$(\"#content\").css(\"height\",\"100\").css(\"width\",\"620\").htmlbox({"
				//		+ strBuf.toString() + "});", "</script>" 
				};
		for (int i = 0; i < strOut.length; i++) {
			out.println(strOut[i]);
		}
		if (!"".equals(name) && name != null) {
			checkStr = "<script>document.all.name.value='" + name
					+ "';document.all.toUser.value='" + toUser + "';";
			if (isPrivate) {
				checkStr = checkStr + "document.all.isPrivate.checked=true;";
			}
			checkStr = checkStr + "</script>";
			out.println(checkStr);
		}
		out.close();
	}

	/**
	 * 改变为HTML字符
	 * 
	 * @param value
	 * @return
	 */
	public static String filter(String value) {
		if (value == null) {
			return null;
		}
		char content[] = new char[value.length()];
		value.getChars(0, value.length(), content, 0);
		StringBuffer result = new StringBuffer(content.length + 50);
		for (int i = 0; i < content.length; i++) {
			switch (content[i]) {
			case 60: // '<'
				result.append("&lt;");
				break;
			case 62: // '>'
				result.append("&gt;");
				break;
			case 38: // '&'
				result.append("&amp;");
				break;
			case 34: // '"'
				result.append("&quot;");
				break;
			case 39: // '\''
				result.append("&#39;");
				break;
			case 32: // ' '
				result.append("&nbsp;");
				break;
			default:
				result.append(content[i]);
				break;
			}
		}
		return value;
		// return result.toString();
	}

	/**
	 * 设页面初始参数
	 * 
	 * @param request
	 * @param response
	 * @throws java.lang.Exception
	 */
	public void setDefault(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setBufferSize(1024 * 64);
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache, must-revalidate");
		response.setDateHeader("Expires", -1);
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
	}

	/**
	 * 输出用户
	 * 
	 * @param out
	 */
	public void showContentList(PrintWriter out) {
		String[] strOut = new String[] {
				"<html>",
				"<head>",
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">",
				"<title></title>",
				"<style type=\"text/css\">",
				"<!--",
				"body {overflow :auto; font-size: 9pt; background-color: #e0e0e0;}",
				"-->", "</style>", "</head>",
				"<script>window.status='聊天室';</script>", "<body>",
				"<textarea id='content' name ='content'>" };
		for (int i = 0; i < strOut.length; i++) {
			out.println(strOut[i]);
		}
		out.flush();
	}

	/**
	 * 输出页面头
	 * 
	 * @param out
	 */
	public void showDefault(PrintWriter out,String basePath) {
		String[] strOut = new String[] {
				"<html>",
				"<head>",
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">",
				"<title></title>",
				"<script language=\"Javascript\" src=\"js/jquery-1.6.js\"  type=\"text/javascript\"></script>",
				//"<script language=\"Javascript\" src=\"htmlbox.colors.js\"  type=\"text/javascript\"></script>",
				//"<script language=\"Javascript\" src=\"htmlbox.styles.js\"  type=\"text/javascript\"></script>",
				//"<script language=\"Javascript\" src=\"htmlbox.syntax.js\"  type=\"text/javascript\"></script>",
				//"<script language=\"Javascript\" src=\"xhtml.js\"  type=\"text/javascript\"></script>",
				//"<script language=\"Javascript\" src=\"htmlbox.min.js\"  type=\"text/javascript\"></script>",
				"<link href=\""+basePath+"css/iframe.css\" rel=\"stylesheet\" type=\"text/css\" />",
				"<!--",
				"body {overflow :auto; font-size: 9pt; background-color: #e0e0e0;}",
				"-->", "</style>", "</head>",
				"<script>window.status='聊天室';</script>", "<body>","<div class=\"top_xinxi\">" };
		for (int i = 0; i < strOut.length; i++) {
			out.println(strOut[i]);
		}
		out.flush();
	}
	public void showWeDefault(PrintWriter out,String basePath) {
		String[] strOut = new String[] {
				
				"<html>",
				"<head>",
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />",
				"<title>无标题文档</title>",
				"<link href=\"css/iframe.css\" rel=\"stylesheet\" type=\"text/css\" />",
				"</head>",
				"<body>"
//				"<div class=\"list_operating\">",
//				"<div>",
//				"<img src=\"images/blank.png\" width=\"255\" height=\"120\" />",
//				"</div>",
//				"</div>"
		};
		for (int i = 0; i < strOut.length; i++) {
			out.println(strOut[i]);
		}
		out.flush();
	}

	/**
	 * 显示主页面
	 * 
	 * @param out
	 * @throws java.lang.Exception
	 */
	public void showMainframe(PrintWriter out) throws Exception {
		String[] strOut = new String[] {
				"<html>",
				"<head>",
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">",
				"<title>聊天室</title>",
				"</head>",
				"<frameset rows=\"*\" cols=\"100,*\" frameborder=\"YES\" border=\"1\" framespacing=\"0\">",
				"<frame src=\"speakHouse?page=UserList\" name=\"UserListframe\" scrolling=\"NO\" noresize>",
				"<frameset rows=\"*,300\" cols=\"*\" framespacing=\"0\" frameborder=\"YES\" border=\"1\">",
				"<frame src=\"speakHouse?page=ContentList\" name=\"ContentListframe\">",
				"<frame src=\"speakHouse?page=SpeakList\" name=\"SpeakListframe\" scrolling=\"NO\" noresize>",
				"</frameset>", "</frameset>", "<noframes><body>",
				"</body></noframes>", "</html>", };
		for (int i = 0; i < strOut.length; i++) {
			out.println(strOut[i]);
		}
		out.close();
	}
}
