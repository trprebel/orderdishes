package com.dao.impl;

import java.util.List;

import com.bean.Food;
import com.util.Program;

public class FoodDao {

	/**���Ҳ˵�����*/
	public Integer findFoodCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findFoodCount");
	}

	/**���Ҳ˵��б�*/
	public List<Food> findFoodList(Program program ) throws Exception{
		return (List<Food>) SqlMap.getSqlMapClient().queryForList("findFoodList",program);
	}
	/**ɾ����*/
	public void deleteFood(int Foodid) throws Exception{
		SqlMap.getSqlMapClient().delete("deleteFood",Foodid);
	}
	/**��Ӳ�*/
	public void addFood(Food food) throws Exception{
		SqlMap.getSqlMapClient().insert("addFood",food);
	}
	/**ͨ��ID���Ҳ�*/
	public Food findFoodById(int id) throws Exception{
		return (Food) SqlMap.getSqlMapClient().queryForObject("findFoodById",id);
		
	}
	/**�޸Ĳ�����*/
	public void modifyFood(Food food) throws Exception {
		SqlMap.getSqlMapClient().update("modifyFood",food);
	}
}
