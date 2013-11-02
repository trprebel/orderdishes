package com.action;

import java.util.List;

import com.bean.Food;
import com.dao.impl.FoodDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Paginator;
import com.util.Program;

/**特色特价菜显示
 * @author zxj
 * 2013-10-25
 */
public class SpecialAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private FoodDao fooddao=new FoodDao(); 
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

	public String specialprice()
	{
		try {
			//System.out.println("request-special");
			fooddao=new FoodDao();
			int count=fooddao.findSpecialPriceCount();

			program.setStart(paginator.getOffset());
			program.setLenth(paginator.getPageSize());
			if(count==0){
				paginator.setData(0, null);
				return "special";
			}
			List<Food> specialpricelist=fooddao.findSpecialPriceList(program);

			paginator.setData(count, specialpricelist);
			return "special";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
}
