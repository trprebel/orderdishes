package com.dao.impl;

import java.util.List;

import com.bean.Drinks;
import com.bean.Food;
import com.bean.OrderSpecial;
import com.bean.Staple;

public class OrderDao {

	public List<OrderSpecial> findMyOrder(String tempcus) throws Exception
	{
		return (List<OrderSpecial>)SqlMap.getSqlMapClient().queryForList("findMyOrder",tempcus);
	}
	public void overBook(OrderSpecial orderSpecial) throws Exception
	{
		SqlMap.getSqlMapClient().update("overBook", orderSpecial);
	}
	public List<Food> findAllFood() throws Exception
	{
		return (List<Food>)SqlMap.getSqlMapClient().queryForList("findAllFood");
	}
	public List<Drinks> findAllDrinks() throws Exception
	{
		return (List<Drinks>)SqlMap.getSqlMapClient().queryForList("findAllDrinks");
	}
	public List<Staple> findAllStaple() throws Exception
	{
		return (List<Staple>)SqlMap.getSqlMapClient().queryForList("findAllStaple");
	}
}
