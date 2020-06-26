package com.port.biz.vo;

public class AddressVO {

	private String postNum;
	private String sido;
	private String gugun;
	private String dong;
	private String zipCode;
	private String bunji;

	public String getpostNum() {
		return postNum;
	}

	public void setpostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getBunji() {
		return bunji;
	}

	public void setBunji(String bunji) {
		this.bunji = bunji;
	}

	@Override
	public String toString() {
		return "AddressVO [postNum=" + postNum + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong + ", zipCode="
				+ zipCode + ", bunji=" + bunji + "]";
	}

}
