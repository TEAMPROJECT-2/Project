package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProdDTO extends PageDTO {

	private int prodLNum;
	private String prodLCode;
	private String prodLOption1;
	private String prodLOption2;
	private String prodLProdnm;
	private int prodLPrice;
	private String prodLUploaddate;
	private String prodLCompnm;
	private String prodLMainimg;
	private String prodLSubimg;
	private String prodLDetail;

	public int getProdLNum() {
		return prodLNum;
	}
	public void setProdLNum(int prodLNum) {
		this.prodLNum = prodLNum;
	}
	public String getProdLCode() {
		return prodLCode;
	}
	public void setProdLCode(String prodLCode) {
		this.prodLCode = prodLCode;
	}
	public String getProdLOption1() {
		return prodLOption1;
	}
	public void setProdLOption1(String prodLOption1) {
		this.prodLOption1 = prodLOption1;
	}
	public String getProdLOption2() {
		return prodLOption2;
	}
	public void setProdLOption2(String prodLOption2) {
		this.prodLOption2 = prodLOption2;
	}
	public String getProdLProdnm() {
		return prodLProdnm;
	}
	public void setProdLProdnm(String prodLProdnm) {
		this.prodLProdnm = prodLProdnm;
	}
	public int getProdLPrice() {
		return prodLPrice;
	}
	public void setProdLPrice(int prodLPrice) {
		this.prodLPrice = prodLPrice;
	}
	public String getProdLUploaddate() {
		return prodLUploaddate;
	}
	public void setProdLUploaddate(String prodLUploaddate) {
		this.prodLUploaddate = prodLUploaddate;
	}
	public String getProdLCompnm() {
		return prodLCompnm;
	}
	public void setProdLCompnm(String prodLCompnm) {
		this.prodLCompnm = prodLCompnm;
	}
	public String getProdLMainimg() {
		return prodLMainimg;
	}
	public void setProdLMainimg(String prodLMainimg) {
		this.prodLMainimg = prodLMainimg;
	}
	public String getProdLSubimg() {
		return prodLSubimg;
	}
	public void setProdLSubimg(String prodLSubimg) {
		this.prodLSubimg = prodLSubimg;
	}
	public String getProdLDetail() {
		return prodLDetail;
	}
	public void setProdLDetail(String prodLDetail) {
		this.prodLDetail = prodLDetail;
	}

}