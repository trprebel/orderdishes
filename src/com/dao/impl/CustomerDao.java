package com.dao.impl;

import java.util.List;

import com.bean.Customer;

public class CustomerDao {
	//���ҿͻ��б�
	public List<Customer> findCustomerList() throws Exception{
		return (List<Customer>) SqlMap.getSqlMapClient().queryForList("findCustomerList");
	}

}
