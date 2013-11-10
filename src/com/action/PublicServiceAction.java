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



/**΢�Ź���ƽ̨��ز���
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

			//System.out.println("POST����");
			try {
				response.setCharacterEncoding("UTF-8");
				
				// ���ú���ҵ���������Ϣ��������Ϣ  
				String respMessage = PublicServiceCore.processRequest(request);  
				 
				// ��Ӧ��Ϣ  
				PrintWriter out = response.getWriter();  
				out.print(respMessage);  
				out.close(); 
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			 
			

		}else{
			try {
				//System.out.println("GET����");
				// ΢�ż���ǩ��  
				String signature = request.getParameter("signature");  
				// ʱ���  
				String timestamp = request.getParameter("timestamp");  
				// �����  
				String nonce = request.getParameter("nonce");  
				// ����ַ���  
				String echostr = request.getParameter("echostr");  
				
				PrintWriter out = response.getWriter();  
				// ͨ������signature���������У�飬��У��ɹ���ԭ������echostr����ʾ����ɹ����������ʧ��  
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
				respContent = fromUserName;
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
					respContent = "лл���Ĺ�ע��";
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
