package com.dao.impl;

import java.util.List;

import com.bean.Drinks;
import com.util.Program;

public class DrinksDao {

	//���Ҿ�ˮ����
	public Integer findDrinksCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findDrinksCount");
	}
	//���Ҿ�ˮ�б�
	public List<Drinks> findDrinksList(Program program ) throws Exception{
		return (List<Drinks>) SqlMap.getSqlMapClient().queryForList("findDrinksList",program);
	}
}
