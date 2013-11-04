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
import com.bean.OrderSpecial;
import com.bean.Staple;
import com.bean.User;
import com.dao.impl.DrinksDao;
import com.dao.impl.FoodDao;
import com.dao.impl.MsgDao;
import com.dao.impl.StapleDao;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Paginator;
import com.util.Program;

import filter.StringUtil;

/**��ʳ��ز���
 * @author zxj
 * 2013-11-4
 */
public class StapleFoodAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private String stapleid;
	private String staplefood;
	private String price;
	private String num;
	private String descript;
	private String small_pic;
	private String big_pic;
	
	private String resultString;
	private String resultPage;
	private File picture;   //�����ϴ����ļ�
	private String pictureContentType;	 //�����ϴ����ļ�����
	private String pictureFileName;   //�����ϴ����ļ���
	//private String uploadPath;
	private StapleDao stapleDao=new StapleDao();
	public Paginator paginator=new Paginator(9);
	private MsgDao msgDao=new MsgDao();
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

	public String getStapleid() {
		return stapleid;
	}
	public void setStapleid(String stapleid) {
		this.stapleid = stapleid;
	}
	public String getStaplefood() {
		return staplefood;
	}
	public void setStaplefood(String staplefood) {
		this.staplefood = staplefood;
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
	public String getResultString() {
		return resultString;
	}
	public void setResultString(String resultString) {
		this.resultString = resultString;
	}
	public String getResultPage() {
		return resultPage;
	}
	public void setResultPage(String resultPage) {
		this.resultPage = resultPage;
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
	/**�����ˮ�б�
	 * @return String
	 */
	public String request()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try
		{
			//String path=StringUtil.getSpPropeurl("imagePath");

			int count=stapleDao.findStapleCount();
			//System.out.println(paginator.getCurrentPage());
			//paginator.setPageSize(6);
			//System.out.println(paginator.getOffset());
			if (paginator.getCurrentPage()==1) {
				program.setStart(paginator.getOffset());
				program.setLenth(paginator.getPageSize()-1);
			}
			else {
				program.setStart(paginator.getOffset()-1);
				program.setLenth(paginator.getPageSize());
			}
			if(count==0){
				paginator.setData(0, null);
				return "staplelist";
			}
			List<Staple> staples=stapleDao.findStapleList(program);
			paginator.setData(count, staples);
			User user=(User)session.getAttribute("user");
			//System.out.println(user.getUsername());
			List<Message> msgs=msgDao.findUnreadMsg(user.getUsername());
			if (msgs.isEmpty()) {
				session.setAttribute("msgs", "���޴�����Ϣ");
			}
			else session.setAttribute("msgs", "�пͻ�������˵��");
			//request.setAttribute("drinks", drinks);
			return "staplelist";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			return "error";
		}
	}
	/**ɾ����ˮ
	 * @return
	 */
	public String delete()
	{
		try {
			//System.out.println(drinksid);
			
			stapleDao.deleteStaple(Integer.parseInt(stapleid));
			return "request";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * �ϴ�ͼƬ
	 */
	public void upload() {

		//HttpSession session=request.getSession();
		//System.out.println("uploadfile");
		try {


			StringUtil.getSpPropeurl("imagePath");
			String uploadPath=StringUtil.getSpPropeurl("imagePath");

			String filename = pictureFileName; 
			Random random = new Random();

			//���ϴ����ļ������ɵ��������������
			//���ж����ɵ��ļ����Ƿ��Ѿ�����
			//������ڣ���������������������ֱ���Ҵ�ûʹ�õ������Ϊֹ
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

			
			
			Staple staple=new Staple();
			staple.setStaplefood(staplefood);
			staple.setPrice(Integer.parseInt(price));
			staple.setNum(Integer.parseInt(num));
			staple.setSmall_pic(small_pic);
			staple.setBig_pic(big_pic);
			staple.setDescript(descript);
			stapleDao.addStaple(staple);
			
			User user=(User)session.getAttribute("user");
			//System.out.println(user.getUsername());
			List<Message> msgs=msgDao.findUnreadMsg(user.getUsername());
			if (msgs.isEmpty()) {
				session.setAttribute("msgs", "���޴�����Ϣ");
			}
			else session.setAttribute("msgs", "�пͻ�������˵��");
			
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
			Staple staple=stapleDao.findStapleById(Integer.parseInt(stapleid));
			request.setAttribute("staple", staple);
			User user=(User)session.getAttribute("user");
			//System.out.println(user.getUsername());
			List<Message> msgs=msgDao.findUnreadMsg(user.getUsername());
			if (msgs.isEmpty()) {
				session.setAttribute("msgs", "���޴�����Ϣ");
			}
			else session.setAttribute("msgs", "�пͻ�������˵��");
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
						
			Staple staple=new Staple();
			staple.setStapleid(Integer.parseInt(stapleid));
			staple.setStaplefood(staplefood);
			staple.setPrice(Integer.parseInt(price));
			staple.setNum(Integer.parseInt(num));
			staple.setSmall_pic(small_pic);
			staple.setBig_pic(big_pic);
			staple.setDescript(descript);
			stapleDao.modifyStaple(staple);
			return "request";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
		
	}
	/**΢��ҳ����������б�
	 * @return
	 */
	public String werequest()
	{
		try {
			int count;
			List<Staple> staplelist;
			paginator.setPageSize(100);
			program.setStart(paginator.getOffset());
			program.setLenth(paginator.getPageSize());
			
			
			count=stapleDao.findStapleCount();
			staplelist=stapleDao.findStapleList(program);

			if(count==0){
				paginator.setData(0, null);
				return resultPage;
			}
						
			paginator.setData(count, staplelist);
			return resultPage;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
	/**Ԥ��
	 * @return
	 */
	public String order()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		try {
			FoodDao fooddao=new FoodDao();
			//Drinks drinks=drinksdao.findDrinkById(Integer.parseInt(drinksid));
			Staple staple=stapleDao.findStapleById(Integer.parseInt(stapleid));
			OrderSpecial orderSpecial=new OrderSpecial();
			orderSpecial.setTempcus(session.getId());
			orderSpecial.setFoodid(staple.getStapleid());
			orderSpecial.setFood(staple.getStaplefood());
			orderSpecial.setSmall_pic(staple.getSmall_pic());
			orderSpecial.setPrice(staple.getPrice());
			orderSpecial.setCount(1);
			orderSpecial.setType(1);
			orderSpecial.setState(0);
			fooddao.orderFood(orderSpecial);
			resultString="Ԥ���ɹ���";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			resultString="Ԥ��ʧ�ܣ�";
		}
		return "ajaxresult";
	}
}
