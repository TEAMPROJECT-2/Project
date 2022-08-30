package com.itwillbs.domain;

public class LikeDTO {
	
	private int Num;
	private int boardNum;
	private int userNum;
	private int LikeNum;
	
	public int getNum() {
		return Num;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public int getUserNum() {
		return userNum;
	}
	public int getLikeNum() {
		return LikeNum;
	}
	public void setNum(int num) {
		Num = num;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public void setLikeNum(int likeNum) {
		LikeNum = likeNum;
	}
	@Override
	public String toString() {
		return "LikeDTO [Num=" + Num + ", boardNum=" + boardNum + ", userNum=" + userNum + ", LikeNum=" + LikeNum + "]";
	}
	
	
	
	
	

}
