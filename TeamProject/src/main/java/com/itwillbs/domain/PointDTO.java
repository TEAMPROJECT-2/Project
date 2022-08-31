package com.itwillbs.domain;

import java.sql.Timestamp;

public class PointDTO {
	private int point_num;
	private String user_id;
	private int point_type;
	private Timestamp point_date;
	private int point_now;
	private int point_used;
	private int point_charge;
	
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPoint_type() {
		return point_type;
	}
	public void setPoint_type(int point_type) {
		this.point_type = point_type;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public int getPoint_now() {
		return point_now;
	}
	public void setPoint_now(int point_now) {
		this.point_now = point_now;
	}
	public int getPoint_used() {
		return point_used;
	}
	public void setPoint_used(int point_used) {
		this.point_used = point_used;
	}
	public int getPoint_charge() {
		return point_charge;
	}
	public void setPoint_charge(int point_charge) {
		this.point_charge = point_charge;
	}
}
