package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CompDAO;
import com.itwillbs.domain.CompDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProdDTO;
import com.itwillbs.domain.ProdStockDTO;

@Service
public class CompServiceImpl implements CompService {
	@Inject
	private CompDAO compDAO;
	//상품등록
	@Override
	public void insertProd(ProdDTO prodDTO) {
		prodDTO.setProdLUpdate(new Timestamp(System.currentTimeMillis()));

		compDAO.insertProd(prodDTO);
	}


    // 상품게시판list
	@Override
	public List<ProdDTO> getProdList(PageDTO pageDTO) {
		// pageSize  pageNum  currentPage
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow=startRow+pageDTO.getPageSize()-1;

		// sql => limit #{startRow -1}, #{pageSize}

		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);

		return compDAO.getProdList(pageDTO);
	}
	@Override
	public int getProdCount() {
		return compDAO.getProdCount();
	}
	@Override
	public ProdDTO getProd(String prodLCode) {
		return compDAO.getProd(prodLCode);
	}


	// 상품삭제
	@Override
	public void deleteProd(String prodLCode) {
		compDAO.deleteProd(prodLCode);
	}
	// 상품 수정
	@Override
	public void updateProd(ProdDTO prodDTO) {
		compDAO.updateProd(prodDTO);
	}


	// 업체 정보 갖고 오기
	@Override
	public CompDTO getComp(CompDTO compDTO) {
		return compDAO.getComp(compDTO);
	}



}

