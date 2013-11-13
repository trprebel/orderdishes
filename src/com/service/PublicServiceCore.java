package com.service;

import java.util.Date;
import java.util.Map;

import javax.jms.TextMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.bean.publicservice.TextMessageResponse;
import com.dao.impl.BusinessDao;
import com.util.MessageUtil;

public class PublicServiceCore {

	/**
	 * ����΢�ŷ���������
	 * 
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request) {
		String respMessage = null;
		try {
			// Ĭ�Ϸ��ص��ı���Ϣ����
			String respContent = "�������쳣�����Ժ��ԣ�";

			// xml�������
			Map<String, String> requestMap = MessageUtil.parseXml(request);

			// ���ͷ��ʺţ�open_id��
			String fromUserName = requestMap.get("FromUserName");
			// �����ʺ�
			String toUserName = requestMap.get("ToUserName");
			// ��Ϣ����
			String msgType = requestMap.get("MsgType");
			//��Ϣ����
			String content=requestMap.get("Content");
			//System.out.println(content);
			//System.out.println(fromUserName);
			// �ظ��ı���Ϣ
			TextMessageResponse textMessage = new TextMessageResponse();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);

			// �ı���Ϣ
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				respContent = "��ӭ���٣�";
			}
			// ͼƬ��Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				respContent = "�����͵���ͼƬ��Ϣ��";
			}
			// ����λ����Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				respContent = "�����͵��ǵ���λ����Ϣ��";
			}
			// ������Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				respContent = "�����͵���������Ϣ��";
			}
			// ��Ƶ��Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				respContent = "�����͵�����Ƶ��Ϣ��";
			}
			// �¼�����
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// �¼�����
				String eventType = requestMap.get("Event");
				// ����
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					BusinessDao businessDao=new BusinessDao();
					String businessid=businessDao.findBusIdByWechatId(toUserName);
					//System.out.println(businessid);
					
					if (businessid!=null) {
						respContent = "��ӭʹ��XX������ϵͳ�������:\n http://14.17.106.206/OrderDishes/wechat/welcome.jsp?businessid="+businessid;
					}
					else respContent = "�̼�΢�Ź���ƽ̨ID��"+toUserName;
					
					
					//System.out.println(toUserName);
//					if (toUserName.equals("gh_9f3ee86a3710")) {
//						respContent = "��ӭʹ��XX������ϵͳ�������:\n http://14.17.106.206/OrderDishes/wechat/welcome.jsp?businessid=1";
//					}
//					else if (toUserName.equals("gh_0290fa70241c")) {
//						respContent = "��ӭʹ��XX������ϵͳ�������:\n http://14.17.106.206/OrderDishes/wechat/welcome.jsp?businessid=2";
//					}
//					else respContent = "�̼�΢�Ź���ƽ̨ID��"+toUserName;
				}
				// ȡ������
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO ȡ�����ĺ��û����ղ������ںŷ��͵���Ϣ����˲���Ҫ�ظ���Ϣ
				}
				// �Զ���˵�����¼�
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					// TODO �Զ���˵�Ȩû�п��ţ��ݲ����������Ϣ
				}
			}

			textMessage.setContent(respContent);
			respMessage = MessageUtil.textMessageToXml(textMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return respMessage;
	}
}
