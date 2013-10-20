package com.dao.impl;

import java.util.List;

import com.bean.Message;
import com.bean.QuickReplay;

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
	/**���ҿ��ٻظ���Ϣ*/
	public List<QuickReplay> findQuickReplay() throws Exception
	{
		return (List<QuickReplay>)SqlMap.getSqlMapClient().queryForList("findQuickReplay");
	}
}
