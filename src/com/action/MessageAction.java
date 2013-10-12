package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bean.SystemUserInfo;
import com.bean.UserSpeakContent;
import com.opensymphony.xwork2.ActionSupport;
import com.util.DateUtil;
import com.util.SendHTML;
import com.util.SendMess;

public class MessageAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/* 保存用户列表 */
	static public ArrayList vecUserList = null;

	/* 保存用户发言内容 */
	static public ArrayList vecContentList = null;
	/** 发送信息的工具类 */
	public SendMess sendMess = null;
	/** 发送html的工具类 */
	public SendHTML sendHTML = null;

	/**
	 * 初始化类
	 */
	public  MessageAction() {
		if (vecUserList == null) {
			vecUserList = new ArrayList();
			vecUserList.add("所有人");
		}
		if (vecContentList == null) {
			vecContentList = new ArrayList();
		}
		if (sendMess == null) {
			sendMess = new SendMess();
		}
		if (sendHTML == null) {
			sendHTML = new SendHTML();
		}
	}


	/**
	 * 控制程序
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void service() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			PrintWriter out = new PrintWriter(response.getOutputStream());
			sendHTML.setDefault(request, response);
			/* 请求的是哪个页面 */
			String strPage = request.getParameter("page");

			/* 显示主页面 */
			if ("".equals(strPage) || strPage == null) {
				sendHTML.showMainframe(out);
			} else if ("ContentList".equals(strPage)) {
				/* 显示发言内容 */
				sendHTML.showDefault(out);
				// sendHTML.showContentList(out);
				
				showContentListframe(out, ((SystemUserInfo) request
						.getSession().getAttribute("session_UserInfo"))
						.getUserName(), request, DateUtil.getNowTime());
				
			}else if ("SpeakList".equals(strPage)) {
				saveSendMessage(out, request);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	/* 保存发言内容 */
	public void saveSendMessage(PrintWriter out, HttpServletRequest request) {
		/* 保存发言内容 */
		String content = sendHTML.filter(request.getParameter("content"));
		String isPrivate = request.getParameter("isPrivate");
		String name = ((SystemUserInfo) request.getSession().getAttribute(
				"session_UserInfo")).getUserName();
		// 聊的对象
		String toUser = sendHTML.filter(request.getParameter("toUser"));
		// 是否退出聊天室
		String type = request.getParameter("type");
		try {
			if ("exit".equals(type)) {
				UserSpeakContent closeSpeak = new UserSpeakContent();
				if (vecUserList.indexOf(name) > 0) {
					vecUserList.remove(name);
					closeSpeak.setSpeakTime(DateUtil.getNowTime());
					closeSpeak.setSpeakUser(name);
					closeSpeak.setToSpeakUser("");
					closeSpeak.setSpeakContent(name + "退出聊天室");
					closeSpeak.setLogout(true);
					closeSpeak.setSpeakType(1);
					vecContentList.add(closeSpeak);
				}
				sendHTML.showDefault(out);
				sendHTML.showSpeakListframe(out, name, closeSpeak
						.getToSpeakUser(), closeSpeak.isPrivate());
			} else {
				if ("".equals(toUser)) {
					toUser = "";
				}
				UserSpeakContent userSpeakContent = new UserSpeakContent();
				/* 表示刚刚进入聊天室 */
				if (name != null && content == null) {
					userSpeakContent.setSpeakTime(DateUtil.getNowTime());
					userSpeakContent.setSpeakUser("***系统信息***");
					userSpeakContent.setToSpeakUser("所有人");
					userSpeakContent.setSpeakContent(name + "刚刚进入聊天室");
					userSpeakContent.setSpeakType(1);
				} else {
					if ("私聊".equals(isPrivate)) {
						userSpeakContent.setPrivate(true);
					}
					userSpeakContent.setSpeakContent(content);
					userSpeakContent.setSpeakTime(DateUtil.getNowTime());
					userSpeakContent.setSpeakUser(name);
					userSpeakContent.setToSpeakUser(toUser);
				}
				/* 刚刚进入聊天室 */
				if (name != null && content == null) {
					if (vecUserList.indexOf(name) < 0) { // 在线用户中没有这个人
						vecUserList.add(name);
					}
				}
				if (vecUserList.indexOf(userSpeakContent.getSpeakUser()) > 0
						&& vecUserList.indexOf(userSpeakContent
								.getToSpeakUser()) > 0) { // 说话人在线，聊天对象也在线
					vecContentList.add(userSpeakContent);
				} else if (vecUserList.indexOf(userSpeakContent.getSpeakUser()) > 0
						&& userSpeakContent.getToSpeakUser().equals("所有人")) { // 说话人在线，聊天对象是所有人
					vecContentList.add(userSpeakContent);
				} else if (userSpeakContent.getSpeakType() == 1) { // 是系统信息
					vecContentList.add(userSpeakContent);
				} else if (vecUserList.indexOf(userSpeakContent.getSpeakUser()) > 0
						&& vecUserList.indexOf(userSpeakContent
								.getToSpeakUser()) < 0) { // 说话人在线，聊天对象不在线
					out.println("<script>alert('"
							+ userSpeakContent.getToSpeakUser()
							+ "已经下线!');</script>");
					out.flush();
				}
				//sendHTML.showDefault(out);
				//sendHTML.showSpeakListframe(out, name, userSpeakContent.getToSpeakUser(), userSpeakContent.isPrivate());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 显示用户发言内容
	 * 
	 * @param out
	 * @throws java.lang.Exception
	 */
	private void showContentListframe(PrintWriter out, String userName,
			HttpServletRequest request, Date logTime) {
		int inListCount = 0;
		int inUserList = 0;
		UserSpeakContent userSpeakContent = null;
		boolean isLogined = false;
		boolean canLogout = false;
		boolean isSpeak = false;
		while (true) {
			for (int i = vecContentList.size() - 1; i >= 0; i--) {
				userSpeakContent = (UserSpeakContent) vecContentList.get(i);
				if (userSpeakContent.getSpeakUser().equals(userName)) {
					isSpeak = true;
					// 如果用户在线上，并且大余30分钟不发言，退出
					if (vecUserList.indexOf(userName) > 0
							&& userSpeakContent.getSpeakType() == 0
							&& userSpeakContent.getUserType() == 1) {
						if (DateUtil.getTwoTimeSub(DateUtil.getNowTime(),
								userSpeakContent.getSpeakTime()) >= 30) {
							// 在线列表中删除userName这个人
							vecUserList.remove(userName);
							canLogout = true;
							break;
						} else {
							break;
						}
					} else {
						break;
					}
				}
			}

			if (isSpeak == false) {
				if (vecUserList.indexOf(userName) > 0) {
					if (DateUtil.getTwoTimeSub(DateUtil.getNowTime(), logTime) >= 30
							&& userSpeakContent.getUserType() == 1) {
						vecUserList.remove(userName);
						canLogout = true;
					}
				}
				isSpeak = true;
			}
			if (inListCount < vecContentList.size()) {
				while (inListCount < vecContentList.size()) {
					inListCount++;
					userSpeakContent = (UserSpeakContent) vecContentList
							.get(inListCount - 1);
					userSpeakContent = sendMess.filterSelfMessage(
							userSpeakContent, userName);
					if (userSpeakContent != null) {
						// 显示在登录前5分钟的信息
						if (DateUtil.getTwoTimeSub(userSpeakContent
								.getSpeakTime(), logTime) >= -5) {
							if (userSpeakContent.getSpeakType() == 1) { // 系统信息
								sendMess.showSystemContent(out,
										userSpeakContent); // 显示信息信息
							} else {
								if (userSpeakContent.getToSpeakUser().equals(
										"所有人")
										&& userSpeakContent.getSpeakUser()
										.equals(userName)) {
									sendMess.showSelfToAllContent(out,
											userSpeakContent);
								} else if (userSpeakContent.getToSpeakUser()
										.equals("所有人")
										&& !userSpeakContent.getSpeakUser()
										.equals(userName)) {
									sendMess.showOtherToAllContent(out,
											userSpeakContent);
								} else if (userSpeakContent.getSpeakUser()
										.equals(userName)
										&& userSpeakContent.getToSpeakUser()
										.equals(userName)) {// 你对自己说的
									if (userSpeakContent.isPrivate()) {
										sendMess.showSelfToSelfContentPrivate(
												out, userSpeakContent); // 自己对自己说悄悄话
									} else {
										sendMess.showSelfToSelfContent(out,
												userSpeakContent); // 自己对自己说
									}
								} else if (userSpeakContent.getSpeakUser()
										.equals(userName)
										&& !userSpeakContent.getToSpeakUser()
										.equals(userName)) { // 你对别的说的
									if (userSpeakContent.isPrivate()) {
										sendMess.showSelfToOtherContentPrivate(
												out, userSpeakContent); // 自己对别人说的悄悄话
									} else {
										sendMess.showSelfToOtherContent(out,
												userSpeakContent); // 自己对别人说的话
									}
								} else if (!userSpeakContent.getSpeakUser()
										.equals(userName)
										&& !userSpeakContent.getToSpeakUser()
										.equals(userName)) { // 不是你说的，也不是对你说的
									if (userSpeakContent.isPrivate()) {
										sendMess
										.showOtherToOtherContentPrivate(
												out, userSpeakContent); // 别人对别人说的悄悄话
									} else {
										sendMess.showOtherToOtherContent(out,
												userSpeakContent); // 别人对别人说的话
									}
								} else if (!userSpeakContent.getSpeakUser()
										.equals(userName)
										&& userSpeakContent.getToSpeakUser()
										.equals(userName)) { // 别人对你说的
									if (userSpeakContent.isPrivate()) {
										sendMess.showOtherToSelfContentPrivate(
												out, userSpeakContent); // 别人对自己说的悄悄话
									} else {
										sendMess.showOtherToSelfContent(out,
												userSpeakContent); // 别人对自己说的话
									}
								}
							}
						}
					}
				}
				out.println("<script>window.scroll(0,10000000);</script>");
				out.flush();
			}
			out.print("<SCRIPT>try{;"
					+ "top.UserListframe.document.all.LIST.innerHTML=\"");
			//			for (int i = 0; i < vecUserList.size(); i++) {
			//				out.print("<a href=# onclick="
			//						+ "top.SpeakListframe.document.all.toUser.value='"
			//						+ vecUserList.get(i).toString() + "'>"
			//						+ vecUserList.get(i).toString() + "</a><br>");
			//			}
			//			out.print("\"}catch(e){;}</SCRIPT>\n");
			//			out.flush();
			//			inUserList = vecUserList.size();
			try {
				Thread.sleep(500);
			} catch (Exception e) {
				out.println("线程出错:" + e.getMessage());
			}
			if (canLogout) {
				UserSpeakContent closeSpeak = new UserSpeakContent();
				closeSpeak.setSpeakTime(DateUtil.getNowTime());
				closeSpeak.setSpeakUser(userName);
				closeSpeak.setToSpeakUser("");
				closeSpeak.setSpeakContent(userName + "退出聊天室");
				closeSpeak.setLogout(true);
				closeSpeak.setSpeakType(1);
				vecContentList.add(closeSpeak);
				out.println("<LI><B>***系统信息***&nbsp;"
						+ "你由于30分钟没发言,已经自动退出聊天室!</LI></B>");
				out.flush();
				canLogout = false;
				break;
			}
		}
	}

}
