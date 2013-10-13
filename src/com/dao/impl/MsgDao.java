package com.dao.impl;

import java.util.List;

import com.bean.Message;

public class MsgDao {

	/**查找用户消息*/
	public List<Message> findUnreadMsg(String username) throws Exception
	{
		return (List<Message>) SqlMap.getSqlMapClient().queryForList("findunreadmsg",username);
	}
	/**添加用户消息*/
	public void insertMessage(Message msg) throws Exception
	{
		SqlMap.getSqlMapClient().insert("insertMessage",msg);
	}
}
