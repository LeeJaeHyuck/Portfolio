package com.port.biz.vo;

import java.util.Date;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String regidentNum;
	private String postNum;
	private String addr1;
	private String addr2;
	private String phone;
	private String useyn;
	private Date regdate;
	private int authority;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegidentNum() {
		return regidentNum;
	}

	public void setRegidentNum(String regidentNum) {
		this.regidentNum = regidentNum;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
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

	public String getUseyn() {
		return useyn;
	}

	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", regidentNum="
				+ regidentNum + ", postNum=" + postNum + ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone=" + phone
				+ ", useyn=" + useyn + ", regdate=" + regdate + ", authority=" + authority + "]";
	}

}
