package com.action;

import java.util.List;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.FeedBack;
import com.bean.User;
import com.dao.impl.FeedBackDao;
import com.opensymphony.xwork2.ActionSupport;

/**Òâ¼û·´À¡
 * @author zxj
 * 2013-11-4
 */
public class FeedBackAction extends ActionSupport{


	private static final long serialVersionUID = 1L;
	private String content;
	private String id;
	
	FeedBackDao feedBackDao=new FeedBackDao();
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String wechat()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			int businessid=Integer.parseInt((String)session.getAttribute("businessid"));
			//System.out.println("feedback");
			//System.out.println(content);
			FeedBack feedBack=new FeedBack();
			feedBack.setContent(content);
			feedBack.setIsshow(1);
			feedBack.setBusinessid(businessid);
			feedBackDao.addFeedBack(feedBack);
			return "welcome";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String request()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			User user=(User)session.getAttribute("user");
			//System.out.println("feedbacklist");
			List<FeedBack> feedBacks=feedBackDao.findShowFeedBack(user.getBusinessid());
			request.setAttribute("feedbacks", feedBacks);
			return "feedbacklist";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String ignore()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			User user=(User)session.getAttribute("user");
			//System.out.println(id);
			feedBackDao.ignoreFeedBack(Integer.parseInt(id));
			List<FeedBack> feedBacks=feedBackDao.findShowFeedBack(user.getBusinessid());
			request.setAttribute("feedbacks", feedBacks);
			return "feedbacklist";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
}
