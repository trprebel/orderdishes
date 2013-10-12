package com.bean;

public class SystemUserInfo {

	private String userName;//用户名
	private int userType;//用户类型，讲师，导播，

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

}
