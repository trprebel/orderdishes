package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.Information;
import com.bean.User;
import com.dao.impl.InformationDao;
import com.dao.impl.MsgDao;
import com.opensymphony.xwork2.ActionSupport;

/** 信息处理相关操作
 * @author zxj
 * 2013-10-9
 */
public class InformationAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private String type;
	private String resultPage;
	private List<String> infodesc;
	private InformationDao infodao=new InformationDao();

	public List<String> getInfodesc() {
		return infodesc;
	}

	public void setInfodesc(List<String> infodesc) {
		this.infodesc = infodesc;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getResultPage() {
		return resultPage;
	}

	public void setResultPage(String resultPage) {
		this.resultPage = resultPage;
	}

	public String release() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			User user=(User)session.getAttribute("user");
			infodao=new InformationDao();
			Information info=new Information();
			for (int i = 0; i < infodesc.size(); i++) {
				
				if (!infodesc.get(i).equals("")) {
					//System.out.println(desc.get(i));
					info.setDescript(infodesc.get(i));
					info.setType(i+1);
					info.setBusinessid(user.getBusinessid());
					infodao.releaseInfo(info);
					
				}
			}
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String werequest()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			int businessid=Integer.parseInt((String)session.getAttribute("businessid"));
			Information info=new Information();
			info.setBusinessid(businessid);
			info.setType(Integer.parseInt(type));
			List<String> informations=infodao.findInfo(info);
			request.setAttribute("informations", informations);
			return resultPage;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
}
