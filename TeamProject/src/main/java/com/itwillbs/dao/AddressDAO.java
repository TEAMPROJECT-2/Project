package com.itwillbs.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.itwillbs.domain.AddressDTO;

public interface AddressDAO {

	public void insertAddress(AddressDTO addressDTO);
	
	public void updateAddress(AddressDTO addressDTO);
	
	public AddressDTO getAddress(String userId);
	
	public void insertAddressPro(AddressDTO addressDTO);
	
	public void updateAddressPro(AddressDTO addressDTO);
	
	public abstract List<AddressDTO> getAddressList(SqlSessionTemplate session, int num );

}
