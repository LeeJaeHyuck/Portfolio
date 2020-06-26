package com.port.biz.vo;

public class RoomVO {

	private int roomNum;
	private int person;
	private int price;
	private String image;

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "RoomVO [roomNum=" + roomNum + ", person=" + person + ", price=" + price + ", image=" + image + "]";
	}

}
