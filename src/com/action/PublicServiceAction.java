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
	

}
