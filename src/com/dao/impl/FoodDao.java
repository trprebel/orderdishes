package com.dao.impl;

import java.util.List;

import com.bean.Food;
import com.util.Program;

public class FoodDao {

	/**查找菜单总数*/
	public Integer findFoodCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findFoodCount");
	}

	/**查找菜单列表*/
	public List<Food> findFoodList(Program program ) throws Exception{
		return (List<Food>) SqlMap.getSqlMapClient().queryForList("findFoodList",program);
	}
	/**删除菜*/
	public void deleteFood(int Foodid) throws Exception{
		SqlMap.getSqlMapClient().delete("deleteFood",Foodid);
	}
}
