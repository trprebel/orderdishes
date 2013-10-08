package com.dao.impl;

import java.util.List;

import com.bean.Drinks;
import com.util.Program;

public class DrinksDao {

	/**查找酒水总数
	 * @return
	 * @throws Exception
	 */
	public Integer findDrinksCount() throws Exception{
		return (Integer) SqlMap.getSqlMapClient().queryForObject("findDrinksCount");
	}

	/**查找酒水列表
	 * @param program
	 * @return
	 * @throws Exception
	 */
	public List<Drinks> findDrinksList(Program program ) throws Exception{
		return (List<Drinks>) SqlMap.getSqlMapClient().queryForList("findDrinksList",program);
	}
	/**删除酒水
	 * @param drinksid
	 * @throws Exception
	 */
	public void deleteDrink(int drinksid) throws Exception{
		SqlMap.getSqlMapClient().delete("deleteDrink",drinksid);
	}
}
