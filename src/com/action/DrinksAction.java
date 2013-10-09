package com.action;

import java.util.List;

import com.bean.Drinks;
import com.dao.impl.DrinksDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Paginator;
import com.util.Program;

import filter.StringUtil;
/**酒水饮料相关操作
 * @author zxj
 * 2013-10-04
 */
public class DrinksAction extends ActionSupport{

	
	private static final long serialVersionUID = 1L;
	private String drinksid;

	private DrinksDao drinksdao;
	public Paginator paginator=new Paginator(9);
	private Program program=new Program();
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
	public String getDrinksid() {
		return drinksid;
	}
	public void setDrinksid(String drinksid) {
		this.drinksid = drinksid;
	}
	/**请求酒水列表
	 * @return String
	 */
	public String request()
	{
		//HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			String path=StringUtil.getSpPropeurl("imagePath");
			drinksdao=new DrinksDao();
			int count=drinksdao.findDrinksCount();
			//System.out.println(paginator.getCurrentPage());
			//paginator.setPageSize(6);
			//System.out.println(paginator.getOffset());
			program.setStart(paginator.getOffset());
			program.setLenth(paginator.getPageSize());
			if(count==0){
				paginator.setData(0, null);
				return "drinks";
			}
			List<Drinks> drinks=drinksdao.findDrinksList(program);
			for (Drinks drink : drinks) {
				drink.setSmall_pic(path+drink.getSmall_pic());
				drink.setBig_pic(path+drink.getBig_pic());
				//System.out.println(drink.getSmall_pic());
			}
			paginator.setData(count, drinks);
			//request.setAttribute("drinks", drinks);
			return "drinks";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return "error";
		}
	}
	/**删除酒水
	 * @return
	 */
	public String delete()
	{
		try {
			//System.out.println(drinksid);
			
			drinksdao=new DrinksDao();
			
			drinksdao.deleteDrink(Integer.parseInt(drinksid));
			return "request";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}


}
