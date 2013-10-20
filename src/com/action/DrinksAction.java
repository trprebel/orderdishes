package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.Drinks;
import com.bean.Message;
import com.bean.User;
import com.dao.impl.DrinksDao;
import com.dao.impl.MsgDao;
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

	private String drinks;
	private String price;
	private String num;
	private String descript;
	private String small_pic;
	private String big_pic;
	private MsgDao msgDao=new MsgDao();
	private File picture;   //保存上传的文件
	private String pictureContentType;	 //保存上传的文件类型
	private String pictureFileName;   //保存上传的文件名
	//private String uploadPath;
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
	public String getDrinks() {
		return drinks;
	}
	public void setDrinks(String drinks) {
		this.drinks = drinks;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getSmall_pic() {
		return small_pic;
	}
	public void setSmall_pic(String small_pic) {
		this.small_pic = small_pic;
	}
	public String getBig_pic() {
		return big_pic;
	}
	public void setBig_pic(String big_pic) {
		this.big_pic = big_pic;
	}
	public File getPicture() {
		return picture;
	}
	public void setPicture(File picture) {
		this.picture = picture;
	}
	public String getPictureContentType() {
		return pictureContentType;
	}
	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}
	public String getPictureFileName() {
		return pictureFileName;
	}
	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}
	/**请求酒水列表
	 * @return String
	 */
	public String request()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try
		{
			//String path=StringUtil.getSpPropeurl("imagePath");
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
			
			paginator.setData(count, drinks);
			User user=(User)session.getAttribute("user");
			//System.out.println(user.getUsername());
			List<Message> msgs=msgDao.findUnreadMsg(user.getUsername());
			if (msgs.isEmpty()) {
				session.setAttribute("msgs", "暂无处理信息");
			}
			else session.setAttribute("msgs", "有客户想与您说话");
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
	/**
	 * 上传图片
	 */
	public void upload() {

		//HttpSession session=request.getSession();
		//System.out.println("uploadfile");
		try {


			StringUtil.getSpPropeurl("imagePath");
			String uploadPath=StringUtil.getSpPropeurl("imagePath");

			String filename = pictureFileName; 
			Random random = new Random();

			//把上传的文件用生成的随机数重新命名
			//并判断生成的文件名是否已经存在
			//如果存在，则继续生成随机数命名，直到找打还没使用的随机数为止
			String dbfilename="images/"+random.nextLong()+ filename.substring(filename.lastIndexOf("."));
			filename = uploadPath + dbfilename;

			while (new File(filename).exists()) {
				dbfilename="images/"+random.nextLong()+ filename.substring(filename.lastIndexOf("."));
				filename = uploadPath + dbfilename;
			}

			//System.out.println(dbfilename);
			FileOutputStream fos = new FileOutputStream(filename);
			//System.out.println(filename);
			InputStream is = new FileInputStream(picture);
			try
			{

				byte[] buffer = new byte[4*1024];
				int count = 0;
				while ((count = is.read(buffer)) > 0) {
					fos.write(buffer, 0, count);
				}
				//System.out.println(filename);
				
				
			  	PrintWriter out =  ServletActionContext.getResponse().getWriter();
			  	out.write(dbfilename);
			  	out.flush();
			  	out.close();

			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally
			{
				fos.close();
				is.close();
			}
			


		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public String add() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
//			System.out.println(drinks);
//			System.out.println(price);
////			System.out.println(isfeature);
//			System.out.println(num);
//			System.out.println(descript);
//			System.out.println(small_pic);
//			System.out.println(big_pic);
			Drinks drinksbean=new Drinks();
			drinksbean.setDrinks(drinks);
			drinksbean.setPrice(Integer.parseInt(price));
			//drinks.setIsfeature(Integer.parseInt(isfeature));
			drinksbean.setNum(Integer.parseInt(num));
			drinksbean.setSmall_pic(small_pic);
			drinksbean.setBig_pic(big_pic);
			drinksbean.setDescript(descript);
			drinksdao=new DrinksDao();
			drinksdao.addDrink(drinksbean);
			User user=(User)session.getAttribute("user");
			//System.out.println(user.getUsername());
			List<Message> msgs=msgDao.findUnreadMsg(user.getUsername());
			if (msgs.isEmpty()) {
				session.setAttribute("msgs", "暂无处理信息");
			}
			else session.setAttribute("msgs", "有客户想与您说话");
			
			return "request";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	
	public String requestone() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			//System.out.println(drinksid);
			drinksdao=new DrinksDao();
			Drinks drinks=drinksdao.findDrinkById(Integer.parseInt(drinksid));
			request.setAttribute("drink", drinks);
			User user=(User)session.getAttribute("user");
			//System.out.println(user.getUsername());
			List<Message> msgs=msgDao.findUnreadMsg(user.getUsername());
			if (msgs.isEmpty()) {
				session.setAttribute("msgs", "暂无处理信息");
			}
			else session.setAttribute("msgs", "有客户想与您说话");
			return "modify";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String modify() {
		//HttpServletRequest request=ServletActionContext.getRequest();
		try {
			//System.out.println(drinksid);
			Drinks drink=new Drinks();
			drink.setDrinksid(Integer.parseInt(drinksid));
			drink.setDrinks(drinks);
			drink.setPrice(Integer.parseInt(price));
			drink.setNum(Integer.parseInt(price));
			drink.setSmall_pic(small_pic);
			drink.setBig_pic(big_pic);
			drink.setDescript(descript);

			drinksdao=new DrinksDao();
			drinksdao.modifyDrink(drink);
						
			return "request";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
		
	}


}
