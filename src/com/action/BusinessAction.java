package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

import com.bean.Business;
import com.bean.User;
import com.dao.impl.BusinessDao;
import com.dao.impl.UserDao;
import com.opensymphony.xwork2.ActionSupport;

import filter.StringUtil;

/**商家相关操作
 * @author zxj
 * 2013-11-12
 */
public class BusinessAction extends ActionSupport{


	private static final long serialVersionUID = 1L;
	private String busname;
	private String corporation;
	private String license;
	private String address;
	private String descript;
	private String wechatid;
	private String username;
	private String password;
	private File picture;   //保存上传的文件
	private String pictureContentType;	 //保存上传的文件类型
	private String pictureFileName;   //保存上传的文件名
	
	private BusinessDao businessDao=new BusinessDao();
	public String getBusname() {
		return busname;
	}
	public void setBusname(String busname) {
		this.busname = busname;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getWechatid() {
		return wechatid;
	}
	public void setWechatid(String wechatid) {
		this.wechatid = wechatid;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String add()
	{
		try {
			//System.out.println(busname);
			Business business=new Business();
			business.setBusname(busname);
			business.setCorporation(corporation);
			business.setLicense(license);
			business.setAddress(address);
			business.setDescript(descript);
			business.setWechatid(wechatid);
			businessDao.addbusiness(business);
			int businessid=businessDao.findlastbusinessid();
			UserDao userDao=new UserDao();
			User user=new User();
			user.setUsername(username);
			user.setPasswd(password);
			user.setRoleid(2);
			user.setBusinessid(businessid);
			userDao.addUser(user);
			return "success";
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


			//StringUtil.getSpPropeurl("imagePath");
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
}
