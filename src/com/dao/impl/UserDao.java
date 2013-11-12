package com.dao.impl;

import com.bean.User;

public class UserDao {

	//通过用户名查询信息
	public User findUserByName(String username) throws Exception {
		//System.out.println(username);
		return (User)SqlMap.getSqlMapClient().queryForObject("findUserByName",username);
	}
	//修改密码
	public void modifyPassWord(User user) throws Exception{
		SqlMap.getSqlMapClient().update("modifypasswd",user);
	}
	//添加用户
	public void addUser(User user) throws Exception{
		SqlMap.getSqlMapClient().insert("addUser",user);
	}
}
