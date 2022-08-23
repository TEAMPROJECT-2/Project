package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.ProdDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	private AdminDAO adminDAO;

	@Override
	public void insertProd(ProdDTO prodDTO) {
		prodDTO.setProdLUpdate(new Timestamp(System.currentTimeMillis()));
		System.out.println("MemberServiceImpl insertMember()");
		// 메서드 호출
		adminDAO.insertProd(prodDTO);
	}
	
}
