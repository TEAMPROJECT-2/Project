package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProdDAO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class ProdServiceImpl implements ProdService{

//	객체생성 부모=자식
	@Inject
	private ProdDAO prodDAO;

	@Override
	public List<ProdDTO> selectProdList(ProdDTO prodDTO) {
		int startRow=(prodDTO.getCurrentPage()-1)*prodDTO.getPageSize()+1;
		int endRow=startRow+prodDTO.getPageSize()-1;

		prodDTO.setStartRow(startRow-1);
		prodDTO.setEndRow(endRow);

		PageDTO test = (PageDTO)prodDTO;
		System.out.println("=============================");
		System.out.println(test);

		return prodDAO.selectProdList(prodDTO);
	}

	@Override
	public int selectProdListCnt(ProdDTO prodDTO) {
		int startRow=(prodDTO.getCurrentPage()-1)*prodDTO.getPageSize()+1;
		int endRow=startRow+prodDTO.getPageSize()-1;

		prodDTO.setStartRow(startRow-1);
		prodDTO.setEndRow(endRow);

		return prodDAO.selectProdListCnt(prodDTO);
	}

	@Override
	public ProdDTO selectProdDetail(ProdDTO prodDTO) {
		return prodDAO.selectProdDetail(prodDTO);
	}

	/* 상품 id 이름 */
	@Override
	public ProdDTO getProdNumName(int prodLNum) {
		return prodDAO.getProdNumName(prodLNum);
	}

}