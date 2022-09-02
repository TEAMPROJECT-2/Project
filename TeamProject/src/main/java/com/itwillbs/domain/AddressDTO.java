package com.itwillbs.domain;

public class AddressDTO {
	
	private String userId;
	private int addressZipcode;
	private String address;
	private String addressDetails;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAddressZipcode() {
		return addressZipcode;
	}
	public void setAddressZipcode(int addressZipcode) {
		this.addressZipcode = addressZipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetails() {
		return addressDetails;
	}
	public void setAddressDetails(String addressDetails) {
		this.addressDetails = addressDetails;
	}
	
	@Override
	public String toString() {
		return "AddressDTO [userId=" + userId + ", addressZipcode=" + addressZipcode + ", address=" + address
				+ ", addressDetails=" + addressDetails + "]";
	}
	
	
	
}
