package com.itwillbs.service;

import java.sql.Timestamp;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CompDAO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

@Service
public class CompServiceImpl implements CompService {
	@Inject
	private CompDAO compDAO;

	@Override
	public void insertProd(ProdDTO prodDTO,ProdStockDTO proStockDTO) {
		prodDTO.setProdLUpdate(new Timestamp(System.currentTimeMillis()));
		System.out.println("MemberServiceImpl insertMember()");
		// 메서드 호출
		// num = max(num)+1
		if(compDAO.getMaxNum()==null) {
			//게시판 글이 없음
			proStockDTO.setNum(1);
		}else {
			proStockDTO.setNum(compDAO.getMaxNum() + 1);
		}
		compDAO.insertProd(prodDTO,proStockDTO);
	}
	
}
