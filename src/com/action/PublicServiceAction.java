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
	

}
