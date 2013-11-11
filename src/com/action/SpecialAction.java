package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.Food;
import com.bean.User;
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
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			User user=(User)session.getAttribute("user");
			//System.out.println("request-special");
			fooddao=new FoodDao();
			int count=fooddao.findSpecialPriceCount(user.getBusinessid());

			program.setStart(paginator.getOffset());
			program.setLenth(paginator.getPageSize());
			program.setBusinessid(user.getBusinessid());
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
