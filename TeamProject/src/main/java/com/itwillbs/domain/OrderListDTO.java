package com.itwillbs.domain;

import java.sql.Timestamp;

public class OrderListDTO {
	private int trnum;
	private int num          ;
	private String ordLCode        ;
	private String ordLUser        ;
	private int ordLQuantity    ;
	private int ordLPrice       ;
	private String ordLCounumcoudc ;
	private Timestamp ordLDate        ;
	private String compId;
	private String ordDeliveryStatus;
	private int ordFinalprice;
	private String ordLDelivNumber;
	private int count;
	private String ordPurchasestatus;


	public int getTrnum() {
		return trnum;
	}
	public void setTrnum(int trnum) {
		this.trnum = trnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOrdLCode() {
		return ordLCode;
	}
	public void setOrdLCode(String ordLCode) {
		this.ordLCode = ordLCode;
	}
	public String getOrdLUser() {
		return ordLUser;
	}
	public void setOrdLUser(String ordLUser) {
		this.ordLUser = ordLUser;
	}
	public int getOrdLQuantity() {
		return ordLQuantity;
	}
	public void setOrdLQuantity(int ordLQuantity) {
		this.ordLQuantity = ordLQuantity;
	}
	public int getOrdLPrice() {
		return ordLPrice;
	}
	public void setOrdLPrice(int ordLPrice) {
		this.ordLPrice = ordLPrice;
	}
	public String getOrdLCounumcoudc() {
		return ordLCounumcoudc;
	}
	public void setOrdLCounumcoudc(String ordLCounumcoudc) {
		this.ordLCounumcoudc = ordLCounumcoudc;
	}
	public Timestamp getOrdLDate() {
		return ordLDate;
	}
	public void setOrdLDate(Timestamp ordLDate) {
		this.ordLDate = ordLDate;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getOrdDeliveryStatus() {
		return ordDeliveryStatus;
	}
	public void setOrdDeliveryStatus(String ordDeliveryStatus) {
		this.ordDeliveryStatus = ordDeliveryStatus;
	}
	public int getOrdFinalprice() {
		return ordFinalprice;
	}
	public void setOrdFinalprice(int ordFinalprice) {
		this.ordFinalprice = ordFinalprice;
	}

	public String getOrdLDelivNumber() {
		return ordLDelivNumber;
	}
	public void setOrdLDelivNumber(String ordLDelivNumber) {
		this.ordLDelivNumber = ordLDelivNumber;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public String getOrdPurchasestatus() {
		return ordPurchasestatus;
	}
	public void setOrdPurchasestatus(String ordPurchasestatus) {
		this.ordPurchasestatus = ordPurchasestatus;
	}
	@Override
	public String toString() {
		return "OrderListDTO [ordNum=" + num + ", ordLCode=" + ordLCode + ", ordLUser=" + ordLUser
				+ ", ordLQuantity=" + ordLQuantity + ", ordLPrice=" + ordLPrice + ", ordLCounumcoudc=" + ordLCounumcoudc
				+ ", ordLDate=" + ordLDate + ", compId=" + compId + ", ordDeliveryStatus=" + ordDeliveryStatus
				+ ", ordFinalprice=" + ordFinalprice + "]";
	}


}
