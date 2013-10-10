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
	/**添加菜*/
	public void addFood(Food food) throws Exception{
		SqlMap.getSqlMapClient().insert("addFood",food);
	}
	/**通过ID查找菜*/
	public Food findFoodById(int id) throws Exception{
		return (Food) SqlMap.getSqlMapClient().queryForObject("findFoodById",id);
		
	}
	/**修改菜属性*/
	public void modifyFood(Food food) throws Exception {
		SqlMap.getSqlMapClient().update("modifyFood",food);
	}
}
