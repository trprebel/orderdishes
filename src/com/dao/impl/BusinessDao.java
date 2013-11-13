package com.dao.impl;

import com.bean.Business;

public class BusinessDao {

	public void addbusiness(Business business) throws Exception
	{
		SqlMap.getSqlMapClient().insert("addbusiness",business);
	}
	public Integer findlastbusinessid() throws Exception
	{
		return (Integer)SqlMap.getSqlMapClient().queryForObject("findlastbusinessid");
	}
	public java.lang.String findBusUserById(int businessid) throws Exception{
		//System.out.println(businessid);
		return (java.lang.String)SqlMap.getSqlMapClient().queryForObject("findBusUserById",businessid);
	}
	public String findBusIdByWechatId(String wechatid) throws Exception
	{
		return (String)SqlMap.getSqlMapClient().queryForObject("findBusIdByWechatId",wechatid);
	}
}
