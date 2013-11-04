package com.dao.impl;

import java.util.List;

import com.bean.Staple;
import com.util.Program;

public class StapleDao {

	/**������ʳ����*/
	public Integer findStapleCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findStapleCount");
	}

	/**������ʳ�б�*/
	public List<Staple> findStapleList(Program program ) throws Exception{
		return (List<Staple>) SqlMap.getSqlMapClient().queryForList("findStapleList",program);
	}
	/**ɾ����ʳ */
	public void deleteStaple(int Stapleid) throws Exception{
		SqlMap.getSqlMapClient().delete("deleteStaple",Stapleid);
	}
	/**�����ʳ*/
	public void addStaple(Staple Staple) throws Exception{
		SqlMap.getSqlMapClient().insert("addStaple",Staple);
	}
	/**ͨ��ID������ʳ*/
	public Staple findStapleById(int id) throws Exception{
		return (Staple) SqlMap.getSqlMapClient().queryForObject("findStapleById",id);
		
	}
	/**�޸���ʳ����*/
	public void modifyStaple(Staple Staple) throws Exception{
		SqlMap.getSqlMapClient().update("modifyStaple",Staple);
	}
}
