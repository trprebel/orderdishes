package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.bean.Food;
import com.dao.impl.FoodDao;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;
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
	private String food;
	private String price;
	private String isfeature;
	private String num;
	private String descript;
	private String small_pic;
	private String big_pic;
	private File picture;   //保存上传的文件
	private String pictureContentType;	 //保存上传的文件类型
	private String pictureFileName;   //保存上传的文件名
	private String uploadPath;

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
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getIsfeature() {
		return isfeature;
	}
	public void setIsfeature(String isfeature) {
		this.isfeature = isfeature;
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
	/**请求菜谱列表
	 * @return String
	 */
	public String request()
	{
		//HttpServletRequest request=ServletActionContext.getRequest();
		try
		{
			//String path=StringUtil.getSpPropeurl("imagePath");
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
//			for (Food food : foodlist) {
//				food.setSmall_pic(path+food.getSmall_pic());
//				food.setBig_pic(path+food.getBig_pic());
//				//System.out.println(drink.getSmall_pic());
//			}
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
	public String add() {
		//HttpServletRequest request=ServletActionContext.getRequest();
		//HttpSession session=request.getSession();
		try {
//			System.out.println(food);
//			System.out.println(price);
//			System.out.println(isfeature);
//			System.out.println(num);
//			System.out.println(descript);
//			System.out.println(small_pic);
			Food foodbean=new Food();
			foodbean.setFood(food);
			foodbean.setPrice(Integer.parseInt(price));
			foodbean.setIsfeature(Integer.parseInt(isfeature));
			foodbean.setNum(Integer.parseInt(num));
			foodbean.setSmall_pic(small_pic);
			foodbean.setBig_pic(big_pic);
			foodbean.setDescript(descript);
			
			fooddao=new FoodDao();
			fooddao.addFood(foodbean);
			
			return "request";
		} catch (Exception e) {
			// TODO: handle exception
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
	/**
	 * 上传图片
	 */
	public void upload() {

		//HttpSession session=request.getSession();
		//System.out.println("uploadfile");
		try {


			StringUtil.getSpPropeurl("imagePath");
			uploadPath=StringUtil.getSpPropeurl("imagePath");

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
	public String requestone() {
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			System.out.println(foodid);
			fooddao=new FoodDao();
			Food foodbean=fooddao.findFoodById(Integer.parseInt(foodid));
			request.setAttribute("food", foodbean);
			return "modify";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	public String modify() {
		HttpServletRequest request=ServletActionContext.getRequest();
		try {
			System.out.println(foodid);
			
			return "request";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
		
	}

}