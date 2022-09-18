package com.itwillbs.domain;

import com.google.protobuf.Timestamp;

public class OrderListDTO extends OrderDTO{
	private int ordNum          ;
	private String ordLCode        ;
	private String ordLUser        ;
	private int ordLQuantity    ;
	private int ordLPrice       ;
	private String ordLCounumcoudc ;
	private Timestamp ordLDate        ;
	private String compId;
	private String ordDeliveryStatus;
	private int ordFinalprice;

	public int getOrdNum() {
		return ordNum;
	}
	public void setOrdNum(int ordNum) {
		this.ordNum = ordNum;
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
	@Override
	public String toString() {
		return "OrderListDTO [ordNum=" + ordNum + ", ordLCode=" + ordLCode + ", ordLUser=" + ordLUser
				+ ", ordLQuantity=" + ordLQuantity + ", ordLPrice=" + ordLPrice + ", ordLCounumcoudc=" + ordLCounumcoudc
				+ ", ordLDate=" + ordLDate + ", compId=" + compId + ", ordDeliveryStatus=" + ordDeliveryStatus
				+ ", ordFinalprice=" + ordFinalprice + "]";
	}


}
