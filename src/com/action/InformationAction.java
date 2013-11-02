package com.action;

import java.util.List;

import com.bean.Information;
import com.dao.impl.InformationDao;
import com.dao.impl.MsgDao;
import com.opensymphony.xwork2.ActionSupport;

/** 信息处理相关操作
 * @author zxj
 * 2013-10-9
 */
public class InformationAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private List<String> infodesc;
	private InformationDao infodao;

	public List<String> getInfodesc() {
		return infodesc;
	}

	public void setInfodesc(List<String> infodesc) {
		this.infodesc = infodesc;
	}

	public String release() {
		try {
			infodao=new InformationDao();
			Information info=new Information();
			for (int i = 0; i < infodesc.size(); i++) {
				
				if (!infodesc.get(i).equals("")) {
					//System.out.println(desc.get(i));
					info.setDescript(infodesc.get(i));
					info.setType(i+1);
					infodao.releaseInfo(info);
				}
			}
			return "success";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "error";
		}
	}
}
