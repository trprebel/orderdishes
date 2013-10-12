package com.bean;

import java.util.Date;

/**
 * <p>
 * 消息类
 * </p>
 * 用户保存用户发送的信息
 * 
 * @author wgq
 * 
 */
public class UserSpeakContent {

	private Date speakTime;// 最后一次发送时间
	private String speakUser;// 发送者
	private String toSpeakUser;// 发送给谁
	private String speakContent;// 发送内容
	private boolean logout;
	private int speakType;// 发送类型
	private boolean Private;
	private int userType = 1;// 用户类型,1：普通用户，2：导播，3：教师。

	public Date getSpeakTime() {
		return speakTime;
	}

	public void setSpeakTime(Date speakTime) {
		this.speakTime = speakTime;
	}

	public String getSpeakUser() {
		return speakUser;
	}

	public void setSpeakUser(String speakUser) {
		this.speakUser = speakUser;
	}

	public String getToSpeakUser() {
		return toSpeakUser;
	}

	public void setToSpeakUser(String toSpeakUser) {
		this.toSpeakUser = toSpeakUser;
	}

	public String getSpeakContent() {
		return speakContent;
	}

	public void setSpeakContent(String speakContent) {
		this.speakContent = speakContent;
	}

	public boolean isLogout() {
		return logout;
	}

	public void setLogout(boolean logout) {
		this.logout = logout;
	}

	public int getSpeakType() {
		return speakType;
	}

	public void setSpeakType(int speakType) {
		this.speakType = speakType;
	}

	public boolean isPrivate() {
		return Private;
	}

	public void setPrivate(boolean private1) {
		Private = private1;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

}
