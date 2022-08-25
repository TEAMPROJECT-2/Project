package com.itwillbs.domain;

import java.sql.Timestamp;

public class CompDTO {

	private int companyInfoNum;
	private String compId;
	private String compPass;
	private String compEmail;
	private String compRegNum;
	private String compZipcode;
	private String compAddress;
	private String compAddressDetails;
	private String compPhone;
	private int compType;
	private Timestamp compDate;


	public int getCompanyInfoNum() {
		return companyInfoNum;
	}
	public void setCompanyInfoNum(int companyInfoNum) {
		this.companyInfoNum = companyInfoNum;
	}
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getCompPass() {
		return compPass;
	}
	public void setCompPass(String compPass) {
		this.compPass = compPass;
	}
	public String getCompEmail() {
		return compEmail;
	}
	public void setCompEmail(String compEmail) {
		this.compEmail = compEmail;
	}
	public String getCompRegNum() {
		return compRegNum;
	}
	public void setCompRegNum(String compRegNum) {
		this.compRegNum = compRegNum;
	}
	public String getCompZipcode() {
		return compZipcode;
	}
	public void setCompZipcode(String compZipcode) {
		this.compZipcode = compZipcode;
	}
	public String getCompAddress() {
		return compAddress;
	}
	public void setCompAddress(String compAddress) {
		this.compAddress = compAddress;
	}
	public String getCompAddressDetails() {
		return compAddressDetails;
	}
	public void setCompAddressDetails(String compAddressDetails) {
		this.compAddressDetails = compAddressDetails;
	}
	public String getCompPhone() {
		return compPhone;
	}
	public void setCompPhone(String compPhone) {
		this.compPhone = compPhone;
	}
	public int getCompType() {
		return compType;
	}
	public void setCompType(int compType) {
		this.compType = compType;
	}
	public Timestamp getCompDate() {
		return compDate;
	}
	public void setCompDate(Timestamp compDate) {
		this.compDate = compDate;
	}


	@Override
	public String toString() {
		return "CompDTO [companyInfoNum=" + companyInfoNum + ", compId=" + compId + ", compPass=" + compPass
				+ ", compEmail=" + compEmail + ", compRegNum=" + compRegNum + ", compZipcode=" + compZipcode
				+ ", compAddress=" + compAddress + ", compAddressDetails=" + compAddressDetails + ", compPhone="
				+ compPhone + ", compType=" + compType + ", compDate=" + compDate + "]";
	}




}
