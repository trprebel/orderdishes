package com.dao.impl;

import java.util.List;

import com.bean.Drinks;
import com.util.Program;

public class DrinksDao {

	//查找酒水总数
	public Integer findDrinksCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findDrinksCount");
	}
	//查找酒水列表
	public List<Drinks> findDrinksList(Program program ) throws Exception{
		return (List<Drinks>) SqlMap.getSqlMapClient().queryForList("findDrinksList",program);
	}
}
