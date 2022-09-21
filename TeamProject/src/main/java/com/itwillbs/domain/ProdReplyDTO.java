package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProdReplyDTO {

	private int replyNum;
	private int prodLNum;
	private String userId;
	private String content;
	private double rating;
	private Timestamp replyDate;

	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public int getProdLNum() {
		return prodLNum;
	}
	public void setProdLNum(int prodLNum) {
		this.prodLNum = prodLNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "ProdReplyDTO [replyNum=" + replyNum + ", prodLNum=" + prodLNum + ", userId=" + userId + ", content="
				+ content + ", rating=" + rating + ", replyDate=" + replyDate + "]";
	}

}