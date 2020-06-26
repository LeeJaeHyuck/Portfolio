package com.port.biz.vo;

import java.util.Date;

public class BookVO {

	private int bseq;
	private String id;
	private String phone;
	private String date;
	private Date reserveDate;
	private String roomNum;
	private int person;
	private int price;
	private Date regDate;
	private String name;
	private String result;
	
	

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Date getReserveDate() {
		return reserveDate;
	}

	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "BookVO [bseq=" + bseq + ", id=" + id + ", phone=" + phone + ", date=" + date + ", reserveDate="
				+ reserveDate + ", roomNum=" + roomNum + ", person=" + person + ", price=" + price + ", regDate="
				+ regDate + ", name=" + name + ", result=" + result + "]";
	}

}
