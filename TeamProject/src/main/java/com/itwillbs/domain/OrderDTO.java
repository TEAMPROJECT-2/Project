package com.itwillbs.domain;

import java.sql.Timestamp;

public class OrderDTO {
	private int num;
	private String ordGetUser;
	private String ordGetAddress;
	private String ordGetEmail;
	private String ordGetPhone;
	private String ordDeliveryMessage;
	private Timestamp ordDate;
	private String ordPayment;
	private int ordTotalPrice;
	private int ordSavedpoint;
	private int ordCouponDiscountPrice;
	private int ordUsepoint;
	private int ordFinalPrice;
	private String ordPurchaseStatus;
	private int ordDeliveryPrice;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOrdGetUser() {
		return ordGetUser;
	}
	public void setOrdGetUser(String ordGetUser) {
		this.ordGetUser = ordGetUser;
	}
	public String getOrdGetAddress() {
		return ordGetAddress;
	}
	public void setOrdGetAddress(String ordGetAddress) {
		this.ordGetAddress = ordGetAddress;
	}
	public String getOrdGetEmail() {
		return ordGetEmail;
	}
	public void setOrdGetEmail(String ordGetEmail) {
		this.ordGetEmail = ordGetEmail;
	}
	public String getOrdGetPhone() {
		return ordGetPhone;
	}
	public void setOrdGetPhone(String ordGetPhone) {
		this.ordGetPhone = ordGetPhone;
	}
	public String getOrdDeliveryMessage() {
		return ordDeliveryMessage;
	}
	public void setOrdDeliveryMessage(String ordDeliveryMessage) {
		this.ordDeliveryMessage = ordDeliveryMessage;
	}
	public Timestamp getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(Timestamp ordDate) {
		this.ordDate = ordDate;
	}
	public String getOrdPayment() {
		return ordPayment;
	}
	public void setOrdPayment(String ordPayment) {
		this.ordPayment = ordPayment;
	}
	public int getOrdTotalPrice() {
		return ordTotalPrice;
	}
	public void setOrdTotalPrice(int ordTotalPrice) {
		this.ordTotalPrice = ordTotalPrice;
	}
	public int getOrdSavedpoint() {
		return ordSavedpoint;
	}
	public void setOrdSavedpoint(int ordSavedpoint) {
		this.ordSavedpoint = ordSavedpoint;
	}
	public int getOrdCouponDiscountPrice() {
		return ordCouponDiscountPrice;
	}
	public void setOrdCouponDiscountPrice(int ordCouponDiscountPrice) {
		this.ordCouponDiscountPrice = ordCouponDiscountPrice;
	}
	public int getOrdUsepoint() {
		return ordUsepoint;
	}
	public void setOrdUsepoint(int ordUsepoint) {
		this.ordUsepoint = ordUsepoint;
	}
	public int getOrdFinalPrice() {
		return ordFinalPrice;
	}
	public void setOrdFinalPrice(int ordFinalPrice) {
		this.ordFinalPrice = ordFinalPrice;
	}
	public String getOrdPurchaseStatus() {
		return ordPurchaseStatus;
	}
	public void setOrdPurchaseStatus(String ordPurchaseStatus) {
		this.ordPurchaseStatus = ordPurchaseStatus;
	}
	public int getOrdDeliveryPrice() {
		return ordDeliveryPrice;
	}
	public void setOrdDeliveryPrice(int ordDeliveryPrice) {
		this.ordDeliveryPrice = ordDeliveryPrice;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [num=" + num + ", ordGetUser=" + ordGetUser + ", ordGetAddress=" + ordGetAddress
				+ ", ordGetEmail=" + ordGetEmail + ", ordGetPhone=" + ordGetPhone + ", ordDeliveryMessage="
				+ ordDeliveryMessage + ", ordDate=" + ordDate + ", ordPayment=" + ordPayment + ", ordTotalPrice="
				+ ordTotalPrice + ", ordSavedpoint=" + ordSavedpoint + ", ordCouponDiscountPrice="
				+ ordCouponDiscountPrice + ", ordUsepoint=" + ordUsepoint + ", ordFinalPrice=" + ordFinalPrice
				+ ", ordPurchaseStatus=" + ordPurchaseStatus + ", ordDeliveryPrice=" + ordDeliveryPrice + "]";
	}

	
	
	
	
	
	

	
	
}
