package com.dao.impl;

import java.util.List;

import com.bean.Information;

public class InformationDao {

	/**发布消息
	 * @throws Exception
	 */
	public void releaseInfo(Information info) throws Exception{
		SqlMap.getSqlMapClient().insert("releaseInfo",info);
	}
	/**查找信息*/
	public List<String> findInfo(Information info) throws Exception
	{
		return (List<String>)SqlMap.getSqlMapClient().queryForList("findInfo",info);
	}
}
