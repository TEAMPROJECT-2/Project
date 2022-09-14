package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProdDTO extends PageDTO {

	private int prodLNum;
	private String prodLCode;
	private String prodLOption1;
	private String prodLOption2;
	private String prodLOption3;
	private String prodLOption4;
	private String prodLOption5;
	private String prodLProdnm;
	private int prodLPrice;
	private Timestamp prodLUploaddate;
	private String prodLCompnm;
	private String prodLMainimg;
	private String prodLSubimg;
	private String prodLDetail;
	private int prodLQuantity;
	private String srhText;

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

	public String getProdLOption3() {
		return prodLOption3;
	}
	public void setProdLOption3(String prodLOption3) {
		this.prodLOption3 = prodLOption3;
	}
	public String getProdLOption4() {
		return prodLOption4;
	}
	public void setProdLOption4(String prodLOption4) {
		this.prodLOption4 = prodLOption4;
	}
	public String getProdLOption5() {
		return prodLOption5;
	}
	public void setProdLOption5(String prodLOption5) {
		this.prodLOption5 = prodLOption5;
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
	public Timestamp getProdLUploaddate() {
		return prodLUploaddate;
	}
	public void setProdLUploaddate(Timestamp prodLUploaddate) {
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
	public int getProdLQuantity() {
		return prodLQuantity;
	}
	public void setProdLQuantity(int prodLQuantity) {
		this.prodLQuantity = prodLQuantity;
	}
	public String getSrhText() {
		return srhText;
	}
	public void setSrhText(String srhText) {
		this.srhText = srhText;
	}

}