package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bean.Drinks;
import com.dao.impl.DrinksDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Paginator;
import com.util.Program;

public class DrinksAction extends ActionSupport{

	/**酒水饮料相关操作
	 * @author zxj
	 * @date 2013-10-04
	 */
	private static final long serialVersionUID = 1L;
	private DrinksDao drinksdao;
	public Paginator paginator=new Paginator(6);
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
	public String request()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			drinksdao=new DrinksDao();
			int count=drinksdao.findDrinksCount();
			System.out.println(paginator.getCurrentPage());
			//paginator.setPageSize(6);
			//System.out.println(paginator.getOffset());
			program.setStart(paginator.getOffset());
			program.setLenth(paginator.getPageSize());
			if(count==0){
				paginator.setData(0, null);
				return "drinks";
			}
			List<Drinks> drinks=drinksdao.findDrinksList(program);
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


}
