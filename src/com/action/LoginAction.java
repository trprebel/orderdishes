package com.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.User;
import com.dao.impl.UserDao;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String repassword;
	private UserDao userdao;
	private User user;
	public String messages;
	public String getMessages() {
		return messages;
	}
	public void setMessages(String messages) {
		this.messages = messages;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public String login()
	{
		//System.out.println(username);
		//System.out.print(password);
		userdao=new UserDao();
		//user=new User();
		try
		{
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			
			user=this.userdao.findUserByName(username);
			if(user==null)
			{
				messages="�û��������ڣ�";
				//System.out.println("�û���������");
				return "login";
			}
			else if(user.getPasswd().equals(password))
			{
				//System.out.println(user.getPasswd());
				session.setAttribute("user", user);
				return "success";
			}
			else
			{
				//System.out.println("�������!");
				messages="�������";
				return "login";
			}
			//System.out.println(user.getUsername());
			//System.out.println(user.getPassword());
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "error";
		}
	}
	public String modifypasswd()
	{
		try
		{
			userdao=new UserDao();
			user=new User();
			user.setUsername(username);
			user.setPasswd(password);
			userdao.modifyPassWord(user);
			messages="�޸ĳɹ���";
			return "success";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "error";
		}
		
		
	}
	

}
