package com.itwillbs.domain;

import java.sql.Timestamp;

public class BoardDTO {
	
	private int BOARD_NUM;
	private String USER_NICKNM;
	private String BOARD_SUBJECT;
	private String BOARD_CONTENT;
	private int BOARD_READCOUNT;
	private Timestamp BOARD_DATE;
	private String BOARD_FILE;
	
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public String getUSER_NICKNM() {
		return USER_NICKNM;
	}
	public String getBOARD_SUBJECT() {
		return BOARD_SUBJECT;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public int getBOARD_READCOUNT() {
		return BOARD_READCOUNT;
	}
	public Timestamp getBOARD_DATE() {
		return BOARD_DATE;
	}
	public String getBOARD_FILE() {
		return BOARD_FILE;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public void setUSER_NICKNM(String uSER_NICKNM) {
		USER_NICKNM = uSER_NICKNM;
	}
	public void setBOARD_SUBJECT(String bOARD_SUBJECT) {
		BOARD_SUBJECT = bOARD_SUBJECT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public void setBOARD_READCOUNT(int bOARD_READCOUNT) {
		BOARD_READCOUNT = bOARD_READCOUNT;
	}
	public void setBOARD_DATE(Timestamp bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
	public void setBOARD_FILE(String bOARD_FILE) {
		BOARD_FILE = bOARD_FILE;
	}
	
	
	
	
}
