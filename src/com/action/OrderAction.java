package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.Drinks;
import com.bean.Food;
import com.bean.OrderSpecial;
import com.bean.Staple;
import com.dao.impl.DrinksDao;
import com.dao.impl.FoodDao;
import com.dao.impl.OrderDao;
import com.dao.impl.StapleDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Program;

/**订单相关操作
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
	public String requestall()
	{
		//System.out.println("requestall");
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			int businessid=Integer.parseInt((String)request.getParameter("businessid"));
			List<Food> foods=orderDao.findAllFood();
			List<Staple> staples=orderDao.findAllStaple();
			List<Drinks> drinks=orderDao.findAllDrinks(businessid);
			List<OrderSpecial> orderSpecials=orderDao.findMyOrder(session.getId());
			
			for (Food food : foods) {
				food.setNum(0);
				if (!orderSpecials.isEmpty()) {
					for (OrderSpecial orderSpecial : orderSpecials) {
						if (orderSpecial.getType()==0&&orderSpecial.getFoodid()==food.getFoodid()) {
							food.setNum(orderSpecial.getCount());
							orderSpecials.remove(orderSpecial);
							break;
						}
					}
				}
			}
			for (Staple staple : staples) {
				staple.setNum(0);
				if (!orderSpecials.isEmpty()) {
					for (OrderSpecial orderSpecial : orderSpecials) {
						if (orderSpecial.getType()==1&&orderSpecial.getFoodid()==staple.getStapleid()) {
							staple.setNum(orderSpecial.getCount());
							orderSpecials.remove(orderSpecial);
							break;
						}
					}
				}
			}
			for (Drinks drink : drinks) {
				drink.setNum(0);
				if (!orderSpecials.isEmpty()) {
					for (OrderSpecial orderSpecial : orderSpecials) {
						if (orderSpecial.getType()==2&&orderSpecial.getFoodid()==drink.getDrinksid()) {
							drink.setNum(orderSpecial.getCount());
							orderSpecials.remove(orderSpecial);
							break;
						}
					}
				}
			}
			
			
			
			request.setAttribute("foods", foods);
			request.setAttribute("drinks", drinks);
			request.setAttribute("staples", staples);

			return "pay2";
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
				//System.out.println(Integer.parseInt(count.get(i)));
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
