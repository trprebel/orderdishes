package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.OrderSpecial;
import com.dao.impl.OrderDao;
import com.opensymphony.xwork2.ActionSupport;

/**������ز���
 * @author zxj
 * 2013-10-26
 */
public class OrderAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private String resultPage;
	private OrderDao orderDao=new OrderDao();
	private List<String> foodid;
	private List<String> count;
	private List<String> type;
	
	public String getResultPage() {
		return resultPage;
	}

	public void setResultPage(String resultPage) {
		this.resultPage = resultPage;
	}
	public List<String> getFoodid() {
		return foodid;
	}

	public void setFoodid(List<String> foodid) {
		this.foodid = foodid;
	}

	public List<String> getCount() {
		return count;
	}

	public void setCount(List<String> count) {
		this.count = count;
	}

	public List<String> getType() {
		return type;
	}

	public void setType(List<String> type) {
		this.type = type;
	}

	public String requestmy()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			//System.out.println(session.getId());
			List<OrderSpecial> orderSpecials=orderDao.findMyOrder(session.getId());
			request.setAttribute("myorders", orderSpecials);
			return resultPage;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String pay() {
		try {
			HttpServletRequest request=ServletActionContext.getRequest();
			HttpSession session=request.getSession();
			//System.out.println(foodid.get(0));
			for(int i=0;i<foodid.size();i++)
			{
				OrderSpecial orderSpecial=new OrderSpecial();
				orderSpecial.setFoodid(Integer.parseInt(foodid.get(i)));
				orderSpecial.setCount(Integer.parseInt(count.get(i)));
				orderSpecial.setType(Integer.parseInt(type.get(i)));
				orderSpecial.setTempcus(session.getId());
				orderDao.overBook(orderSpecial);
			}
			return "welcome";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
}
