package com.bean;

public class OrderSpecial {
	private int orderid;
	private int customerid;
	private String tempcus;
	private int businessid;
	private int foodid;
	private String food;
	private String specialname;
	private String small_pic;
	private int price;
	private int count;
	private int state;
	private int type;
	private String create_date;
	private String update_date;
	
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}
	public String getTempcus() {
		return tempcus;
	}
	public void setTempcus(String tempcus) {
		this.tempcus = tempcus;
	}
	public int getBusinessid() {
		return businessid;
	}
	public String getSmall_pic() {
		return small_pic;
	}
	public void setSmall_pic(String small_pic) {
		this.small_pic = small_pic;
	}
	public void setBusinessid(int businessid) {
		this.businessid = businessid;
	}
	public int getFoodid() {
		return foodid;
	}
	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}
	public String getSpecialname() {
		return specialname;
	}
	public void setSpecialname(String specialname) {
		this.specialname = specialname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}


}
