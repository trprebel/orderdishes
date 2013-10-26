package com.dao.impl;

import java.util.List;

import com.bean.OrderSpecial;

public class OrderDao {

	public List<OrderSpecial> findMyOrder(String tempcus) throws Exception
	{
		return (List<OrderSpecial>)SqlMap.getSqlMapClient().queryForList("findMyOrder",tempcus);
	}
	public void overBook(OrderSpecial orderSpecial) throws Exception
	{
		SqlMap.getSqlMapClient().update("overBook", orderSpecial);
	}
}
