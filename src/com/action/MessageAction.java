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
	/* �����û��б� */
	static public ArrayList vecUserList = null;

	/* �����û��������� */
	static public ArrayList vecContentList = null;
	/** ������Ϣ�Ĺ����� */
	public SendMess sendMess = null;
	/** ����html�Ĺ����� */
	public SendHTML sendHTML = null;

	/**
	 * ��ʼ����
	 */
	public  MessageAction() {
		if (vecUserList == null) {
			vecUserList = new ArrayList();
			vecUserList.add("������");
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
	 * ���Ƴ���
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
			/* ��������ĸ�ҳ�� */
			String strPage = request.getParameter("page");

			/* ��ʾ��ҳ�� */
			if ("".equals(strPage) || strPage == null) {
				sendHTML.showMainframe(out);
			} else if ("ContentList".equals(strPage)) {
				/* ��ʾ�������� */
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

	/* ���淢������ */
	public void saveSendMessage(PrintWriter out, HttpServletRequest request) {
		/* ���淢������ */
		String content = sendHTML.filter(request.getParameter("content"));
		String isPrivate = request.getParameter("isPrivate");
		String name = ((SystemUserInfo) request.getSession().getAttribute(
				"session_UserInfo")).getUserName();
		// �ĵĶ���
		String toUser = sendHTML.filter(request.getParameter("toUser"));
		// �Ƿ��˳�������
		String type = request.getParameter("type");
		try {
			if ("exit".equals(type)) {
				UserSpeakContent closeSpeak = new UserSpeakContent();
				if (vecUserList.indexOf(name) > 0) {
					vecUserList.remove(name);
					closeSpeak.setSpeakTime(DateUtil.getNowTime());
					closeSpeak.setSpeakUser(name);
					closeSpeak.setToSpeakUser("");
					closeSpeak.setSpeakContent(name + "�˳�������");
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
				/* ��ʾ�ոս��������� */
				if (name != null && content == null) {
					userSpeakContent.setSpeakTime(DateUtil.getNowTime());
					userSpeakContent.setSpeakUser("***ϵͳ��Ϣ***");
					userSpeakContent.setToSpeakUser("������");
					userSpeakContent.setSpeakContent(name + "�ոս���������");
					userSpeakContent.setSpeakType(1);
				} else {
					if ("˽��".equals(isPrivate)) {
						userSpeakContent.setPrivate(true);
					}
					userSpeakContent.setSpeakContent(content);
					userSpeakContent.setSpeakTime(DateUtil.getNowTime());
					userSpeakContent.setSpeakUser(name);
					userSpeakContent.setToSpeakUser(toUser);
				}
				/* �ոս��������� */
				if (name != null && content == null) {
					if (vecUserList.indexOf(name) < 0) { // �����û���û�������
						vecUserList.add(name);
					}
				}
				if (vecUserList.indexOf(userSpeakContent.getSpeakUser()) > 0
						&& vecUserList.indexOf(userSpeakContent
								.getToSpeakUser()) > 0) { // ˵�������ߣ��������Ҳ����
					vecContentList.add(userSpeakContent);
				} else if (vecUserList.indexOf(userSpeakContent.getSpeakUser()) > 0
						&& userSpeakContent.getToSpeakUser().equals("������")) { // ˵�������ߣ����������������
					vecContentList.add(userSpeakContent);
				} else if (userSpeakContent.getSpeakType() == 1) { // ��ϵͳ��Ϣ
					vecContentList.add(userSpeakContent);
				} else if (vecUserList.indexOf(userSpeakContent.getSpeakUser()) > 0
						&& vecUserList.indexOf(userSpeakContent
								.getToSpeakUser()) < 0) { // ˵�������ߣ������������
					out.println("<script>alert('"
							+ userSpeakContent.getToSpeakUser()
							+ "�Ѿ�����!');</script>");
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
	 * ��ʾ�û���������
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
					// ����û������ϣ����Ҵ���30���Ӳ����ԣ��˳�
					if (vecUserList.indexOf(userName) > 0
							&& userSpeakContent.getSpeakType() == 0
							&& userSpeakContent.getUserType() == 1) {
						if (DateUtil.getTwoTimeSub(DateUtil.getNowTime(),
								userSpeakContent.getSpeakTime()) >= 30) {
							// �����б���ɾ��userName�����
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
						// ��ʾ�ڵ�¼ǰ5���ӵ���Ϣ
						if (DateUtil.getTwoTimeSub(userSpeakContent
								.getSpeakTime(), logTime) >= -5) {
							if (userSpeakContent.getSpeakType() == 1) { // ϵͳ��Ϣ
								sendMess.showSystemContent(out,
										userSpeakContent); // ��ʾ��Ϣ��Ϣ
							} else {
								if (userSpeakContent.getToSpeakUser().equals(
										"������")
										&& userSpeakContent.getSpeakUser()
										.equals(userName)) {
									sendMess.showSelfToAllContent(out,
											userSpeakContent);
								} else if (userSpeakContent.getToSpeakUser()
										.equals("������")
										&& !userSpeakContent.getSpeakUser()
										.equals(userName)) {
									sendMess.showOtherToAllContent(out,
											userSpeakContent);
								} else if (userSpeakContent.getSpeakUser()
										.equals(userName)
										&& userSpeakContent.getToSpeakUser()
										.equals(userName)) {// ����Լ�˵��
									if (userSpeakContent.isPrivate()) {
										sendMess.showSelfToSelfContentPrivate(
												out, userSpeakContent); // �Լ����Լ�˵���Ļ�
									} else {
										sendMess.showSelfToSelfContent(out,
												userSpeakContent); // �Լ����Լ�˵
									}
								} else if (userSpeakContent.getSpeakUser()
										.equals(userName)
										&& !userSpeakContent.getToSpeakUser()
										.equals(userName)) { // ��Ա��˵��
									if (userSpeakContent.isPrivate()) {
										sendMess.showSelfToOtherContentPrivate(
												out, userSpeakContent); // �Լ��Ա���˵�����Ļ�
									} else {
										sendMess.showSelfToOtherContent(out,
												userSpeakContent); // �Լ��Ա���˵�Ļ�
									}
								} else if (!userSpeakContent.getSpeakUser()
										.equals(userName)
										&& !userSpeakContent.getToSpeakUser()
										.equals(userName)) { // ������˵�ģ�Ҳ���Ƕ���˵��
									if (userSpeakContent.isPrivate()) {
										sendMess
										.showOtherToOtherContentPrivate(
												out, userSpeakContent); // ���˶Ա���˵�����Ļ�
									} else {
										sendMess.showOtherToOtherContent(out,
												userSpeakContent); // ���˶Ա���˵�Ļ�
									}
								} else if (!userSpeakContent.getSpeakUser()
										.equals(userName)
										&& userSpeakContent.getToSpeakUser()
										.equals(userName)) { // ���˶���˵��
									if (userSpeakContent.isPrivate()) {
										sendMess.showOtherToSelfContentPrivate(
												out, userSpeakContent); // ���˶��Լ�˵�����Ļ�
									} else {
										sendMess.showOtherToSelfContent(out,
												userSpeakContent); // ���˶��Լ�˵�Ļ�
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
				out.println("�̳߳���:" + e.getMessage());
			}
			if (canLogout) {
				UserSpeakContent closeSpeak = new UserSpeakContent();
				closeSpeak.setSpeakTime(DateUtil.getNowTime());
				closeSpeak.setSpeakUser(userName);
				closeSpeak.setToSpeakUser("");
				closeSpeak.setSpeakContent(userName + "�˳�������");
				closeSpeak.setLogout(true);
				closeSpeak.setSpeakType(1);
				vecContentList.add(closeSpeak);
				out.println("<LI><B>***ϵͳ��Ϣ***&nbsp;"
						+ "������30����û����,�Ѿ��Զ��˳�������!</LI></B>");
				out.flush();
				canLogout = false;
				break;
			}
		}
	}

}
