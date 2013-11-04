package com.dao.impl;

import java.util.List;

import com.bean.FeedBack;

public class FeedBackDao {

	public void addFeedBack(FeedBack feedBack) throws Exception
	{
		SqlMap.getSqlMapClient().insert("addFeedBack",feedBack);
	}
	public List<FeedBack> findShowFeedBack() throws Exception
	{
		return (List<FeedBack>) SqlMap.getSqlMapClient().queryForList("findShowFeedBack");
	}
	public void ignoreFeedBack(int id) throws Exception 
	{
		SqlMap.getSqlMapClient().update("ignoreFeedBack",id);
	}
}
