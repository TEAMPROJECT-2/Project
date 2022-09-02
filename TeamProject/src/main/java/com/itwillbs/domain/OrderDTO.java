package com.itwillbs.domain;

import java.sql.Timestamp;

public class OrderDTO {
	private int num;
	private int ordProNum;
	private String ordProType;
	private String ordProNm;
	private int ordQuantity;
	private String ordUser;
	private String ordGetUser;
	private String ordGetAddress;
	private String ordGetEmail;
	private String ordGetPhone;
	private String ordDeliveryMessage;
	private String ordCustomerNm;
	private Timestamp ordDate;
	private String ordPayment;
	private int ordTotalPrice;
	private int ordSavedpoint;
	private int ordCouponDiscountPrice;
	private int ordUsepoint;
	private int ordFinalPrice;
	private String ordPurchaseStatus;
	private int ordDeliveryPrice;
	private String ordGetNm;

	
	public String getOrdGetNm() {
		return ordGetNm;
	}
	public void setOrdGetNm(String ordGetNm) {
		this.ordGetNm = ordGetNm;
	}
	public int getOrdDeliveryPrice() {
		return ordDeliveryPrice;
	}
	public void setOrdDeliveryPrice(int ordDeliveryPrice) {
		this.ordDeliveryPrice = ordDeliveryPrice;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getOrdProNum() {
		return ordProNum;
	}
	public void setOrdProNum(int ordProNum) {
		this.ordProNum = ordProNum;
	}
	public String getOrdProType() {
		return ordProType;
	}
	public void setOrdProType(String ordProType) {
		this.ordProType = ordProType;
	}
	public String getOrdProNm() {
		return ordProNm;
	}
	public void setOrdProNm(String ordProNm) {
		this.ordProNm = ordProNm;
	}
	public int getOrdQuantity() {
		return ordQuantity;
	}
	public void setOrdQuantity(int ordQuantity) {
		this.ordQuantity = ordQuantity;
	}
	public String getOrdUser() {
		return ordUser;
	}
	public void setOrdUser(String ordUser) {
		this.ordUser = ordUser;
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
	public String getOrdCustomerNm() {
		return ordCustomerNm;
	}
	public void setOrdCustomerNm(String ordCustomerNm) {
		this.ordCustomerNm = ordCustomerNm;
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
	@Override
	public String toString() {
		return "OrderDTO [num=" + num + ", ordProNum=" + ordProNum + ", ordProType=" + ordProType + ", ordProNm="
				+ ordProNm + ", ordQuantity=" + ordQuantity + ", ordUser=" + ordUser + ", ordGetUser=" + ordGetUser
				+ ", ordGetAddress=" + ordGetAddress + ", ordGetEmail=" + ordGetEmail + ", ordGetPhone=" + ordGetPhone
				+ ", ordDeliveryMessage=" + ordDeliveryMessage + ", ordCustomerNm=" + ordCustomerNm + ", ordDate="
				+ ordDate + ", ordPayment=" + ordPayment + ", ordTotalPrice=" + ordTotalPrice + ", ordSavedpoint="
				+ ordSavedpoint + ", ordCouponDiscountPrice=" + ordCouponDiscountPrice + ", ordUsepoint=" + ordUsepoint
				+ ", ordFinalPrice=" + ordFinalPrice + ", ordPurchaseStatus=" + ordPurchaseStatus
				+ ", ordDeliveryPrice=" + ordDeliveryPrice + ", ordGetNm=" + ordGetNm + "]";
	}
	
	
	
	
	

	
	
}
