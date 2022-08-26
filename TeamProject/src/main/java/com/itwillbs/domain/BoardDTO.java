package com.itwillbs.domain;

import java.sql.Timestamp;

public class BoardDTO {
	
	private int boardNum;
	private String userNicknm;
	private String boardSubject;
	private String boardContent;
	private int boardRecount;
	private Timestamp boardDate;
	private String boardFile;
	
	public int getBoardNum() {
		return boardNum;
	}
	public String getUserNicknm() {
		return userNicknm;
	}
	public String getBoardSubject() {
		return boardSubject;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public int getBoardRecount() {
		return boardRecount;
	}
	public Timestamp getBoardDate() {
		return boardDate;
	}
	public String getBoardFile() {
		return boardFile;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public void setUserNicknm(String userNicknm) {
		this.userNicknm = userNicknm;
	}
	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public void setBoardRecount(int boardRecount) {
		this.boardRecount = boardRecount;
	}
	public void setBoardDate(Timestamp boardDate) {
		this.boardDate = boardDate;
	}
	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}
	
	
	
	
	
	
	
}
