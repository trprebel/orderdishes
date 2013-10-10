package com.dao.impl;

import java.util.List;

import com.bean.Drinks;
import com.bean.Food;
import com.util.Program;

public class DrinksDao {

	/**查找酒水总数*/
	public Integer findDrinksCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findDrinksCount");
	}

	/**查找酒水列表*/
	public List<Drinks> findDrinksList(Program program ) throws Exception{
		return (List<Drinks>) SqlMap.getSqlMapClient().queryForList("findDrinksList",program);
	}
	/**删除酒水 */
	public void deleteDrink(int drinksid) throws Exception{
		SqlMap.getSqlMapClient().delete("deleteDrink",drinksid);
	}
	/**添加酒水*/
	public void addDrink(Drinks drinks) throws Exception{
		SqlMap.getSqlMapClient().insert("addDrink",drinks);
	}
	/**通过ID查找酒水*/
	public Drinks findDrinkById(int id) throws Exception{
		return (Drinks) SqlMap.getSqlMapClient().queryForObject("findDrinkById",id);
		
	}
}
