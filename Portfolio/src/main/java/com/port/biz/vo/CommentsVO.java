package com.port.biz.vo;

import java.util.Date;

public class CommentsVO {
	private int coseq;
	private int pseq;
	private int roomNum;
	private String content;
	private String writer;
	private Date regDate;
	private Date modifydate;

	public int getCoseq() {
		return coseq;
	}

	public void setCoseq(int coseq) {
		this.coseq = coseq;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getModifydate() {
		return modifydate;
	}

	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}

	@Override
	public String toString() {
		return "CommentsVO [coseq=" + coseq + ", pseq=" + pseq + ", roomNum=" + roomNum + ", content=" + content
				+ ", writer=" + writer + ", regDate=" + regDate + ", modifydate=" + modifydate + "]";
	}

}
