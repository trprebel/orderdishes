package com.util;

import java.io.PrintWriter;

import com.bean.UserSpeakContent;

/**
 * 信息发送分发类
 * 
 * @author wgq
 * 
 */
public class SendMess {
	// 显示系统信息
	public void showSystemContent(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI><B>***系统信息***</B>&nbsp;< " + DateUtil.getPreciseTime()
				+ " >&nbsp" + userSpeakContent.getSpeakContent() + "</LI>");
	}

	// 显示用户自己对自己说
	public void showSelfToSelfContent(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI><" + DateUtil.getPreciseTime()
				+ " >&nbsp<B>你自言自语道:&nbsp;"
				+ userSpeakContent.getSpeakContent() + "</B></LI>");
	}

	// 显示用户自己对自己说的悄悄话
	public void showSelfToSelfContentPrivate(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI><" + DateUtil.getPreciseTime()
				+ " >&nbsp<B>你悄悄地自言自语道:&nbsp;"
				+ userSpeakContent.getSpeakContent() + "</B></LI>");
	}

	// 显示自己对别人说的悄悄话
	//	public void showSelfToOtherContentPrivate(PrintWriter out,
	//			UserSpeakContent userSpeakContent) {
	//		out.println("<LI>< " + DateUtil.getPreciseTime()
	//				+ " >&nbsp<B>你</B>&nbsp;对&nbsp;<a href=# onclick="
	//				+ "top.SpeakListframe.document.all.toUser.value='"
	//				+ userSpeakContent.getToSpeakUser() + "'>"
	//				+ userSpeakContent.getToSpeakUser() + "</a>"
	//				+ "&nbsp;悄悄地说:&nbsp;" + userSpeakContent.getSpeakContent()
	//				+ "</LI>");
	//	}
	public void showSelfToOtherContentPrivate(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<div class=\"left_top_xinxi\">"
			+"<div class=\"xinxi_replay\">"
			+"<div class=\"top_xinxi_replay\">&nbsp;&nbsp;"+DateUtil.getPreciseTime()+"</div>"
			+"<div class=\"middle_xinxi_replay\">&nbsp;&nbsp;我说:"+userSpeakContent.getSpeakContent()+"</div>"
			+"<div class=\"bottom_xinxi_replay\">&nbsp;</div>"
			+"</div>"


	+"</div>");

	}

	// 显示自己对别人说的话
	public void showSelfToOtherContent(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI><" + DateUtil.getPreciseTime()
				+ " >&nbsp<B>你</B>&nbsp;对&nbsp;<a href=# onclick="
				+ "top.SpeakListframe.document.all.toUser.value='"
				+ userSpeakContent.getToSpeakUser() + "'>"
				+ userSpeakContent.getToSpeakUser() + "</a>说:&nbsp;"
				+ userSpeakContent.getSpeakContent() + "</LI>");
	}

	// 显示别人对别人说的悄悄话
	public void showOtherToOtherContentPrivate(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI><" + DateUtil.getPreciseTime()
				+ " >&nbsp<B><a href=# onclick=top.SpeakListframe."
				+ "document.all.toUser.value='"
				+ userSpeakContent.getSpeakUser() + "'>"
				+ userSpeakContent.getSpeakUser()
				+ "</a></B>&nbsp;对&nbsp;<a href=# onclick=top.SpeakListframe."
				+ "document.all.toUser.value='"
				+ userSpeakContent.getToSpeakUser() + "'>"
				+ userSpeakContent.getToSpeakUser() + "</a>&nbsp;悄悄地说:&nbsp;"
				+ userSpeakContent.getSpeakContent() + "</LI>");
	}

	// 显示别人对别人说的话
	public void showOtherToOtherContent(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI><" + DateUtil.getPreciseTime()
				+ " >&nbsp<B> <a href=# onclick=top.SpeakListframe.document"
				+ ".all.toUser.value='" + userSpeakContent.getSpeakUser()
				+ "'>" + userSpeakContent.getSpeakUser()
				+ "</a></B>&nbsp;对&nbsp;<a href=# onclick=top.SpeakListframe"
				+ ".document.all.toUser.value='"
				+ userSpeakContent.getToSpeakUser() + "'>"
				+ userSpeakContent.getToSpeakUser() + "</a>说:&nbsp;"
				+ userSpeakContent.getSpeakContent() + "</LI>");
	}

	// 显示别人对自己说的悄悄话
	//	public void showOtherToSelfContentPrivate(PrintWriter out,
	//			UserSpeakContent userSpeakContent) {
	//		out.println("<LI><" + DateUtil.getPreciseTime()
	//				+ " >&nbsp<B><a href=# onclick=top.SpeakListframe.document."
	//				+ "all.toUser.value='" + userSpeakContent.getSpeakUser() + "'>"
	//				+ userSpeakContent.getSpeakUser()
	//				+ "</a></B>&nbsp;对你 悄悄地说:&nbsp;"
	//				+ userSpeakContent.getSpeakContent() + "</LI>");
	//	}
	public void showOtherToSelfContentPrivate(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<div class=\"right_top_xinxi\">"
				+"<div class=\"left_top_xinxi2\">"
				+"<div class=\"xinxi_replay\">"
				+"<div class=\"top_xinxi_replay2\">&nbsp;&nbsp;&nbsp;"+DateUtil.getPreciseTime()+"</div>"
				+"<div class=\"middle_xinxi_replay2\">&nbsp;&nbsp;他说："+userSpeakContent.getSpeakContent()+"</div>"
				+"<div class=\"bottom_xinxi_replay2\">&nbsp;</div>"
				+"</div>"
				+"</div>"
				+"</div>");
		}

	// 显示别人对自己说的话
	public void showOtherToSelfContent(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI><" + DateUtil.getPreciseTime()
				+ " >&nbsp<B> <a href=# onclick=top.SpeakListframe.document."
				+ "all.toUser.value='" + userSpeakContent.getSpeakUser() + "'>"
				+ userSpeakContent.getSpeakUser() + "</a></B>&nbsp;对你 说:&nbsp;"
				+ userSpeakContent.getSpeakContent() + "</LI>");
	}

	// 显示你对所有人说的话
	public void showSelfToAllContent(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI><" + DateUtil.getPreciseTime()
				+ ">&nbsp<B>你</B>&nbsp;对&nbsp;<a href=# onclick="
				+ "top.SpeakListframe.document.all.toUser."
				+ "value='所有人'>所有人</a> 说:&nbsp;"
				+ userSpeakContent.getSpeakContent() + "</LI>");
	}

	// 显示别人对所有人说的话
	public void showOtherToAllContent(PrintWriter out,
			UserSpeakContent userSpeakContent) {
		out.println("<LI>< " + DateUtil.getPreciseTime()
				+ " >&nbsp<B><a href=# onclick=top.SpeakListframe.document"
				+ ".all.toUser.value='" + userSpeakContent.getSpeakUser()
				+ "'>" + userSpeakContent.getSpeakUser()
				+ "</a></B>&nbsp;对&nbsp;<a href=# onclick=top.SpeakListframe."
				+ "document.all.toUser.value='所有人'>所有人</a> 说:&nbsp;"
				+ userSpeakContent.getSpeakContent() + "</LI>");
	}

	public UserSpeakContent filterSelfMessage(UserSpeakContent content,
			String user) {
		// 发给自己的私聊内容
		if (content.isPrivate() && content.getToSpeakUser().equals(user)) {
			return content;
		}
		// 公聊内容
		if (content.isPrivate() == false) {
			return content;
		}
		// 自己发的内容
		if (content.getSpeakUser().equals(user)) {
			return content;
		}
		// 发给所有人的内容
		if (content.getToSpeakUser().equals("所有人")) {
			return content;
		}
		return null;
	}
}
