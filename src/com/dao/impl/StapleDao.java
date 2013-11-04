package com.dao.impl;

import java.util.List;

import com.bean.Staple;
import com.util.Program;

public class StapleDao {

	/**查找主食总数*/
	public Integer findStapleCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findStapleCount");
	}

	/**查找主食列表*/
	public List<Staple> findStapleList(Program program ) throws Exception{
		return (List<Staple>) SqlMap.getSqlMapClient().queryForList("findStapleList",program);
	}
	/**删除主食 */
	public void deleteStaple(int Stapleid) throws Exception{
		SqlMap.getSqlMapClient().delete("deleteStaple",Stapleid);
	}
	/**添加主食*/
	public void addStaple(Staple Staple) throws Exception{
		SqlMap.getSqlMapClient().insert("addStaple",Staple);
	}
	/**通过ID查找主食*/
	public Staple findStapleById(int id) throws Exception{
		return (Staple) SqlMap.getSqlMapClient().queryForObject("findStapleById",id);
		
	}
	/**修改主食属性*/
	public void modifyStaple(Staple Staple) throws Exception{
		SqlMap.getSqlMapClient().update("modifyStaple",Staple);
	}
}
