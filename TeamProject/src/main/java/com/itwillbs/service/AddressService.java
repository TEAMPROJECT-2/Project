package com.itwillbs.service;

import java.util.List;


import com.itwillbs.domain.AddressDTO;

public interface AddressService {
	
	// 배송지 저장
	public void insertAddress(AddressDTO addressDTO);
	
	// 배송지 수정
	public void updateAddress(AddressDTO addressDTO);
	
	// 배송지 불러오기
	public AddressDTO getAddress(String userId);
	
	public abstract List<AddressDTO> getAddressList(int num );
}
