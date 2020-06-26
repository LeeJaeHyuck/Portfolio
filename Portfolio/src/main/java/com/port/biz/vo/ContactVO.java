package com.port.biz.vo;

import java.util.Date;

public class ContactVO {

	private int cseq;
	private String title;
	private String content;
	private String reply;
	private String id;
	private int pseq;
	private String rep;
	private Date regdate;

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public String getRep() {
		return rep;
	}

	public void setRep(String rep) {
		this.rep = rep;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ContactVO [cseq=" + cseq + ", title=" + title + ", content=" + content + ", reply=" + reply + ", id="
				+ id + ", pseq=" + pseq + ", rep=" + rep + ", regdate=" + regdate + "]";
	}

}
