package com.dao.impl;

import com.bean.Information;

public class InformationDao {

	/**������Ϣ
	 * @throws Exception
	 */
	public void releaseInfo(Information info) throws Exception{
		SqlMap.getSqlMapClient().insert("releaseInfo",info);
	}
}
