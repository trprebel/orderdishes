package com.dao.impl;

import java.util.List;

import com.bean.Message;

public class MsgDao {

	/**�����û���Ϣ*/
	public List<Message> findUnreadMsg(String username) throws Exception
	{
		return (List<Message>) SqlMap.getSqlMapClient().queryForList("findunreadmsg",username);
	}
	/**����û���Ϣ*/
	public void insertMessage(Message msg) throws Exception
	{
		SqlMap.getSqlMapClient().insert("insertMessage",msg);
	}
}
