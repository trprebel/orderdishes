package com.dao.impl;

import com.bean.User;

public class UserDao {

	//ͨ���û�����ѯ��Ϣ
	public User findUserByName(String username) throws Exception {
		//System.out.println(username);
		return (User)SqlMap.getSqlMapClient().queryForObject("findUserByName",username);
	}
	//�޸�����
	public void modifyPassWord(User user) throws Exception{
		SqlMap.getSqlMapClient().update("modifypasswd",user);
	}
}
