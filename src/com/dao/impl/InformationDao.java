package com.dao.impl;

import com.bean.Information;

public class InformationDao {

	/**发布消息
	 * @throws Exception
	 */
	public void releaseInfo(Information info) throws Exception{
		SqlMap.getSqlMapClient().insert("releaseInfo",info);
	}
}
