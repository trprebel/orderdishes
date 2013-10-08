package com.action;

import java.util.List;

import com.bean.Food;
import com.dao.impl.FoodDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Paginator;
import com.util.Program;

import filter.StringUtil;

/**菜谱相关操作
 * @author zxj
 * 2013-10-8
 */
public class FoodAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private String foodid;

	private FoodDao fooddao;
	public Paginator paginator=new Paginator(9);
	private Program program=new Program();
	public String getFoodid() {
		return foodid;
	}
	public void setFoodid(String foodid) {
		this.foodid = foodid;
	}
	public Paginator getPaginator() {
		return paginator;
	}
	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
	public Program getProgram() {
		return program;
	}
	public void setProgram(Program program) {
		this.program = program;
	}
	/**请求菜谱列表
	 * @return String
	 */
	public String request()
	{
		//HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			String path=StringUtil.getSpPropeurl("imagePath");
			fooddao=new FoodDao();
			int count=fooddao.findFoodCount();
			//System.out.println(paginator.getCurrentPage());
			//paginator.setPageSize(6);
			//System.out.println(paginator.getOffset());
			program.setStart(paginator.getOffset());
			program.setLenth(paginator.getPageSize());
			if(count==0){
				paginator.setData(0, null);
				return "food";
			}
			List<Food> foodlist=fooddao.findFoodList(program);
			for (Food food : foodlist) {
				food.setSmall_pic(path+food.getSmall_pic());
				food.setBig_pic(path+food.getBig_pic());
				//System.out.println(drink.getSmall_pic());
			}
			paginator.setData(count, foodlist);
			//request.setAttribute("Food", Food);
			return "food";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return "error";
		}
	}
	/**删除菜
	 * @return
	 */
	public String delete()
	{
		try {
			//System.out.println(foodid);
			
			fooddao=new FoodDao();
			
			fooddao.deleteFood(Integer.parseInt(foodid));
			return "request";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
}
