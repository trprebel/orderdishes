package com.dao.impl;

import java.util.List;

import com.bean.Drinks;
import com.bean.Food;
import com.util.Program;

public class DrinksDao {

	/**���Ҿ�ˮ����*/
	public Integer findDrinksCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findDrinksCount");
	}

	/**���Ҿ�ˮ�б�*/
	public List<Drinks> findDrinksList(Program program ) throws Exception{
		return (List<Drinks>) SqlMap.getSqlMapClient().queryForList("findDrinksList",program);
	}
	/**ɾ����ˮ */
	public void deleteDrink(int drinksid) throws Exception{
		SqlMap.getSqlMapClient().delete("deleteDrink",drinksid);
	}
	/**��Ӿ�ˮ*/
	public void addDrink(Drinks drinks) throws Exception{
		SqlMap.getSqlMapClient().insert("addDrink",drinks);
	}
	/**ͨ��ID���Ҿ�ˮ*/
	public Drinks findDrinkById(int id) throws Exception{
		return (Drinks) SqlMap.getSqlMapClient().queryForObject("findDrinkById",id);
		
	}
}
