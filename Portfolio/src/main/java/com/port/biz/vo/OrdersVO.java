package com.port.biz.vo;

import java.util.Date;

public class OrdersVO {

	private int odseq;
	private int oseq;
	private String id;
	private Date regdate;
	private String mname;
	private String postNum;
	private String addr1;
	private String addr2;
	private String phone;
	private int pseq;
	private String pname;
	private int quantity;
	private int price2;
	private String result;

	public int getOdseq() {
		return odseq;
	}

	public void setOdseq(int odseq) {
		this.odseq = odseq;
	}

	public int getOseq() {
		return oseq;
	}

	public void setOseq(int oseq) {
		this.oseq = oseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getpostNum() {
		return postNum;
	}

	public void setpostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice2() {
		return price2;
	}

	public void setPrice2(int price2) {
		this.price2 = price2;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String toString() {
		return "OrdersVO [odseq=" + odseq + ", oseq=" + oseq + ", id=" + id + ", regdate=" + regdate + ", mname=" + mname
				+ ", postNum=" + postNum + ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone=" + phone + ", pseq="
				+ pseq + ", pname=" + pname + ", quantity=" + quantity + ", price2=" + price2 + ", result=" + result
				+ "]";
	}

}
