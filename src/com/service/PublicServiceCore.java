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
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request) {
		String respMessage = null;
		try {
			// 默认返回的文本消息内容
			String respContent = "请求处理异常，请稍候尝试！";

			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);

			// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");
			//消息内容
			String content=requestMap.get("Content");
			//System.out.println(content);
			//System.out.println(fromUserName);
			// 回复文本消息
			TextMessageResponse textMessage = new TextMessageResponse();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);

			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				respContent = "欢迎光临！";
			}
			// 图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				respContent = "您发送的是图片消息！";
			}
			// 地理位置消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				respContent = "您发送的是地理位置消息！";
			}
			// 链接消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				respContent = "您发送的是链接消息！";
			}
			// 音频消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				respContent = "您发送的是音频消息！";
			}
			// 事件推送
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 订阅
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {
					BusinessDao businessDao=new BusinessDao();
					String businessid=businessDao.findBusIdByWechatId(toUserName);
					//System.out.println(businessid);
					
					if (businessid!=null) {
						respContent = "欢迎使用XX饭店点菜系统！请访问:\n http://14.17.106.206/OrderDishes/wechat/welcome.jsp?businessid="+businessid;
					}
					else respContent = "商家微信公众平台ID："+toUserName;
					
					
					//System.out.println(toUserName);
//					if (toUserName.equals("gh_9f3ee86a3710")) {
//						respContent = "欢迎使用XX饭店点菜系统！请访问:\n http://14.17.106.206/OrderDishes/wechat/welcome.jsp?businessid=1";
//					}
//					else if (toUserName.equals("gh_0290fa70241c")) {
//						respContent = "欢迎使用XX饭店点菜系统！请访问:\n http://14.17.106.206/OrderDishes/wechat/welcome.jsp?businessid=2";
//					}
//					else respContent = "商家微信公众平台ID："+toUserName;
				}
				// 取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					// TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息
				}
				// 自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					// TODO 自定义菜单权没有开放，暂不处理该类消息
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
