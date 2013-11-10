package com.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bean.publicservice.TextMessageResponse;
import com.opensymphony.xwork2.ActionSupport;
import com.service.PublicServiceCore;
import com.util.MessageUtil;
import com.util.SignUtil;



/**微信公众平台相关操作
 * @author zxj
 * 2013-11-10
 */
public class PublicServiceAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	
	
	
	public void handle() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		String method = request.getMethod();
		//System.out.println(method);

		if(method.equals("POST")){

			//System.out.println("POST请求");
			try {
				response.setCharacterEncoding("UTF-8");
				
				// 调用核心业务类接收消息、处理消息  
				String respMessage = PublicServiceCore.processRequest(request);  
				 
				// 响应消息  
				PrintWriter out = response.getWriter();  
				out.print(respMessage);  
				out.close(); 
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			 
			

		}else{
			try {
				//System.out.println("GET请求");
				// 微信加密签名  
				String signature = request.getParameter("signature");  
				// 时间戳  
				String timestamp = request.getParameter("timestamp");  
				// 随机数  
				String nonce = request.getParameter("nonce");  
				// 随机字符串  
				String echostr = request.getParameter("echostr");  
				
				PrintWriter out = response.getWriter();  
				// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败  
				if (SignUtil.checkSignature(signature, timestamp, nonce)) {  
				     out.print(echostr);  
				}  
//				out.print("servlet");
//				System.out.println("interface");
				out.close();  
				out = null; 
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
	}
	
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
				respContent = fromUserName;
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
					respContent = "谢谢您的关注！";
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
