package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProdDTO {
	
	private String prodLNum;
	private String prodLType;
	private String prodLNm;
	private int prodLPrice;
    private Timestamp prodLUpdate;
    private String prodLCompNm;
    private String prodLProdImg;
	private String ProdLDetail; 
    
    public String getProdLNum() {
		return prodLNum;
	}
	public void setProdLNum(String prodLNum) {
		this.prodLNum = prodLNum;
	}
	public String getProdLType() {
		return prodLType;
	}
	public void setProdLType(String prodLType) {
		this.prodLType = prodLType;
	}
	public String getProdLNm() {
		return prodLNm;
	}
	public void setProdLNm(String prodLNm) {
		this.prodLNm = prodLNm;
	}
	public int getProdLPrice() {
		return prodLPrice;
	}
	public void setProdLPrice(int prodLPrice) {
		this.prodLPrice = prodLPrice;
	}
	public Timestamp getProdLUpdate() {
		return prodLUpdate;
	}
	public void setProdLUpdate(Timestamp prodLUpdate) {
		this.prodLUpdate = prodLUpdate;
	}
	public String getProdLCompNm() {
		return prodLCompNm;
	}
	public void setProdLCompNm(String prodLCompNm) {
		this.prodLCompNm = prodLCompNm;
	}
	public String getProdLProdImg() {
		return prodLProdImg;
	}
	public void setProdLProdImg(String prodLProdImg) {
		this.prodLProdImg = prodLProdImg;
	}
	public String getProdLDetail() {
		return ProdLDetail;
	}
	public void setProdLDetail(String prodLDetail) {
		ProdLDetail = prodLDetail;
	} 
    
    
    
    
}
